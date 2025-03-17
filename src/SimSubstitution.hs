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


simSubstituteSubs :: Subs -> Subs -> Subs
simSubstituteSubs [] _  = [] 
simSubstituteSubs ( (y, m) : tau ) sigma  = (y, simSubstitute m sigma)  : (simSubstituteSubs tau sigma)
