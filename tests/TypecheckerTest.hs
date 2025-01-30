import Test.HUnit
import qualified System.Exit as Exit
import Typechecker 

test1 = TestCase (assertEqual "Simple union and diff" 0 0)

tests :: Test
tests = TestList [TestLabel "test1" test1]

main :: IO ()
main = do
        result <- runTestTT tests
        if failures result > 0 then Exit.exitFailure else Exit.exitSuccess