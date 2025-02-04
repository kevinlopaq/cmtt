module Syntax where

type Ctx = [(String, Type)]
type ModCtx = [(String, Ctx, Type)]

eqCtx :: Ctx -> Ctx -> Bool
eqCtx ctx1 ctx2 = map snd ctx1 == map snd ctx2

data Type 
    = BaseTy String
    | UnitTy
    | Empty
    | IntTy
    | BoolTy
    | Arrow Type Type
    | Prod Type Type
    | BoxTy Ctx Type
    deriving (Show, Eq) 

data Term
    = Unit
    | Var String
    | FalseT
    | TrueT
    | IntT Int
    | App Term Term
    | Lam String Term
    | Pair Term Term
    | Fst Term 
    | Snd Term
    | BinOp Op Term Term
    | Ann Term Type
    | Box Ctx Term
    deriving (Show, Eq)

data Op 
    = Add 
    | Sub 
    | Mul 
    | Div
    deriving (Show, Eq)

