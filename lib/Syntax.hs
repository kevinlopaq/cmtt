module Syntax where

import Data.Set as Set

-- Types
data Type 
    = TInt
    | TBool
    | TArrow Type Type
    deriving (Show, Eq)

-- Terms
data Term
    = Var String
    | LitInt Int
    | LitBool Bool
    | Lam String Term
    deriving (Show, Eq)

-- Function to obtain the free variables of a term
fv :: Term -> Set String
fv (Var x) = Set.singleton x
fv (App m n) = Set.union (fv m) (fv n)
fv (Lam x m) = Set.difference (fv m) (Set.singleton x)

-- Function that implements capture-avoiding substitution
subs :: Term -> String -> Term -> Term
subs (Var y) x s 
    | y == x = s
    | otherwise = Var y
subs (App m n) x s = 
    App (subs m x s) (subs n x s)
subs (Lam y m) x s
    | x == y = Lam y m
    | y `Set.member` fv s =  Lam newVar (subs newBody x s)
    | otherwise = Lam y (subs m x s)
    where  
        newVar = y ++ "'"
        newBody = subs m y (Var newVar) 

