module Main where


import System.Directory (doesFileExist)
import System.IO
import Syntax
import Parser
import Typechecker
import Interpreter

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

handleFile :: String -> (String -> IO ()) -> IO ()
handleFile file action = do
    exists <- doesFileExist file
    if not exists
        then putStrLn $ "File not found: " ++ file
        else do
            contents <- readFile file
            action contents

main :: IO ()
main = do 
    putStrLn banner 
    replLoop

replLoop :: IO ()
replLoop = do
    putStr "λ> "
    hFlush stdout
    input <- getLine
    case words input of
        ("parse":file:_) -> do
            handleFile file $ \contents -> do
                putStrLn $ "Parsing: " ++ file
                print $ parseString contents
            replLoop

        ("typecheck":file:_) -> do
            handleFile file $ \contents -> do
                putStrLn $ "Typechecking: " ++ file
                putStrLn contents
                let ast = parseString contents
                case synth0 ast of
                    Right _ -> putStrLn "Yup. Program typechecks"
                    Left err -> putStrLn $ "Typechecking error: " ++ show err
            replLoop

        ("run":file:_) -> do
            handleFile file $ \contents -> do
                putStrLn $ "Evaluating: " ++ file
                putStrLn contents
                let ast = parseString contents
                case synth0 ast of
                    Right _ -> putStrLn . prettyPrintTerm $ fullEval ast
                    Left err -> putStrLn $ "Typechecking error: " ++ show err
            replLoop

        ("quit":_) -> putStrLn "Goodbye!"

        _ -> do
            putStrLn "Unknown command. Try: parse <file>, typecheck <file>, eval <file>, or quit"
            replLoop
