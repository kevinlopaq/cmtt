module ModSubstitution where   

import Syntax
import Data.Set (Set, member, notMember, fromList, toList, union, singleton, intersection)
import Data.List (elemIndex)


-- M〚Ψ.N/u〛
modSubstitute :: Term -> String -> Ctx -> Term -> Term
modSubstitute (Var x) _ _ _ = Var x
modSubstitute FalseT _ _ _ = FalseT
modSubstitute TrueT _ _ _ = TrueT
modSubstitute (IntT n) _ _ _ = IntT n
modSubstitute (Pair e1 e2) u ctx n = Pair (modSubstitute e1 u ctx n) (modSubstitute e2 u ctx n)
modSubstitute (Fst e) u ctx n = Fst (modSubstitute e u ctx n)
modSubstitute (Snd e) u ctx n = Snd (modSubstitute e u ctx n)
modSubstitute (InL e) u ctx n = InL (modSubstitute e u ctx n)
modSubstitute (InR e) u ctx n = InR (modSubstitute e u ctx n)

modSubstituteSubs :: Subs -> String -> Ctx -> Term -> Subs 
modSubstituteSubs [] _ _ _ = [] 
modSubstituteSubs ( (y, m) : sigma ) u ctx n  = (y, modSubstitute m u ctx n)  : (modSubstituteSubs sigma u ctx n)
