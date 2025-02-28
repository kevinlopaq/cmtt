import Test.HUnit
import System.Exit (exitFailure, exitSuccess)
import Syntax
import Parser

arg0 = "λx.x :: int → int"
result0 = parseString arg0
expected0 = Ann (Lam "x" (Var "x")) (Arrow IntTy IntTy)
test0 = TestCase (assertEqual "0. Parsing identity λx.x :: int → int" result0 expected0)

arg1 = "λx.λy.x :: int → int → int"
result1 = parseString arg1
expected1 = Ann (Lam "x" (Lam "y" (Var "x"))) (Arrow IntTy (Arrow IntTy IntTy))
test1 = TestCase (assertEqual "1. Parsing identity λx.x :: int → int" result1 expected1)

arg2 = "(3)"
result2 = parseString arg2
expected2 = IntT 3
test2 = TestCase (assertEqual "2. Parsing integer inside parentheses" result2 expected2)

arg3 = "λp. fst p :: A×B → B"
result3 = parseString arg3
expected3 = Ann (Lam "p" (Fst (Var "p"))) (Arrow (Prod (BaseTy "A") (BaseTy "B")) (BaseTy "B"))
test3 = TestCase (assertEqual "3. Parsing λp. fst p :: A×B → B" expected3 result3)

tests = TestList [
                    test0,
                    test1,
                    test2,
                    test3
                ]

main :: IO ()
main = do
    result <- runTestTT tests
    if failures result > 0 then exitFailure else exitSuccess
