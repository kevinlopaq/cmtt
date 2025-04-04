module Interpreter where

import Syntax 

eval :: Term -> Term 
eval Unit = Unit
eval (Var x) = Var x
eval TrueT = TrueT 
eval FalseT = FalseT 
eval (IntT n) = IntT n
eval (Lam x t) = Lam x t -- Lazy

isValue :: Term -> Bool
isValue (IntT _) = True 
isValue TrueT = True
isValue FalseT = True  
isValue Unit = True
isValue (Lam _ _) = True 
isValue (Pair e1 e2) = isValue e1 && isValue e2
isValue (InL e) = isValue e 
isValue (InR e) = isValue e
isVale _ = False
