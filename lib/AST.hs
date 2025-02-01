module AST where

import Data.List (elemIndex)

type Ctx = [(String, Type)]

-- Types
data Type 
    = BaseTy String
    | UnitTy
    | Empty
    | IntTy
    | BoolTy
    | Arrow Type Type
    | BoxTy Ctx Type
    deriving (Show, Eq) 

-- Terms
data Term
    = Unit
    | Var String
    | FalseT
    | TrueT
    | IntT Int
    | App Term Term
    | Lam String Term
    | Ann Term Type
    | Box Ctx Term
    deriving (Show, Eq)
