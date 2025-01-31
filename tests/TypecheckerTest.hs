import Test.HUnit
import qualified System.Exit as Exit
import Typechecker 
import AST
-- Variable found in context: the variable 'x' is in the context with type IntTy
arg1 = Var "x"
ctx1 = [("x", IntTy)]
result1 = synth ctx1 arg1 
expected1 = Right IntTy
test1 = TestCase (assertEqual "1. Variable 'x' should have type IntTy" result1 expected1)

-- Variable not found in context: the variable 'x' is not in the context, so it should fail with UnboundVariable
arg2 = Var "x"
ctx2 = []
result2 = synth ctx2 arg2 
expected2 = Left (UnboundVariable "x")
test2 = TestCase (assertEqual "2. Variable 'x' is not defined in the context" result2 expected2)

-- Inferring type for unit term: 'Unit' has type UnitTy
arg3 = Unit
ctx3 = []
result3 = synth ctx3 arg3 
expected3 = Right UnitTy
test3 = TestCase (assertEqual "3. Term unit should have unit type" result3 expected3)

-- Checking unit term against unit type: unit term should check correctly against UnitTy
arg4 = Unit
ctx4 = []
result4 = check ctx4 arg4 UnitTy
expected4 = Right ()
test4 = TestCase (assertEqual "4. Term unit should check against unit type" result4 expected4)

-- Checking unit term against bool type: unit term should not check against BoolTy
arg5 = Unit
ctx5 = []
result5 = check ctx5 arg5 BoolTy
expected5 = Left (TypeMismatch BoolTy UnitTy)
test5 = TestCase (assertEqual "5. Term unit should not check against bool type" result5 expected5)

-- Inferring type for true term: true term should have type BoolTy
arg6 = TrueT
ctx6 = []
result6 = synth ctx6 arg6 
expected6 = Right BoolTy
test6 = TestCase (assertEqual "6. Term true should have bool type" result6 expected6)

-- Checking true term against bool type: true term should check correctly against BoolTy
arg7 = TrueT
ctx7 = []
result7 = check ctx7 arg7 BoolTy
expected7 = Right ()
test7 = TestCase (assertEqual "7. Term true should check against bool type" result7 expected7)

-- Checking true term against unit type: true term should not check against UnitTy
arg8 = TrueT
ctx8 = []
result8 = check ctx8 arg8 UnitTy
expected8 = Left (TypeMismatch UnitTy BoolTy)
test8 = TestCase (assertEqual "8. Term true should not check against unit type" result8 expected8)

-- Inferring type for false term: false term should have type BoolTy
arg9 = FalseT
ctx9 = []
result9 = synth ctx9 arg9 
expected9 = Right BoolTy
test9 = TestCase (assertEqual "9. Term false should have bool type" result9 expected9)

-- Checking false term against bool type: false term should check correctly against BoolTy
arg10 = FalseT
ctx10 = []
result10 = check ctx10 arg10 BoolTy
expected10 = Right ()
test10 = TestCase (assertEqual "10. Term false should check against bool type" result10 expected10)

-- Checking false term against unit type: false term should not check against UnitTy
arg11 = FalseT
ctx11 = []
result11 = check ctx11 arg11 UnitTy
expected11 = Left (TypeMismatch UnitTy BoolTy)
test11 = TestCase (assertEqual "11. Term false should not check against unit type" result11 expected11)

-- Function application with correct types
arg12 = App (Ann (Lam "x" (Var "x")) (Arrow IntTy IntTy)) (IntT 42)
ctx12 = []
result12 = synth ctx12 arg12
expected12 = Right IntTy
test12 = TestCase (assertEqual "12. Applying identity function to int" result12 expected12)

-- Function application with incorrect argument type
arg13 = App (Ann (Lam "x" (Var "x")) (Arrow IntTy IntTy)) TrueT
ctx13 = []
result13 = synth ctx13 arg13
expected13 = Left (TypeMismatch {expected = IntTy, actual = BoolTy})
test13 = TestCase (assertEqual "13. Applying identity function to bool (should fail)" result13 expected13)

-- Function application where function is not a function
arg14 = App Unit TrueT
ctx14 = []
result14 = synth ctx14 arg14
expected14 = Left (NotAFunctionType UnitTy)
test14 = TestCase (assertEqual "14. Applying unit as a function (should fail)" result14 expected14)

-- Lambda term checking
arg15 = Lam "x" (Var "x")
ctx15 = []
result15 = check ctx15 arg15 (Arrow IntTy IntTy)
expected15 = Right ()
test15 = TestCase (assertEqual "15. Checking identity function against correct type" result15 expected15)

-- Lambda term checking with incorrect annotation
arg16 = Lam "x" (Var "x")
ctx16 = []
result16 = check ctx16 arg16 (Arrow IntTy BoolTy)
expected16 = Left (TypeMismatch BoolTy IntTy)
test16 = TestCase (assertEqual "16. Identity function should not check against Arrow IntTy BoolTy" result16 expected16)

-- Annotated term with matching type
arg17 = Ann (IntT 42) IntTy
ctx17 = []
result17 = synth ctx17 arg17
expected17 = Right IntTy
test17 = TestCase (assertEqual "17. Annotated integer should check correctly" result17 expected17)

-- Annotated term with mismatched type
arg18 = Ann (IntT 42) BoolTy
ctx18 = []
result18 = synth ctx18 arg18
expected18 = Left (TypeMismatch BoolTy IntTy)
test18 = TestCase (assertEqual "18. Annotated integer with wrong type should fail" result18 expected18)

-- Nested function application
arg19 = App  (Ann (Lam "x" (Lam "y" (Var "y"))) (Arrow IntTy (Arrow BoolTy BoolTy))) (IntT 42)
ctx19 = []
result19 = synth ctx19 arg19
expected19 = Right (Arrow BoolTy BoolTy)
test19 = TestCase (assertEqual "19. Applying curried function to int" result19 expected19)

-- Synthesizing an unannotated lambda
arg20 = Lam "x" (Var "x")
ctx20 = []
result20 = synth ctx20 arg20
expected20 = Left (UnknownError "Could not inferr a type for the provided term: Lam \"x\" (Var \"x\")")
test20 = TestCase (assertEqual "20. Inferring type for unannotated lambda should fail" result20 expected20)

tests :: Test
tests = TestList [
    TestLabel "Variable found in context" test1, 
    TestLabel "Variable not found in context" test2,
    TestLabel "Inferring type for unit term" test3,
    TestLabel "Checking unit term against unit type" test4,
    TestLabel "Checking unit term against bool type" test5,
    TestLabel "Inferring type for true term" test6,
    TestLabel "Checking true term against bool type" test7,
    TestLabel "Checking true term against unit type" test8,
    TestLabel "Inferring type for false term" test9,
    TestLabel "Checking false term against bool type" test10,
    TestLabel "Checking false term against unit type" test11,
    TestLabel "Applying int identity function to int" test12,
    TestLabel "Applying bool identity function to bool (should fail)" test13,
    TestLabel "Applying unit as a function (should fail)" test14,
    TestLabel "Checking identity function against correct type" test15,
    TestLabel "Identity function should not check against Arrow IntTy BoolTy" test16,
    TestLabel "Annotated integer should check correctly" test17,
    TestLabel "Annotated integer with wrong type should fail" test18,
    TestLabel "Applying curried function to int" test19,
    TestLabel "Inferring type for unannotated lambda should fail" test20
    ]

main :: IO ()
main = do
        result <- runTestTT tests
        if failures result > 0 then Exit.exitFailure else Exit.exitSuccess