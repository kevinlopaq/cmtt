import Test.HUnit
import System.Exit (exitFailure, exitSuccess)
import Syntax
import ModSubstitution

--modSubstitute (ModVar u tau) v ctx m = 

-- 〚 x: A → A, y : A . app(x, y) / u〛 u⟨x → λz.z , y → 3⟩ 
arg0 = ModVar "u" [("x", Lam "z" (Var "z")), ("y", IntT 3)]
ctx0 = [("x", Arrow IntTy IntTy), ("y", IntTy)]
result0 = modSubstitute arg0 "u" ctx0 (App (Var "x") (Var "y"))  
expected0 = App (Lam "z" (Var "z")) (IntT 3)
test0 = TestCase (assertEqual "0. Testing modal substitution" result0 expected0)

tests = TestList [
                    test0
                ]

main :: IO ()
main = do
    result <- runTestTT tests
    if failures result > 0 then exitFailure else exitSuccess
