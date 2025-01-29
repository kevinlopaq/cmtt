module Main where

import Control.Monad (guard)

-- Types
data Type 
    = UnitTy
    | Empty
    | IntTy
    | BoolTy
    | Arrow Type Type
    deriving (Show, Eq) 

-- Terms
data Term
    = Unit
    | Var Int
    | FalseT
    | TrueT
    | Int Int
    | App Term Term
    | Lam Term
    | Ann Term Type
    deriving (Show, Eq)

-- Typechecker stuff
type Ctx = [Type]

(?) :: Int -> [a] -> Maybe a
i ? xs = if i < length xs then Just (xs !! i) else Nothing

synth :: Ctx -> Term -> Maybe Type
synth ctx (Var i) = i ? ctx
synth _ Unit = return UnitTy
synth _ TrueT = return BoolTy
synth _ FalseT = return BoolTy
synth env (App e1 e2) = 
    case synth env e1 of 
        Just ( Arrow t1 t2 ) -> check env e2 t1 >> return t2 
        _ -> Nothing
synth ctx (Ann e ty) = check ctx e ty >> return ty  
synth _ _  = Nothing

check :: Ctx -> Term -> Type -> Maybe ()
check ctx (Lam e) (Arrow t1 t2) = check (t1 : ctx) e t2 
check ctx e ty = synth ctx e >>= guard . ( ty == ) -- Subsumption

main :: IO ()
main = putStrLn "Hello, Haskell!"
