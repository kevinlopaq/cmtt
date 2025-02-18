module Main where

import Parser -- Import parser

main :: IO ()
main = do
    let tokens = lexer "λx.x :: int → int"
    print tokens
    let ast = parse tokens
    print ast