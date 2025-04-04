import Test.HUnit
import System.Exit (exitFailure, exitSuccess)
import Syntax
import Interpreter 

-- Test 0: (λx.x)(1) evaluates to 1 
arg0 = (App (Lam "x" (Var "x")) (IntT 1))
result0 = fullEval arg0  
expected0 = IntT 1
test0 = TestCase (assertEqual "0. Testing application reduction" result0 expected0)

-- Test 1: (λx.λy.λz. x + y + z)(3)(2)(5) evaluates to 3 + 2 + 5
arg1 = App (App (App (Lam "x" (Lam "y" (Lam "z" (BinOp Add (BinOp Add (Var "x") (Var "y")) (Var "z"))))) (IntT 3)) (IntT 2)) (IntT 5) 
result1 = fullEval arg1  
expected1 = IntT (3 + 2 + 5)
test1 = TestCase (assertEqual "1. Testing nested lambdas and binary operations" result1 expected1)

-- Test 2: Case expression matching InL
-- case (inl 1) of x => x + 1 || y => y - 1 evaluates to 2
arg2 = Case (InL (IntT 1)) "x" (BinOp Add (Var "x") (IntT 1)) "y" (BinOp Sub (Var "y") (IntT 1))
result2 = fullEval arg2
expected2 = IntT 2  -- 1 + 1
test2 = TestCase (assertEqual "2. Testing Case expression with InL" result2 expected2)

-- Test 3: Case expression matching InR
-- case (inr 2) of x => x + 1 || y => y - 1 evaluates to 1
arg3 = Case (InR (IntT 2)) "x" (BinOp Add (Var "x") (IntT 1)) "y" (BinOp Sub (Var "y") (IntT 1))
result3 = fullEval arg3
expected3 = IntT 1  -- 2 - 1
test3 = TestCase (assertEqual "3. Testing Case expression with InR" result3 expected3)

-- Test 4: Nested Injections with Case
-- case (inr (inl 3)) of x => x + 1 || y => case y of z => z + 2 || w => 0 evaluates to 3 * 2
arg4 = Case (InR (InL (IntT 3))) "x" (BinOp Add (Var "x") (IntT 1)) "y" (Case (Var "y") "z" (BinOp Mul (Var "z") (IntT 2)) "w" (IntT 0))
result4 = fullEval arg4
expected4 = IntT 6  -- (2 * 3)
test4 = TestCase (assertEqual "4. Testing nested injections and case matching" result4 expected4)

-- Test 5: Injections with variables (should remain unevaluated if not fully reduced)
arg5 = InL (Var "x")
result5 = fullEval arg5
expected5 = InL (Var "x")
test5 = TestCase (assertEqual "5. Testing InL with unevaluated variable" result5 expected5)

-- Test 6: Case expression where the term is not fully evaluated
-- case inl (λx.x)(1) of x => x || y => 0
arg6 = Case (InL (App (Lam "x" (Var "x")) (IntT 1))) "x" (Var "x") "y" (IntT 0)
result6 = fullEval arg6
expected6 = IntT 1
test6 = TestCase (assertEqual "6. Testing Case with evaluation in the InL branch" result6 expected6)


tests = TestList [
                    test0,
                    test1,
                    test2,
                    test3,
                    test4,
                    test5, 
                    test6
        ]

main :: IO ()
main = do
    result <- runTestTT tests
    if failures result > 0 then exitFailure else exitSuccess

