module LeftSubstitution where

import Syntax
import Data.Set (Set, member)
import Data.List (elemIndex)

import SimSubstitution (simSubstitute)
import Substitution (renameSubs)

-- also known as monadic substitution
-- ⟨⟨ c/Ψ,x ⟩⟩d
leftSubstitution :: Term -> String -> Ctx -> Term -> Term
leftSubstitution (Ret sigma e) x psi c = 
    let 
        -- Rename substitution
        sigmaCtx = renameSubs sigma psi
        -- apply renamed substitution together with (x → e)
        sigma' = ("x", e) : sigmaCtx 
    in 
        simSubstitute c sigma'
leftSubstitution (Seq gamma y e c1) x psi c = Seq gamma y e (leftSubstitution c1 x psi c)
leftSubstitution (LetBox u e c1) x psi c2 = LetBox u e (leftSubstitution c1 x psi c2)
leftSubstitution (LetVal y e c1) x psi c2 = LetVal y e (leftSubstitution c1 x psi c2)
leftSubstitution (Case e x1 c1 x2 c2) x psi c3 = Case e x1 (leftSubstitution c1 x psi c3) x2 (leftSubstitution c2 x psi c3)
leftSubstitution _ _ _ _ = error "Monadic substitution should only be called on computations" 