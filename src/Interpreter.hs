module Interpreter where

import Syntax 
import Substitution
import ModSubstitution

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
                IntT n2 -> 
                    case op of 
                        Add -> IntT (n1 + n2)
                        Sub -> IntT (n1 - n2)
                        Mul -> IntT (n1 * n2)
                        Div -> IntT (n1 `div` n2)
                e2' -> BinOp op (IntT n1) e2' 
        e1' -> BinOp op e1' e2 
eval (BinPred pred e1 e2) =
    case eval e1 of 
        IntT n1 ->  
            case eval e2 of 
                IntT n2 -> 
                    case pred of 
                        Eq -> if n1 == n2 then TrueT else FalseT 
                        LessThan ->  if n1 <= n2 then TrueT else FalseT 
                        GreaterThan -> if n2 <= n1 then TrueT else FalseT 
                e2' -> BinPred pred (IntT n1) e2' 
        e1' -> BinPred pred e1' e2 
eval (Lam x t) = Lam x t
eval (Fun f x e) = Fun f x e 
eval (App (Fun f x e1) e2) =
    case eval e2 of 
        v2 | isValue v2 -> substitute (substitute e1 x v2) f (Fun f x e1)
        e2' -> App (Fun f x e1) e2'
eval (App e1 e2) = 
    case eval e1 of
        Lam x body -> 
            if isValue e2 then 
                substitute body x e2 
            else 
                App (Lam x body) (eval e2)
        e1' -> App e1' e2
eval (Pair e1 e2) =
    case eval e1 of
        v1 | isValue v1 -> Pair v1 (eval e2)
        e1' -> Pair e1' e2
eval (Fst e) = 
    case eval e of 
        Pair e1 _ -> e1 
        e' -> Fst e' 
eval (Snd e) = 
        case eval e of 
        Pair _ e2 -> e2 
        e' -> Snd e' 
eval (InL e) = InL (eval e)
eval (InR e) = InR (eval e)
eval (Case e x1 e1 x2 e2) =
    case eval e of
        InL v1 | isValue v1 -> substitute e1 x1 v1
        InR v2 | isValue v2 -> substitute e2 x2 v2
        e' -> Case e' x1 e1 x2 e2
eval (LetVal x e1 e2) =
    case eval e1 of 
        v1 | isValue v1 -> substitute e2 x e1
        e1' -> LetVal x e1' e2
eval (IfThenElse b e1 e2) =
    case eval b of 
        TrueT -> e1 
        FalseT -> e2 
        b' -> IfThenElse b' e1 e2
eval (Box ctx e) = Box ctx e
eval (LetBox u e1 e2) =
    case eval e1 of 
        Box ctx e3 -> modSubstitute e2 u ctx e3 
        e1' -> LetBox u e1' e2
eval (Ann e ty) = eval e


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