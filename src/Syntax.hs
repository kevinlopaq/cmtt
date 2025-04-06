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

-- Pretty print a type
prettyPrintType :: Type -> String
prettyPrintType (BaseTy s)      = s
prettyPrintType UnitTy          = "unit"
prettyPrintType Empty           = "empty"
prettyPrintType IntTy           = "int"
prettyPrintType BoolTy          = "bool"
prettyPrintType (Arrow t1 t2)   = "(" ++ prettyPrintType t1 ++ " → " ++ prettyPrintType t2 ++ ")"
prettyPrintType (Prod t1 t2)    = "(" ++ prettyPrintType t1 ++ " × " ++ prettyPrintType t2 ++ ")"
prettyPrintType (Sum t1 t2)     = "(" ++ prettyPrintType t1 ++ " + " ++ prettyPrintType t2 ++ ")"
prettyPrintType (BoxTy ctx t)   = "[" ++ prettyPrintCtx ctx ++ "]" ++ prettyPrintType t
prettyPrintType (DiaTy ctx t)   = "⟨" ++ prettyPrintCtx ctx ++ "⟩" ++ prettyPrintType t
--prettyPrintType UnspecCtxTy     =

-- Pretty print a context
prettyPrintCtx :: Ctx -> String
prettyPrintCtx [] = ""
prettyPrintCtx ctx =  unwords [x ++ ":" ++ prettyPrintType t | (x, t) <- ctx]

-- Pretty print a Term
prettyPrintTerm :: Term -> String
prettyPrintTerm Unit                = "()"
prettyPrintTerm (Var x)             = x
prettyPrintTerm (ModVar v _)        = v -- Expand substitution here
prettyPrintTerm FalseT              = "false"
prettyPrintTerm TrueT               = "true"
prettyPrintTerm (IntT n)            = show n
prettyPrintTerm (App t1 t2)         = "(" ++ prettyPrintTerm t1 ++ " " ++ prettyPrintTerm t2 ++ ")"
prettyPrintTerm (Lam x t)           = "λ" ++ x ++ ". " ++ prettyPrintTerm t
prettyPrintTerm (Pair t1 t2)        = "(" ++ prettyPrintTerm t1 ++ ", " ++ prettyPrintTerm t2 ++ ")"
prettyPrintTerm (Fst t)             = "fst " ++ prettyPrintTerm t
prettyPrintTerm (Snd t)             = "snd " ++ prettyPrintTerm t
prettyPrintTerm (InL t)             = "inl " ++ prettyPrintTerm t
prettyPrintTerm (InR t)             = "inr " ++ prettyPrintTerm t
prettyPrintTerm (Case t x1 t1 x2 t2) = "case " ++ prettyPrintTerm t ++ " of " ++ x1 ++ " -> " ++ prettyPrintTerm t1 ++ " | " ++ x2 ++ " -> " ++ prettyPrintTerm t2
prettyPrintTerm (BinOp op t1 t2)    = "(" ++ prettyPrintTerm t1 ++ " " ++ prettyPrintOp op ++ " " ++ prettyPrintTerm t2 ++ ")"
prettyPrintTerm (BinPred pred t1 t2) = "(" ++ prettyPrintTerm t1 ++ " " ++ prettyPrintPred pred ++ " " ++ prettyPrintTerm t2 ++ ")"
prettyPrintTerm (LetVal x t1 t2)    = "let " ++ x ++ " = " ++ prettyPrintTerm t1 ++ " in " ++ prettyPrintTerm t2
prettyPrintTerm (IfThenElse t1 t2 t3) = "if " ++ prettyPrintTerm t1 ++ " then " ++ prettyPrintTerm t2 ++ " else " ++ prettyPrintTerm t3
prettyPrintTerm (Fun x y t)         = "fun " ++ x ++ " " ++ y ++ " -> " ++ prettyPrintTerm t
prettyPrintTerm (Box ctx t)         = "box " ++ prettyPrintCtx ctx ++ prettyPrintTerm t
prettyPrintTerm (LetBox x t1 t2)    = "let box " ++ x ++ " = " ++ prettyPrintTerm t1 ++ " in " ++ prettyPrintTerm t2
prettyPrintTerm (Do t)              = "do " ++ prettyPrintTerm t
prettyPrintTerm (Ret _ t)           = "ret " ++ prettyPrintTerm t
prettyPrintTerm (Seq ctx x t1 t2)   = prettyPrintCtx ctx ++ ", " ++ x ++ " ← " ++ prettyPrintTerm t1 ++ "; " ++ prettyPrintTerm t2
prettyPrintTerm (Ann t ty)          = prettyPrintTerm t ++ " : " ++ prettyPrintType ty

-- Pretty print Binary operation (for BinOp)
prettyPrintOp :: Op -> String
prettyPrintOp Add    = "+"
prettyPrintOp Sub    = "-"
prettyPrintOp Mul    = "*"
prettyPrintOp Div    = "/"

-- Pretty print Binary predicate (for BinPred)
prettyPrintPred :: Pred -> String
prettyPrintPred Eq        = "=="
prettyPrintPred LessThan  = "<"
prettyPrintPred GreaterThan = ">"

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

domCtx :: Ctx -> Set String
domCtx ctx = fromList [x | (x, y) <- ctx]

freshVars :: [String] -> Set String -> [String]
freshVars l set  = map (\x -> freshVar x set) l

freshVarCtx :: Ctx -> Set String -> Ctx
freshVarCtx ctx set = map (\(x, y) -> (freshVar x set, y)) ctx
