module Syntax where

import Data.Set (Set, empty, singleton, union, difference, member, notMember, fromList)

type Ctx = [(String, Type)] -- x:A
type ModCtx = [(String,(Type, Ctx))] -- u::A[Ψ]
type Subs = [(String, Term)] -- (x₁ → e₁, ... ,xₙ → eₙ)

eqCtx :: Ctx -> Ctx -> Bool
eqCtx ctx1 ctx2 = length ctx1 == length ctx2 && all eqTypes (zip (map snd ctx1) (map snd ctx2))
    where
        eqTypes (UnspecCtxTy, _) = True 
        eqTypes (_, UnspecCtxTy) = True
        eqTypes (t1, t2) = t1 == t2


data Type 
    = BaseTy String
    | UnitTy
    | Empty
    | IntTy
    | BoolTy
    | Arrow Type Type
    | Prod Type Type
    | Sum Type Type
    | BoxTy Ctx Type -- [Ψ]A
    | DiaTy Ctx Type -- ⟨Ψ⟩A
    | UnspecCtxTy 
    deriving (Show, Eq) 

data Term
    = Unit
    | Var String
    | ModVar String Subs -- u⟨σ⟩ 
    | FalseT
    | TrueT
    | IntT Int
    | App Term Term
    | Lam String Term
    | Pair Term Term
    | Fst Term 
    | Snd Term
    | InL Term
    | InR Term
    | Case Term String Term String Term
    | BinOp Op Term Term
    | BinPred Pred Term Term
    | LetVal String Term Term
    | IfThenElse Term Term Term
    | Fun String String Term
    | Box Ctx Term
    | LetBox String Term Term
    | Do Term 
    | Ret Subs Term -- ret ⟨σ, e⟩
    | Seq Ctx String Term Term -- Ψ,x ← e; c
    | Ann Term Type
    deriving (Show, Eq)

-- Binary operations for integers
data Op
    = Add 
    | Sub 
    | Mul 
    | Div -- Integer division
    deriving (Show, Eq)

-- Binary predicates for integers
data Pred
    = Eq
    | LessThan
    | GreaterThan
    deriving (Show, Eq)

fv :: Term -> Set String
fv Unit = empty
fv TrueT = empty 
fv FalseT = empty 
fv (IntT n) = empty
fv (Var x) = singleton x
fv (ModVar u subs) = fvSubs subs 
fv (App e1 e2) = (fv e1) `union` (fv e2)
fv (Lam x e) = (fv e) `difference` (singleton x)
fv (Pair e1 e2) = (fv e1) `union` (fv e2)
fv (Fst e) = fv e
fv (Snd e) = fv e
fv (InL e) = fv e
fv (InR e) = fv e
fv (BinOp op e1 e2) = (fv e1) `union` (fv e2)
fv (BinPred pred e1 e2) = (fv e1) `union` (fv e2)
fv (LetVal x e1 e2) = (fv e1) `union` ((fv e2) `difference` (singleton x)) 
fv (IfThenElse b e1 e2) = (fv b) `union` (fv e1) `union` (fv e2)
fv (Case e0 x1 e1 x2 e2) = (fv e0) `union` ((fv e1) `difference` (singleton x1)) `union` ((fv e2) `difference` (singleton x2))
fv (Fun f x e) = (fv e) `difference` fromList [f, x]
fv (Box ctx e) = empty 
fv (LetBox u e1 e2) = (fv e1) `union` (fv e2)
fv (Do c) = fv c
fv (Ret sigma e) = (fvSubs sigma) `union` (fv e)
fv (Seq ctx x e c) = (fv e) `union` ( (fv c) `difference` ( fromList (map fst ctx) `union` (singleton x) ) ) 
fv (Ann e ty) = fv e

fvSubs :: Subs -> Set String
fvSubs [] = empty
fvSubs ((x, e) : subs) = (fv e) `union` (fvSubs subs)

fmv :: Term -> Set String 
fmv Unit = empty
fmv TrueT = empty 
fmv FalseT = empty 
fmv (IntT n) = empty
fmv (Var x) = empty
fmv (ModVar u subs) = (fmvSubs subs) `union` (singleton u)
fmv (App e1 e2) = (fmv e1) `union` (fmv e2)
fmv (Lam x e) = fmv e
fmv (Pair e1 e2) = (fmv e1) `union` (fmv e2)
fmv (Fst e) = fmv e
fmv (Snd e) = fmv e
fmv (InL e) = fmv e
fmv (InR e) = fmv e
fmv (BinOp op e1 e2) = (fmv e1) `union` (fmv e2)
fmv (BinPred pred e1 e2) = (fmv e1) `union` (fmv e2)
fmv (IfThenElse b e1 e2) = (fmv b) `union` (fmv e1) `union` (fmv e2)
fmv (LetVal x e1 e2) = (fmv e1) `union` (fmv e2)  
fmv (Case e0 x1 e1 x2 e2) = (fmv e0) `union` (fmv e1) `union` (fmv e2)
fmv (Fun f x e) = (fmv e)
fmv (Box ctx e) = fmv e
fmv (LetBox u e1 e2) = (fv e1) `union` (fv e2 `difference` (singleton u))
fmv (Do c) = fmv c
fmv (Ret sigma e) = (fmvSubs sigma) `union` (fmv e)
fmv (Seq ctx x e c) = (fmv e) `union`  (fmv c)
fmv (Ann e ty) = fmv e

fmvSubs :: Subs -> Set String 
fmvSubs [] = empty
fmvSubs ((x, e) : subs) = (fmv e) `union` (fmvSubs subs)

diffSubs :: Subs -> Set String -> Subs 
diffSubs sigma s = [(y, e) | (y, e) <- sigma, y `notMember` s]

-- Restriction
restSubs ::  Subs -> Set String -> Subs
restSubs sigma v = [(x, t) | (x, t) <- sigma, x `member` v]

domSubs :: Subs -> Set String 
domSubs sigma = fromList [ x | (x, t) <- sigma]

freshVar :: String -> Set String -> String 
freshVar x usedVars = 
    if x `notMember` usedVars then x
    else 
        head $ filter (`notMember` usedVars) candidates
    where 
        candidates = [x ++ show i | i <- [1 :: Int ..]]

freshVars :: [String] -> Set String -> [String]
freshVars l set  = map (\x -> freshVar x set) l

freshVarCtx :: Ctx -> Set String -> Ctx
freshVarCtx ctx set = map (\(x, y) -> (freshVar x set, y)) ctx