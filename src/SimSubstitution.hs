module SimSubstitution where

import Syntax
import Data.Set (Set, member, notMember, fromList, toList, union, singleton, intersection)

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
simSubstitute (App e1 e2) sigma = App (simSubstitute e1 sigma) (simSubstitute e2 sigma)
simSubstitute (BinOp op e1 e2) sigma = BinOp op (simSubstitute e1 sigma) (simSubstitute e2 sigma)
simSubstitute (BinPred pred e1 e2) sigma = BinPred pred (simSubstitute e1 sigma) (simSubstitute e2 sigma)
simSubstitute (IfThenElse b e1 e2) sigma = IfThenElse (simSubstitute b sigma) (simSubstitute e1 sigma) (simSubstitute e2 sigma) 

simSubstitute (Box ctx e) _ = Box ctx e 
simSubstitute (LetBox u e1 e2) sigma = LetBox u (simSubstitute e1 sigma) (simSubstitute e2 sigma)
simSubstitute (Do c) sigma = Do (simSubstitute c sigma)
simSubstitute (Ann e ty) sigma = Ann (simSubstitute e sigma) ty 

simSubstituteSubs :: Subs -> Subs -> Subs
simSubstituteSubs [] _  = [] 
simSubstituteSubs ( (y, m) : tau ) sigma  = (y, simSubstitute m sigma)  : (simSubstituteSubs tau sigma)
