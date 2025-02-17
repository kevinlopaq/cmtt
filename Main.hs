module Main where

import Lexer (alexScanTokens)  -- Import the lexer

main :: IO ()
main = do
    let input = "λx.x"
    let tokens = alexScanTokens input
    print tokens  -- This will print the list of tokens