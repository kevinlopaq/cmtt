module AST where

-- Types
data Type 
    = UnitTy
    | Empty
    | IntTy
    | BoolTy
    | Arrow Type Type
    deriving (Show, Eq) 

-- Named terms
data Term
    = Unit
    | Var String
    | FalseT
    | TrueT
    | IntT Int
    | App Term Term
    | Lam String Term
    | Ann Term Type
    deriving (Show, Eq)
