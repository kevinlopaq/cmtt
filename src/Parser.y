{
module Parser where
import Syntax
import Data.Char (isDigit, isAlpha, isSpace)
import Data.List (isPrefixOf)
}

%name parse
%tokentype { Token }
%error { parseError }

%token
    unit            { UnitTyTok }
    int             { IntTyTok }
    bool            { BoolTyTok }
    "="             { EqualTok }
    "→"             { ArrowTok }
    "×"             { ProdTyTok }
    "+"             { SumTok }
    "☐"             { EmptyCtxTok }
    "@"             { AnnTok }
    ":"             { AnnSepTok }
    app             { AppTok }
    ","             { CommaTok }
    "("             { LParen }
    ")"             { RParen }
    "⟨"             { LAngleTok }
    "⟩"             { RAngleTok }
    "["             { LBrackTok }
    "]"             { RBrackTok }
    id              { IdTok $$ }
    modId           { ModIdTok $$ }
    intT            { IntTok $$ }
    true            { TrueTok }
    false           { FalseTok }
    unitTerm        { UnitTermTok }
    "\\"            { LambdaTok }
    "λ"             { LambdaTok }
    "."             { LambdaBodyTok }
    fst             { FstTok }
    snd             { SndTok }
    inl             { InlTok }
    inr             { InrTok }
    let             { LetTok }
    box             { BoxTok }
    val             { ValTok }
    in              { InTok }

%nonassoc ":" "@" app
%right "λ" "\\" "→" "->"
%nonassoc "☐"
%left "×" "+"
%nonassoc "(" ")" "[" "]"
%% 

Term : app "(" Term "," Term ")"   { App $3 $5 }
    |   intT                        { IntT $1 } 
    |   true                        { TrueT }
    |   false                       { FalseT }
    |   unitTerm                    { Unit }
    |   id                          { Var $1 }
    |   modId Subs                  { ModVar $1 $2 }
    |   modId                       { ModVar $1 [] }
    |   "\\" id "." Term            { Lam $2 $4 }                 
    |   "λ" id "." Term             { Lam $2 $4 }
    |   fst Term                    { Fst $2 }
    |   snd Term                    { Snd $2 }
    |   "⟨" Term "," Term "⟩"       { Pair $2 $4 }           
    |   inl Term                    { InL $2 }
    |   inr Term                    { InR $2 }
    |   "(" Term ")"                { $2 }
    |   "@" Term ":" Type           { Ann $2 $4 }
    |   box Context "." Term        { Box $2 $4 }
    |   box Term                    { Box [] $2 }
    |   let box modId "=" Term in Term { LetBox $3 $5 $7 }
    |   let val id "=" Term in Term { LetVal $3 $5 $7 }
    |   "(" "+" Term Term ")"       { BinOp Add $3 $4 }

Context : "[" "]"                 { [] }
        | "[" CtxElems "]"        { $2 }

CtxElems : CtxElem                { [$1] }
        |  CtxElems "," CtxElem   { $1 ++ [$3] }

CtxElem : id                      { ($1, UnspecCtxTy) }  
        | id ":" Type             { ($1, $3) }

Subs : "⟨" "⟩"                             { [] }  -- Empty substitution
    | "⟨" SubElems "⟩"                    { $2 }  -- Non-empty substitution

SubElems : SubElem                         { [$1] }  -- Single element
        | SubElems "," SubElem            { $1 ++ [$3] }  -- Multiple elements

SubElem : id "→" Term                      { ($1, $3) }  -- Single element: (x → e)

Type :  Type "→" Type         { Arrow $1 $3 }
    |   Type "×" Type         { Prod $1 $3 }
    |   Type "+" Type         { Sum $1 $3 }
    |   "(" Type ")"          { $2 }
    |   "☐" Type              { BoxTy [] $2 }
    |   Context Type          { BoxTy $1 $2 }
    |   id                    { BaseTy $1 }
    |   bool                  { BoolTy }
    |   int                   { IntTy }
    |   unit                  { UnitTy }

{
parseError :: [Token] -> a
parseError _ = error "Parse error"

data Token
    = UnitTyTok
    | IntTyTok
    | BoolTyTok
    | ArrowTok
    | ProdTyTok
    | SumTok
    | IdTok String
    | ModIdTok String
    | UnitTermTok
    | IntTok Int
    | TrueTok 
    | FalseTok
    | LambdaTok
    | LambdaBodyTok
    | FstTok 
    | SndTok
    | InlTok
    | InrTok
    | LParen
    | RParen
    | AnnTok
    | AnnSepTok
    | CommaTok
    | AppTok
    | LAngleTok
    | RAngleTok
    | LBrackTok
    | RBrackTok
    | EmptyCtxTok
    | LetTok 
    | BoxTok 
    | ValTok 
    | InTok
    | EqualTok
    deriving Show

lexer :: String -> [Token]
lexer [] = []
lexer cs
    | Just ("→", rest) <- unconsPrefix "→" cs = ArrowTok : lexer rest
    | Just ("×", rest) <- unconsPrefix "×" cs = ProdTyTok : lexer rest
    | Just ("+", rest) <- unconsPrefix "+" cs = SumTok : lexer rest
    | Just ("->", rest) <- unconsPrefix "->" cs = ArrowTok : lexer rest
    | Just (":", rest) <- unconsPrefix ":" cs = AnnSepTok : lexer rest
    | Just ("()", rest) <- unconsPrefix "()" cs = UnitTermTok : lexer rest
    | Just ("λ", rest) <- unconsPrefix "λ" cs = LambdaTok : lexer rest
    | Just ("\\", rest) <- unconsPrefix "\\\\" cs = LambdaTok : lexer rest
    | Just (".", rest) <- unconsPrefix "." cs = LambdaBodyTok : lexer rest
    | Just ("fst", rest) <- unconsPrefix "fst" cs = FstTok : lexer rest
    | Just ("snd", rest) <- unconsPrefix "snd" cs = SndTok : lexer rest
    | Just ("☐", rest) <- unconsPrefix "☐" cs = EmptyCtxTok : lexer rest
    | Just ("(", rest) <- unconsPrefix "(" cs = LParen : lexer rest
    | Just (")", rest) <- unconsPrefix ")" cs = RParen : lexer rest
    | Just ("⟨", rest) <- unconsPrefix "⟨" cs = LAngleTok : lexer rest
    | Just ("⟩", rest) <- unconsPrefix "⟩" cs = RAngleTok : lexer rest
    | Just ("[", rest) <- unconsPrefix "[" cs = LBrackTok : lexer rest
    | Just ("]", rest) <- unconsPrefix "]" cs = RBrackTok : lexer rest
    | Just ("inl", rest) <- unconsPrefix "inl" cs = InlTok : lexer rest
    | Just ("inr", rest) <- unconsPrefix "inr" cs = InrTok : lexer rest
    | Just ("app", rest) <- unconsPrefix "app" cs = AppTok : lexer rest
    | Just ("@", rest) <- unconsPrefix "@" cs = AnnTok : lexer rest
    | Just (",", rest) <- unconsPrefix "," cs = CommaTok : lexer rest
    | Just ("let", rest) <- unconsPrefix "let" cs = LetTok : lexer rest
    | Just ("box", rest) <- unconsPrefix "box" cs = BoxTok : lexer rest
    | Just ("val", rest) <- unconsPrefix "val" cs = ValTok : lexer rest
    | Just ("=", rest) <- unconsPrefix "=" cs = EqualTok : lexer rest
    | isSpace (head cs) = lexer (tail cs)
    | isAlpha (head cs) = lexId cs
    | isDigit (head cs) = lexNum cs
    | otherwise = error $ "Unexpected character: " ++ [head cs]

lexNum cs = IntTok (read num) : lexer rest
    where (num,rest) = span isDigit cs

unconsPrefix :: String -> String -> Maybe (String, String)
unconsPrefix prefix str
    | prefix `isPrefixOf` str = Just (prefix, drop (length prefix) str)
    | otherwise = Nothing

lexId cs =
    case span isAlpha cs of
    ("unit",rest) -> UnitTyTok : lexer rest
    ("bool",rest) -> BoolTyTok : lexer rest
    ("int",rest)  -> IntTyTok : lexer rest
    ("in", rest)  -> InTok : lexer rest
    ("u",rest)  -> ModIdTok "u" : lexer rest
    ("w",rest)  -> ModIdTok "w" : lexer rest
    (var,rest)   -> IdTok var : lexer rest

parseString =  parse . lexer

}