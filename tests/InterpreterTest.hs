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

-- Test 7: Simple pair construction and projection with Fst
arg7 = Fst (Pair (IntT 1) (IntT 2))
result7 = fullEval arg7
expected7 = IntT 1
test7 = TestCase (assertEqual "7. Testing Fst projection from a simple pair" result7 expected7)

-- Test 8: Simple pair construction and projection with Snd
arg8 = Snd (Pair (IntT 1) (IntT 2))
result8 = fullEval arg8
expected8 = IntT 2
test8 = TestCase (assertEqual "8. Testing Snd projection from a simple pair" result8 expected8)

-- Test 9: Nested pair projection with Fst
arg9 = Fst (Pair (Pair (IntT 3) (IntT 4)) (IntT 2))
result9 = fullEval arg9
expected9 = Pair (IntT 3) (IntT 4)
test9 = TestCase (assertEqual "9. Testing Fst projection from a nested pair" result9 expected9)

-- Test 10: Nested pair projection with Snd
arg10 = Snd (Pair (IntT 1) (Pair (IntT 3) (IntT 4)))
result10 = fullEval arg10
expected10 = Pair (IntT 3) (IntT 4)
test10 = TestCase (assertEqual "10. Testing Snd projection from a nested pair" result10 expected10)

-- Test 11: Projection from a pair where one component is not fully evaluated
arg11 = Fst (Pair (App (Lam "x" (Var "x")) (IntT 5)) (IntT 10))
result11 = fullEval arg11
expected11 = IntT 5
test11 = TestCase (assertEqual "11. Testing projection from a pair with an unevaluated component" result11 expected11)

-- Test 12: Let binding with a reducible expression
-- let val x = 3 + 4 in x evaluates to 3 + 4
arg12 = LetVal "x" (BinOp Add (IntT 3) (IntT 4)) (Var "x")
result12 = fullEval arg12
expected12 = IntT 7  -- 3 + 4
test12 = TestCase (assertEqual "12. Testing LetVal with reducible expression" result12 expected12)

-- Test 13: Let binding with an already evaluated value
-- let val x = 5 in x + 10 evaluates to 15 
arg13 = LetVal "x" (IntT 5) (BinOp Add (Var "x") (IntT 10))
result13 = fullEval arg13
expected13 = IntT 15  -- 5 + 10
test13 = TestCase (assertEqual "13. Testing LetVal with already evaluated value" result13 expected13)

-- Test 14: Let binding with a variable (variable substitution should not occur)
-- let val x = y in x + 3
arg14 = LetVal "x" (Var "y") (BinOp Add (Var "x") (IntT 3))
result14 = fullEval arg14
expected14 = LetVal "x" (Var "y") (BinOp Add (Var "x") (IntT 3))  -- Not evaluated yet, because of the variable
test14 = TestCase (assertEqual "14. Testing LetVal with a variable not evaluated" result14 expected14)

-- Test 15: Let binding with a nested expression that requires multiple steps to reduce
-- let val x = (λy.y + 2)(3) in x * 4 evaluates to (3 + 2) * 4
arg15 = LetVal "x" (App (Lam "y" (BinOp Add (Var "y") (IntT 2))) (IntT 3)) (BinOp Mul (Var "x") (IntT 4))
result15 = fullEval arg15
expected15 = IntT 20  -- (3 + 2) * 4
test15 = TestCase (assertEqual "15. Testing LetVal with a nested expression" result15 expected15)

-- Test 16: IfTrue condition (should evaluate e2)
arg16 = IfThenElse TrueT (IntT 5) (IntT 10)
result16 = fullEval arg16
expected16 = IntT 5  -- Condition is True, so e2 should be evaluated
test16 = TestCase (assertEqual "16. Testing IfThenElse with True condition" result16 expected16)

-- Test 17: IfFalse condition (should evaluate e3)
arg17 = IfThenElse FalseT (IntT 5) (IntT 10)
result17 = fullEval arg17
expected17 = IntT 10  -- Condition is False, so e3 should be evaluated
test17 = TestCase (assertEqual "17. Testing IfThenElse with False condition" result17 expected17)

-- Test 18: If reducible condition (should reduce the condition first)
arg18 = IfThenElse (BinPred GreaterThan (IntT 3) (IntT 2)) (IntT 5) (IntT 10)
result18 = fullEval arg18
expected18 = IntT 5  -- Condition is reducible to 5 (True), so e2 should be evaluated
test18 = TestCase (assertEqual "18. Testing IfThenElse with reducible condition" result18 expected18)

-- Test 19: If reducible condition leading to FalseT (should evaluate e3)
arg19 = IfThenElse (BinPred GreaterThan (IntT 3) (IntT 4)) (IntT 5) (IntT 10)
result19 = fullEval arg19
expected19 = IntT 10  -- Condition is reducible to FalseT (3 - 4), so e3 should be evaluated
test19 = TestCase (assertEqual "19. Testing IfThenElse with reducible condition to False" result19 expected19)

-- Test 20: Nested IfThenElse (should evaluate based on the first condition)
arg20 = IfThenElse TrueT (IfThenElse FalseT (IntT 1) (IntT 2)) (IntT 3)
result20 = fullEval arg20
expected20 = IntT 2  -- Outer condition is True, so we evaluate the inner IfThenElse (FalseT, thus 2)
test20 = TestCase (assertEqual "20. Testing nested IfThenElse" result20 expected20)

-- Test 21: Function application to a value (simple case)
arg21 = App (Fun "f" "x" (BinOp Add (Var "x") (IntT 2))) (IntT 3)
result21 = fullEval arg21
expected21 = IntT 5  -- (3 + 2)
test21 = TestCase (assertEqual "21. Testing function application to a value" result21 expected21)

-- Test 22: Function application to a reducible expression
arg22 = App (Fun "f" "x" (BinOp Add (Var "x") (IntT 2))) (BinOp Mul (IntT 2) (IntT 3))
result22 = fullEval arg22
expected22 = IntT 8  -- (2 * 3) + 2 = 6 + 2
test22 = TestCase (assertEqual "22. Testing function application to a reducible expression" result22 expected22)

-- Test 23: Factorial of 5
arg23 = App (Fun "fact" "n" (IfThenElse (BinPred LessThan (Var "n") (IntT 1)) (IntT 1) (BinOp Mul (Var "n") (App (Var "fact") (BinOp Sub (Var "n") (IntT 1)))))) (IntT 5)
result23 = fullEval arg23
expected23 = IntT 120  -- 5 * 4 * 3 * 2 * 1 = 120
test23 = TestCase (assertEqual "23. Testing factorial function" result23 expected23)

-- Test 24: let box u = box x:int, y:int. (x + y) in u⟨x→5, y→2⟩ should evaluate to 5 + 2
arg24 = LetBox "u" (Ann (Box [("x", IntTy), ("y", IntTy)] (BinOp Add (Var "x") (Var "y"))) (BoxTy [("x", IntTy), ("y", IntTy)] IntTy)) (ModVar "u" [("x", IntT 5), ("y", IntT 2)])
result24 = fullEval arg24
expected24 = IntT 7
test24 = TestCase (assertEqual "24. Testing beta reduction for box" result24 expected24)

tests = TestList [
                    test0,
                    test1,
                    test2,
                    test3,
                    test4,
                    test5, 
                    test6,
                    test7,
                    test8,
                    test9,
                    test10,
                    test12,
                    test13, 
                    test14,
                    test15,
                    test16,
                    test17,
                    test18,
                    test19,
                    test20, 
                    test21,
                    test22,
                    test23,
                    test24
        ]

main :: IO ()
main = do
    result <- runTestTT tests
    if failures result > 0 then exitFailure else exitSuccess

