import Test.HUnit
import System.Exit (exitFailure, exitSuccess)
import Syntax
import Interpreter 

-- (λx.x)(1) evaluates to 1 
arg0 = (App (Lam "x" (Var "x")) (IntT 1))
result0 = fullEval arg0  
expected0 = IntT 1
test0 = TestCase (assertEqual "0. Testing application reduction" result0 expected0)

-- (λx.λy.λz. x + y + z)(3)(2)(5) evaluates to 3 + 2 + 5
arg1 = App (App (App (Lam "x" (Lam "y" (Lam "z" (BinOp Add (BinOp Add (Var "x") (Var "y")) (Var "z"))))) (IntT 3)) (IntT 2)) (IntT 5) 
result1 = fullEval arg1  
expected1 = IntT (3 + 2 + 5)
test1 = TestCase (assertEqual "1. Testing nested lambdas and binary operations" result1 expected1)



tests = TestList [
                    test0,
                    test1
        ]

main :: IO ()
main = do
    result <- runTestTT tests
    if failures result > 0 then exitFailure else exitSuccess

