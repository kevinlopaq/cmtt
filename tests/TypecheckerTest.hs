import Test.HUnit
import System.Exit (exitFailure, exitSuccess)
import Typechecker 
import Syntax

-- Variable found in context: the variable 'x' is in the context with type IntTy
arg0 = Var "x"
ctx0 = [("x", IntTy)]
result0 = synth [] ctx0 arg0 
expected0 = Right IntTy
test0 = TestCase (assertEqual "0. Variable 'x' should have type IntTy" result0 expected0)

-- Variable not found in context: the variable 'x' is not in the context, so it should fail with UnboundVariable
arg1 = Var "x"
ctx1 = []
result1 = synth [] ctx1 arg1 
expected1 = Left (UnboundVariable "x")
test1 = TestCase (assertEqual "1. Variable 'x' is not defined in the context" result1 expected1)

-- Inferring type for unit term: 'Unit' has type UnitTy
arg2 = Unit
ctx2 = []
result2 = synth [] ctx2 arg2 
expected2 = Right UnitTy
test2 = TestCase (assertEqual "2. Term unit should have unit type" result2 expected2)

-- Checking unit term against unit type: unit term should check correctly against UnitTy
arg3 = Unit
ctx3 = []
result3 = check [] ctx3 arg3 UnitTy
expected3 = Right ()
test3 = TestCase (assertEqual "3. Term unit should check against unit type" result3 expected3)

-- Checking unit term against bool type: unit term should not check against BoolTy
arg4 = Unit
ctx4 = []
result4 = check [] ctx4 arg4 BoolTy
expected4 = Left (TypeMismatch BoolTy UnitTy)
test4 = TestCase (assertEqual "4. Term unit should not check against bool type" result4 expected4)

-- Inferring type for true term: true term should have type BoolTy
arg5 = TrueT
ctx5 = []
result5 = synth [] ctx5 arg5 
expected5 = Right BoolTy
test5 = TestCase (assertEqual "5. Term true should have bool type" result5 expected5)

-- Checking true term against bool type: true term should check correctly against BoolTy
arg6 = TrueT
ctx6 = []
result6 = check [] ctx6 arg6 BoolTy
expected6 = Right ()
test6 = TestCase (assertEqual "6. Term true should check against bool type" result6 expected6)

-- Checking true term against unit type: true term should not check against UnitTy
arg7 = TrueT
ctx7 = []
result7 = check [] ctx7 arg7 UnitTy
expected7 = Left (TypeMismatch UnitTy BoolTy)
test7 = TestCase (assertEqual "7. Term true should not check against unit type" result7 expected7)

-- Inferring type for false term: false term should have type BoolTy
arg8 = FalseT
ctx8 = []
result8 = synth [] ctx8 arg8 
expected8 = Right BoolTy
test8 = TestCase (assertEqual "8. Term false should have bool type" result8 expected8)

-- Checking false term against bool type: false term should check correctly against BoolTy
arg9 = FalseT
ctx9 = []
result9 = check [] ctx9 arg9 BoolTy
expected9 = Right ()
test9 = TestCase (assertEqual "9. Term false should check against bool type" result9 expected9)

-- Checking false term against unit type: false term should not check against UnitTy
arg10 = FalseT
ctx10 = []
result10 = check [] ctx10 arg10 UnitTy
expected10 = Left (TypeMismatch UnitTy BoolTy)
test10 = TestCase (assertEqual "10. Term false should not check against unit type" result10 expected10)

-- Function application with correct types
arg11 = App (Ann (Lam "x" (Var "x")) (Arrow IntTy IntTy)) (IntT 42)
ctx11 = []
result11 = synth [] ctx11 arg11
expected11 = Right IntTy
test11 = TestCase (assertEqual "11. Applying identity function to int" result11 expected11)

-- Function application with incorrect argument type
arg12 = App (Ann (Lam "x" (Var "x")) (Arrow IntTy IntTy)) TrueT
ctx12 = []
result12 = synth [] ctx12 arg12
expected12 = Left (TypeMismatch {expected = IntTy, actual = BoolTy})
test12 = TestCase (assertEqual "12. Applying identity function to bool (should fail)" result12 expected12)

-- Function application where function is not a function
arg13 = App Unit TrueT
ctx13 = []
result13 = synth [] ctx13 arg13
expected13 = Left (NotAFunctionType UnitTy)
test13 = TestCase (assertEqual "13. Applying unit as a function (should fail)" result13 expected13)

-- Lambda term checking
arg14 = Lam "x" (Var "x")
ctx14 = []
result14 = check [] ctx14 arg14 (Arrow IntTy IntTy)
expected14 = Right ()
test14 = TestCase (assertEqual "14. Checking identity function against correct type" result14 expected14)

-- Lambda term checking with incorrect annotation
arg15 = Lam "x" (Var "x")
ctx15 = []
result15 = check [] ctx15 arg15 (Arrow IntTy BoolTy)
expected15 = Left (TypeMismatch BoolTy IntTy)
test15 = TestCase (assertEqual "15. Identity function should not check against Arrow IntTy BoolTy" result15 expected15)

-- Annotated term with matching type
arg16 = Ann (IntT 42) IntTy
ctx16 = []
result16 = synth [] ctx16 arg16
expected16 = Right IntTy
test16 = TestCase (assertEqual "16. Annotated integer should check correctly" result16 expected16)

-- Annotated term with mismatched type
arg17 = Ann (IntT 42) BoolTy
ctx17 = []
result17 = synth [] ctx17 arg17
expected17 = Left (TypeMismatch BoolTy IntTy)
test17 = TestCase (assertEqual "17. Annotated integer with wrong type should fail" result17 expected17)

-- Nested function application
arg18 = App (Ann (Lam "x" (Lam "y" (Var "y"))) (Arrow IntTy (Arrow BoolTy BoolTy))) (IntT 42)
ctx18 = []
result18 = synth [] ctx18 arg18
expected18 = Right (Arrow BoolTy BoolTy)
test18 = TestCase (assertEqual "18. Applying function to int" result18 expected18)

-- Synthesizing an unannotated lambda
arg19 = Lam "x" (Var "x")
ctx19 = []
result19 = synth [] ctx19 arg19
expected19 = Left (TypingError "Could not inferr a type for the provided term: Lam \"x\" (Var \"x\")")
test19 = TestCase (assertEqual "19. Inferring type for unannotated lambda should fail" result19 expected19)

-- Lambda with unspecified base types
arg20 = Ann (Lam "x" (Var "x")) (Arrow (BaseTy "A") (BaseTy "A"))
ctx20 = []
result20 = synth [] ctx20 arg20
expected20 = Right (Arrow (BaseTy "A") (BaseTy "A"))
test20 = TestCase (assertEqual "20. Inferring type for lambda annotated with unspecified base types" result20 expected20)

-- Checking lambda against non-arrow type
arg21 = Lam "x" (Var "x")
ctx21 = []
result21 = check [] ctx21 arg21 IntTy
expected21 = Left (NotAFunctionType IntTy)
test21 = TestCase (assertEqual "21. Checking lambda against non-arrow type should fail" result21 expected21)

-- Checking first projection inside lambda
-- λp. fst p :: A×B → A 
arg22 = Ann (Lam "p" (Fst $ Var "p")) (Arrow (Prod (BaseTy "A") (BaseTy "B")) (BaseTy "A"))
ctx22 = []
result22 = synth [] ctx22 arg22
expected22 = Right (Arrow (Prod (BaseTy "A") (BaseTy "B")) (BaseTy "A"))
test22 = TestCase (assertEqual "22. Checking first projection inside lambda" result22 expected22)

-- Checking second projection inside lambda
-- λp. snd p :: A×B → B 
arg23 = Ann (Lam "p" (Snd $ Var "p")) (Arrow (Prod (BaseTy "A") (BaseTy "B")) (BaseTy "B"))
ctx23 = []
result23 = synth [] ctx23 arg23
expected23 = Right (Arrow (Prod (BaseTy "A") (BaseTy "B")) (BaseTy "B"))
test23 = TestCase (assertEqual "23. Checking second projection inside lambda" result23 expected23)

-- Checking first projection inside lambda against incorrect type
-- λp. fst p :: A×B → B 
arg24 = Ann (Lam "p" (Fst $ Var "p")) (Arrow (Prod (BaseTy "A") (BaseTy "B")) (BaseTy "B"))
ctx24 = []
result24 = synth [] ctx24 arg24
expected24 = Left (TypeMismatch {expected = BaseTy "B", actual = BaseTy "A"})
test24 = TestCase (assertEqual "24. Checking first projection inside lambda against incorrect type should fail" result24 expected24)

-- Checking (42, true) against int × bool should work
arg25 = Pair (IntT 42) TrueT
ctx25 = []
result25 = check [] ctx25 arg25 (Prod IntTy BoolTy)
expected25 = Right ()
test25 = TestCase (assertEqual "25. Pair (42, true) should check against int × bool" result25 expected25)

-- Checking a pair against mismatched product types
arg26 = Pair (IntT 42) TrueT
ctx26 = []
result26 = check [] ctx26 arg26 (Prod BoolTy IntTy)
expected26 = Left (TypeMismatch {expected = BoolTy, actual = IntTy})
test26 = TestCase (assertEqual "26. Pair (42, true) should not check against bool × int" result26 expected26)

-- Checking addition: 40 + 2 should synthesize type int
arg27 = BinOp Add (IntT 40) (IntT 2)
ctx27 = []
result27 = synth [] ctx27 arg27
expected27 = Right IntTy
test27 = TestCase (assertEqual "27. Checking addition should synthesize type int" result27 expected27)

-- Checking addition with a boolean: should fail
arg28 = BinOp Add (IntT 10) TrueT
ctx28 = []
result28 = synth [] ctx28 arg28
expected28 = Left (TypeMismatch {expected = IntTy, actual = BoolTy})
test28 = TestCase (assertEqual "28. Addition with a boolean should fail" result28 expected28)

-- Checking λx.λy. x + y against int → (int → int) should succeed
arg29 = Ann (Lam "x" (Lam "y" (BinOp Add (Var "x") (Var "y")))) (Arrow IntTy (Arrow IntTy IntTy))
ctx29 = []
result29 = synth [] ctx29 arg29
expected29 = Right (Arrow IntTy (Arrow IntTy IntTy))
test29 = TestCase (assertEqual "29. Addition inside lambdas" result29 expected29)

-- Checking λx.λy. x + y against int → (int → bool) should fail
arg30 = Ann (Lam "x" (Lam "y" (BinOp Add (Var "x") (Var "y")))) (Arrow IntTy (Arrow IntTy BoolTy))
ctx30 = []
result30 = synth [] ctx30 arg30
expected30 = Left (TypeMismatch {expected = BoolTy, actual = IntTy})
test30 = TestCase (assertEqual "30. Checking addition inside lambdas against incorrect type" result30 expected30)

-- Checking box x:int, y:int. (x + y) against [x:int, y:int]int should succeed
arg31 = Box [("x", IntTy), ("y", IntTy)] (BinOp Add (Var "x") (Var "y"))
ctx31 = []
modCtx31 = [] 
result31 = check modCtx31 ctx31 arg31 (BoxTy [("x", IntTy), ("y", IntTy)] IntTy)
expected31 = Right ()
test31 = TestCase (assertEqual "31. Checking box type with value variables in context should succeed" result31 expected31)

-- Checking λz. box x:int, y:int. (x + y + z) against int → [x:int, y:int]int should fail
arg32 = Lam "z" (Box [("x", IntTy), ("y", IntTy)] (BinOp Add (BinOp Add (Var "x") (Var "y")) (Var "z")))
ctx32 = []
modCtx32 = [] 
result32 = check modCtx32 ctx32 arg32 (Arrow (IntTy) (BoxTy [("x", IntTy), ("y", IntTy)] IntTy))
expected32 = Left (UnboundVariable "z")
test32 = TestCase (assertEqual "32. Checking box type with value variables not in context should fail" result32 expected32)

-- Checking λx. let box u' = x in u' against  []A → A should succeed
arg33 = Lam "x" (LetBox "u'" (Var "x") (ModVar "u'" []))
ctx33 = []
modCtx33 = [] 
result33 = check modCtx33 ctx33 arg33 (Arrow (BoxTy [] (BaseTy "A")) (BaseTy "A")) 
expected33 = Right ()
test33 = TestCase (assertEqual "33. Checking type of axiom T" result33 expected33)

-- Checking let box u = box x:int, y:int. (x + y) in u⟨x→5, y→2⟩ against int 
arg34 = LetBox "u" (Ann (Box [("x", IntTy), ("y", IntTy)] (BinOp Add (Var "x") (Var "y"))) (BoxTy [("x", IntTy), ("y", IntTy)] IntTy)) (ModVar "u" [("x", IntT 5), ("y", IntT 2)])
ctx34 = []
modCtx34 = [] 
result34 = check modCtx34 ctx34 arg34 IntTy
expected34 = Right ()
test34 = TestCase (assertEqual "34. Checking modal program evaluating to int" result34 expected34)

-- Checking let box u = box x:int, y:int. (x + y) in u⟨x→5, y→2⟩ against [] int 
arg35 = LetBox "u" (Ann (Box [("x", IntTy), ("y", IntTy)] (BinOp Add (Var "x") (Var "y"))) (BoxTy [("x", IntTy), ("y", IntTy)] IntTy)) (Box [] (ModVar "u" [("x", IntT 5), ("y", IntT 2)]))
ctx35 = []
modCtx35 = [] 
result35 = check modCtx35 ctx35 arg35 (BoxTy [] IntTy)
expected35 = Right ()
test35 = TestCase (assertEqual "35. Checking modal program evaluating to int" result35 expected35)

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
                    test11, 
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
                    test24, 
                    test25, 
                    test26,
                    test27,
                    test28,
                    test29,
                    test30,
                    test31,
                    test32,
                    test33,
                    test34,
                    test35
                ]

main :: IO ()
main = do
    result <- runTestTT tests
    if failures result > 0 then exitFailure else exitSuccess
