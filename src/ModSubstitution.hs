module ModSubstitution where   

import Syntax
import Data.Set (Set, member, notMember, fromList, toList, union, singleton, intersection)
import Data.List (elemIndex)

import SimSubstitution (simSubstitute)
import Substitution (renameSubs)

-- M〚Ψ.N/u〛
modSubstitute :: Term -> String -> Ctx -> Term -> Term
modSubstitute (Var x) _ _ _ = Var x
modSubstitute (ModVar u tau) v ctx m = 
    if v == u then 
        let 
            tau' = modSubstituteSubs tau u ctx m
            -- Rename the previous substitution according to the context
            tauCtx = renameSubs tau' ctx
        in 
            -- Apply resulting substitution to m
            simSubstitute m tauCtx
    else 
        ModVar u (modSubstituteSubs tau v ctx m)
modSubstitute FalseT _ _ _ = FalseT
modSubstitute TrueT _ _ _ = TrueT
modSubstitute (IntT n) _ _ _ = IntT n
modSubstitute (Pair e1 e2) u ctx n = Pair (modSubstitute e1 u ctx n) (modSubstitute e2 u ctx n)
modSubstitute (Fst e) u ctx n = Fst (modSubstitute e u ctx n)
modSubstitute (Snd e) u ctx n = Snd (modSubstitute e u ctx n)
modSubstitute (InL e) u ctx n = InL (modSubstitute e u ctx n)
modSubstitute (InR e) u ctx n = InR (modSubstitute e u ctx n)
modSubstitute (App m n) u ctx n' = App (modSubstitute m u ctx n') (modSubstitute n u ctx n')
modSubstitute (Lam x m) u ctx n = Lam x (modSubstitute m u ctx n)
modSubstitute (Box gamma n) u ctx m = Box gamma (modSubstitute n u ctx m)
modSubstitute (LetBox v e1 e2) u ctx m = 
    let 
        e1' = modSubstitute e1 u ctx m 
    in 
        if v == u then
            LetBox v e1' e2 
        else if v `member` (fmv m) then 
            let 
                v' = freshVar v (fmv m)
                e2' = renameModVar e2 v v'
            in 
                LetBox v' e1' (modSubstitute e2' u ctx m)
        else 
            LetBox v e1' (modSubstitute e2 u ctx m)

renameModVar :: Term -> String -> String -> Term 
renameModVar (ModVar u sigma) v w =
    if v == u then 
        ModVar w sigma 
    else 
        ModVar u sigma
renameModVar (LetBox u e1 e2) v w = 
    if v == u then 
        LetBox w (renameModVar e1 v w) (renameModVar e2 v w)
    else 
        LetBox u (renameModVar e1 v w) (renameModVar e2 v w)
renameModVar e _ _ = e

modSubstituteSubs :: Subs -> String -> Ctx -> Term -> Subs 
modSubstituteSubs [] _ _ _ = [] 
modSubstituteSubs ( (y, m) : sigma ) u ctx n  = (y, modSubstitute m u ctx n)  : (modSubstituteSubs sigma u ctx n)
