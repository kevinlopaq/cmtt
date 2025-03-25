module ModSubstitution where   

import Syntax
import Data.Set (Set, member, notMember, fromList, toList, union, singleton, intersection)
import Data.List (elemIndex)


-- M〚Ψ.N/u〛
substitute :: Term -> String -> Ctx -> Term -> Term
substitute (Var x) _ _ _ = Var x