{
module Lexer where
}

%wrapper "basic"

$digit = 0-9
$alpha = [a-zA-Z]

tokens :-
    $white+                        ;
    "--".*                         ;
    $digit+                        { \n -> IntTok (read n) }
    $alpha [$alpha $digit \_ \']*  { \s -> VarTok s }
    "lambda"                       { \_ -> LambdaTok }
    "λ"                            { \_ -> LambdaTok }
    "."                            { \_ -> LambdaBodyTok }
    "("                            { \_ -> LParenTok }
    ")"                            { \_ -> RParenTok }
    "::"                           { \_ -> AnnoTok }
{

data Token
    = UnitTok
    | TrueTok 
    | FalseTok  
    | IntTok Int
    | VarTok String
    | LambdaTok
    | LambdaBodyTok
    | LParenTok 
    | RParenTok
    | AnnoTok 
    deriving (Eq, Show)

}