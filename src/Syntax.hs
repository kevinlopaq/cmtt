module Syntax where

type Ctx = [(String, Type)] -- x:A
type ModCtx = [(String,(Type, Ctx))] -- u::A[Ψ]
type Subs = [(String, Term)] -- (x₁ → e₁, ... ,xₙ → eₙ)

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
    | Sum Type Type
    | BoxTy Ctx Type -- [Ψ]A
    | DiaTy Ctx Type -- ⟨Ψ⟩A
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
    | Ret Subs Term -- ret ⟨σ⟩ e
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