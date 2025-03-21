module SimSubstitution where

import Syntax
import Data.Set (Set, member, notMember, fromList, toList, union, singleton, intersection)

import Substitution

-- M[σ]
simSubstitute :: Term -> Subs -> Term
simSubstitute (Var x) sigma = 
    case lookup x sigma of 
        Just e -> e 
        Nothing -> Var x
simSubstitute (ModVar u tau) sigma = ModVar u (simSubstituteSubs tau sigma) 
simSubstitute FalseT sigma = FalseT
simSubstitute TrueT sigma = TrueT
simSubstitute (IntT n) sigma = IntT n
simSubstitute (Pair e1 e2) sigma = Pair (simSubstitute e1 sigma) (simSubstitute e2 sigma)
simSubstitute (Fst e) sigma = Fst (simSubstitute e sigma)
simSubstitute (Snd e) sigma = Snd (simSubstitute e sigma)
simSubstitute (InL e) sigma = InL (simSubstitute e sigma)
simSubstitute (InR e) sigma = InR (simSubstitute e sigma)
simSubstitute (Case e x1 e1 x2 e2) sigma =
    let 
        e' = simSubstitute e sigma
        sigma1 = diffSubs sigma (singleton x1)
        v1 = fv e1 
        w1 = restSubs sigma1 v1
        w1' = fvSubs w1
        x1' = freshVar x1 (w1' `union` (domSubs sigma1))
        sigma1' = (x1, (Var x1'))  : sigma1
        sigma2 = diffSubs sigma (singleton x2)
        v2 = fv e2 
        w2 = restSubs sigma2 v2
        w2' = fvSubs w2
        x2' = freshVar x2 (w2' `union` (domSubs sigma2))
        sigma2' = (x2, (Var x2'))  : sigma2 
    in
        Case e' x1' (simSubstitute e1 sigma1') x2' (simSubstitute e2 sigma2') 
simSubstitute (Lam x e) sigma =
    let 
        sigma' = diffSubs sigma (singleton x)
        v = fv e 
        w = restSubs sigma' v
        w' = fvSubs w 
        x' = freshVar x (w' `union` (domSubs sigma'))
        sigma'' = (x, (Var x'))  : sigma' 
    in 
        Lam x' (simSubstitute e sigma'')
simSubstitute (Fun f x e) sigma = 
    let 
        sigma' = diffSubs sigma (fromList [x, f]) 
        v = fv e
        w = restSubs sigma' v 
        w' = fvSubs w 
        f' = freshVar f (w' `union` (domSubs sigma'))
        x' = freshVar x' (w' `union` (domSubs sigma'))
        sigma'' = (f, (Var f')) : ((x, (Var x'))  : sigma')
    in 
        Fun f' x' (simSubstitute e sigma'')
simSubstitute (LetVal x e1 e2) sigma =
    let 
        e1' = simSubstitute e1 sigma
        -- same as for lambdas
        sigma' = diffSubs sigma (singleton x)
        v = fv e2 
        w = restSubs sigma' v
        w' = fvSubs w 
        x' = freshVar x (w' `union` (domSubs sigma'))
        sigma'' = (x, (Var x'))  : sigma'
    in LetVal x' e1' (simSubstitute e2 sigma'')
simSubstitute (App e1 e2) sigma = App (simSubstitute e1 sigma) (simSubstitute e2 sigma)
simSubstitute (BinOp op e1 e2) sigma = BinOp op (simSubstitute e1 sigma) (simSubstitute e2 sigma)
simSubstitute (BinPred pred e1 e2) sigma = BinPred pred (simSubstitute e1 sigma) (simSubstitute e2 sigma)
simSubstitute (IfThenElse b e1 e2) sigma = IfThenElse (simSubstitute b sigma) (simSubstitute e1 sigma) (simSubstitute e2 sigma) 
simSubstitute (Box ctx e) _ = Box ctx e 
simSubstitute (LetBox u e1 e2) sigma = LetBox u (simSubstitute e1 sigma) (simSubstitute e2 sigma)
simSubstitute (Do c) sigma = Do (simSubstitute c sigma)
simSubstitute (Ret tau e) sigma = Ret (simSubstituteSubs tau sigma) (simSubstitute e sigma) 
simSubstitute (Seq ctx x e c) sigma = 
    let 
        e' = simSubstitute e sigma 
        sigma' = diffSubs sigma ((singleton x) `union` (domCtx ctx)) 
        v = fv c
        w = restSubs sigma' v 
        w' = fvSubs w 
        ctx' = freshVarCtx ctx (w' `union` (domSubs sigma'))
        x' = freshVar x' (w' `union` (domSubs sigma'))
        c' = substituteLst c (map fst ctx) (map fst ctx') 
        sigma'' = (x, (Var x'))  : sigma'
    in 
        Seq ctx' x' e' (simSubstitute c' sigma')
simSubstitute (Ann e ty) sigma = Ann (simSubstitute e sigma) ty 

simSubstituteSubs :: Subs -> Subs -> Subs
simSubstituteSubs [] _  = [] 
simSubstituteSubs ( (y, m) : tau ) sigma  = (y, simSubstitute m sigma)  : (simSubstituteSubs tau sigma)
