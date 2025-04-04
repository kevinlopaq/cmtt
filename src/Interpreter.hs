module Interpreter where

import Syntax 
import Substitution

fullEval :: Term -> Term 
fullEval t =
    let t' = eval t 
    in if t' == t then t else fullEval t' 

eval :: Term -> Term 
eval Unit = Unit
eval (Var x) = Var x
eval (ModVar u sigma) = ModVar u sigma
eval TrueT = TrueT 
eval FalseT = FalseT 
eval (IntT n) = IntT n
eval (BinOp op e1 e2) =
    case eval e1 of 
        IntT n1 ->  
            case eval e2 of 
                IntT n2 -> IntT (n1 + n2)
                e2' -> BinOp op (IntT n1) e2' 
        e1' -> BinOp op e1' e2 
eval (Lam x t) = Lam x t
eval (App e1 e2) = 
    case eval e1 of
        Lam x body -> 
            if isValue e2 then 
                substitute body x e2 
            else 
                App (Lam x body) (eval e2)
        e1' -> App e1' e2


isValue :: Term -> Bool
isValue (IntT _) = True 
isValue TrueT = True
isValue FalseT = True  
isValue Unit = True
isValue (Lam _ _) = True
isValue (Fun _ _ _) = True
isValue (Pair e1 e2) = isValue e1 && isValue e2
isValue (InL e) = isValue e 
isValue (InR e) = isValue e
isValue (Box _ _) = True 
isValue (Do _) = True 
isValue (Ret sigma e) = isValueSubs sigma && isValue e
isValue _ = False

isValueSubs :: Subs -> Bool 
isValueSubs [] = True 
isValueSubs ((x, e):sigma) = isValue e && isValueSubs sigma 