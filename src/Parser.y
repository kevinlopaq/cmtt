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
    "→"             { ArrowTok }
    "×"             { ProdTyTok }
    "+"             { SumTok }
    "::"            { AnnTok }
    "("             { LParen }
    ")"             { RParen }
    id              { IdTok $$ }
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

%right "λ" "\\" "→" "->"
%left "×" "+"
%% 

Ann :   Term "::" Type        { Ann $1 $3 }

Type :  Type "→" Type         { Arrow $1 $3 }
    |   Type "×" Type         { Prod $1 $3 }
    |   Type "+" Type         { Sum $1 $3 }
    | id                      { BaseTy $1 }
    | bool                    { BoolTy }
    | int                     { IntTy }
    | unit                    { UnitTy }

Term :  intT                  { IntT $1 } 
    |   true                  { TrueT }
    |   false                 { FalseT }
    |   unitTerm              { Unit }
    |   id                    { Var $1 }
    |   "\\" id "." Term      { Lam $2 $4 }                 
    |   "λ" id "." Term       { Lam $2 $4 }
    |   fst Term              { Fst $2 }
    |   snd Term              { Snd $2 }
    |   inl Term              { InL $2 }
    |   inr Term              { InR $2 }
    |   "(" Term ")"          { Parens $2 }

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
    deriving Show

lexer :: String -> [Token]
lexer [] = []
lexer cs
    | Just ("→", rest) <- unconsPrefix "→" cs = ArrowTok : lexer rest
    | Just ("×", rest) <- unconsPrefix "×" cs = ProdTyTok : lexer rest
    | Just ("->", rest) <- unconsPrefix "->" cs = ArrowTok : lexer rest
    | Just ("::", rest) <- unconsPrefix "::" cs = AnnTok : lexer rest
    | Just ("()", rest) <- unconsPrefix "()" cs = UnitTermTok : lexer rest
    | Just ("λ", rest) <- unconsPrefix "λ" cs = LambdaTok : lexer rest
    | Just ("\\", rest) <- unconsPrefix "\\\\" cs = LambdaTok : lexer rest
    | Just (".", rest) <- unconsPrefix "." cs = LambdaBodyTok : lexer rest
    | Just ("fst", rest) <- unconsPrefix "fst" cs = FstTok : lexer rest
    | Just ("snd", rest) <- unconsPrefix "snd" cs = SndTok : lexer rest
    | Just ("(", rest) <- unconsPrefix "(" cs = LParen : lexer rest
    | Just (")", rest) <- unconsPrefix ")" cs = RParen : lexer rest
    | Just ("inl", rest) <- unconsPrefix "inl" cs = InlTok : lexer rest
    | Just ("inr", rest) <- unconsPrefix "inr" cs = InrTok : lexer rest
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
    (var,rest)   -> IdTok var : lexer rest

parseString =  parse . lexer

}