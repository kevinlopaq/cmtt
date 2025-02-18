module Main where

import Parser -- Import parser

main :: IO ()
main = do
    let tokens = lexer "λp. fst p :: A×B → B"
    print tokens
    let ast = parse tokens
    print ast