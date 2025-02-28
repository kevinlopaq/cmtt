module Main where

import Options.Applicative
import System.IO
import Parser
import Typechecker


banner :: String
banner = unlines
    [ "  ♢  ☐  Ψ  ♢  ☐  Ψ  ♢  ☐  Ψ  "
    , "   _____ __  __ _______ _______ "
    , "  / ____|  \\/  |__   __|__   __|"
    , " | |    | \\  / |  | |     | |   "
    , " | |    | |\\/| |  | |     | |   "
    , " | |____| |  | |  | |     | |   "
    , "  \\_____|_|  |_|  |_|     |_|   "
    , "                                "
    , "  ♢  ☐  Ψ  ♢  ☐  Ψ  ♢  ☐  Ψ  "
    ]

data Command = Parse FilePath
            |  TypeCheck FilePath
            |  Eval FilePath

commandParser :: Parser Command
commandParser = subparser
    (   command "parse" (info (Parse <$> fileOption) (progDesc "Parse a program"))
    <>  command "typecheck" (info (TypeCheck <$> fileOption) (progDesc "Typecheck a program"))
    <>  command "eval" (info (Eval <$> fileOption) (progDesc "Interpret a program"))
    )
    where 
        fileOption = strOption (long "file" <> short 'f' <> metavar "FILE" <> help "Input file")

main :: IO ()
main = do
    putStrLn banner 
    cmd <- execParser (info (commandParser <**> helper) (fullDesc <> progDesc "CMTT Interpreter"))
    case cmd of
        Parse file -> do
            contents <- readFile file
            putStrLn $ "Parsing: " ++ file 
            putStrLn $ contents
            print $ parseString contents

        TypeCheck file -> do
            contents <- readFile file
            putStrLn $ "Typechecking: " ++ file
            putStrLn $ contents
            ast <- return (parseString contents)
            case (synth0 ast) of
                Right ty -> print $ "Yup. Program typechecks"
                Left err -> putStrLn $ "Typechecking error: " ++ show(err)

--        Eval file -> do
--            contents <- readFile file
--            putStrLn $ "Evaluating: " ++ file
--            case L.parse contents of
--                Right ast -> case L.typeCheck ast of
--                Right _ -> print $ L.eval ast
--                Left err -> putStrLn $ "Type error: " ++ err
--                Left err -> putStrLn $ "Parse error: " ++ err