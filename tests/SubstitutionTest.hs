import Test.HUnit
import System.Exit (exitFailure, exitSuccess)
import Syntax
import Substitution

arg0 = Lam "x" (App (Var "y") (Var "x"))  -- λx. y x
result0 = substitute arg0 "y" (Var "x")   -- [y → x](λx. y x) 
expected0 = Lam "x1" (App (Var "x") (Var "x1"))
test0 = TestCase (assertEqual "0. Testing capture-avoid substitution in lambda" result0 expected0)

tests = TestList [
                    test0
                ]

main :: IO ()
main = do
    result <- runTestTT tests
    if failures result > 0 then exitFailure else exitSuccess
