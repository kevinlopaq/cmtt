import Test.HUnit
import qualified System.Exit as Exit
import Typechecker 
import AST

arg1 = Var "x"
ctx1 = [("x", IntTy)]
result1 = synth ctx1 arg1 
expected1 = Right IntTy
test1 = TestCase (assertEqual "1. Variable 'x' should have type IntTy" result1 expected1)

arg2 = Var "x"
ctx2 = []
result2 = synth ctx2 arg2 
expected2 = Left (UnboundVariable "x")
test2 = TestCase (assertEqual "2. Variable 'x' is not defined in the context" result2 expected2)

arg3 = Unit
ctx3 = []
result3 = synth ctx3 arg3 
expected3 = Right UnitTy
test3 = TestCase (assertEqual "3. Term unit should have unit type" result3 expected3)

arg4 = Unit
ctx4 = []
result4 = check ctx4 arg4 UnitTy
expected4 = Right ()
test4 = TestCase (assertEqual "4. Term unit should check against unit type" result4 expected4)

arg5 = Unit
ctx5 = []
result5 = check ctx5 arg5 BoolTy
expected5 = Left (TypeMismatch BoolTy UnitTy)
test5 = TestCase (assertEqual "5. Term unit should not check against bool type" result5 expected5)

arg6 = TrueT
ctx6 = []
result6 = synth ctx6 arg6 
expected6 = Right BoolTy
test6 = TestCase (assertEqual "6. Term true should have bool type" result6 expected6)

arg7 = TrueT
ctx7 = []
result7 = check ctx7 arg7 BoolTy
expected7 = Right ()
test7 = TestCase (assertEqual "7. Term true should check against bool type" result7 expected7)

arg8 = TrueT
ctx8 = []
result8 = check ctx8 arg8 UnitTy
expected8 = Left (TypeMismatch UnitTy BoolTy)
test8 = TestCase (assertEqual "8. Term true should not check against unit type" result8 expected8)

arg9 = FalseT
ctx9 = []
result9 = synth ctx9 arg9 
expected9 = Right BoolTy
test9 = TestCase (assertEqual "9. Term false should have bool type" result9 expected9)

arg10 = FalseT
ctx10 = []
result10 = check ctx10 arg10 BoolTy
expected10 = Right ()
test10 = TestCase (assertEqual "10. Term false should check against bool type" result10 expected10)

arg11 = FalseT
ctx11 = []
result11 = check ctx11 arg11 UnitTy
expected11 = Left (TypeMismatch UnitTy BoolTy)
test11 = TestCase (assertEqual "11. Term false should not check against unit type" result11 expected11)

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
    TestLabel "Checking false term against unit type" test11]

main :: IO ()
main = do
        result <- runTestTT tests
        if failures result > 0 then Exit.exitFailure else Exit.exitSuccess