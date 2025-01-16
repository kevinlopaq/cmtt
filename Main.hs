module Main where

-- Types
data Type 
    = UnitTy
    | Empty
    | IntTy
    | BoolTy
    | Prod { t1 :: Type, t2 :: Type } 
    | Sum { t1 :: Type, t2 :: Type }
    | Arrow { dom :: Type, cod :: Type}
    deriving (Show, Eq) 

-- Terms
data Term
    = Unit
    | Var { label :: String }
    | Bool { b :: Bool }
    | Int { n :: Int }
    | Inl { e :: Term, leftTy :: Type, rightTy :: Type }
    | Inr { e :: Term, leftTy :: Type, rightTy :: Type  } 
    | Case { e :: Term, e1 :: Term, e2 :: Term }
    | Pair { e1 :: Term, e2 :: Term }
    | Fst { e :: Term }
    | Snd { e :: Term }
    | Lam { funArg :: String, argType :: Type, body :: Term }
    | App { fun :: Term, arg :: Term }
    | IfThenElse { cond :: Term, thenBranch :: Term, elseBranch :: Term }
    deriving (Show, Eq)

main :: IO ()
main = putStrLn "Hello, Haskell!"
