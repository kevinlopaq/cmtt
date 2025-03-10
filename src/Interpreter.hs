module Interpreter where 

import Syntax
import Data.Set (member)

-- M[N/x]
substitute :: Term -> String -> Term -> Term
substitute (Var y) x e
    | y == x = e
    | otherwise = Var y
substitute (ModVar u sigma) x e = ModVar u (substituteSubs sigma x e) 
substitute FalseT x e = FalseT
substitute TrueT x e = TrueT
substitute (IntT n) x e = IntT n
substitute (Pair e1 e2) x e = Pair (substitute e1 x e) (substitute e2 x e)
substitute (Fst e) x e' = Fst (substitute e x e')
substitute (Snd e) x e' = Snd (substitute e x e')
substitute (InL e) x e' = InL (substitute e x e')
substitute (InR e) x e' = InR (substitute e x e')
substitute (Case e x m y n) v s =
    let e' = substitute e v s
        (x', m') = 
                if x == v then (x, m) 
                else if x `member` (fv s) then
                    let x' = freshVar x 
                        m' = substitute m x (Var x')
                    in (x', substitute m v s)
                else (x, substitute m v s)
        (y', n') = 
                if y == v then (y, n) 
                else if y `member` (fv s) then
                    let y' = freshVar y 
                        n' = substitute n y (Var y')
                    in (y', substitute n v s)
                else (y, substitute n v s)
    in Case e' x' m' y' n'
substitute (App m n) x e = App (substitute m x e) (substitute n x e)
substitute (Lam y m) x n
    | x == y = Lam y m 
    | y `member` fv n = Lam newVar (substitute newBody x n)
    | otherwise = Lam y (substitute m x n)
    where 
        newVar  = freshVar y
        newBody = substitute m y (Var newVar)
substitute (BinOp op e1 e2) x n = BinOp op (substitute e1 x n) (substitute e2 x n)
substitute (BinPred pred e1 e2) x n = BinPred pred (substitute e1 x n) (substitute e2 x n)
substitute (LetVal y e1 e2) x n = 
    let e1' = substitute e1 x n in 
        if y == x then 
            LetVal y e1' e2
        else if y `member` (fv n) then 
            let y' = freshVar y 
                e2' = substitute e2 y (Var y')
            in LetVal y' e1' (substitute e2' x n)
        else 
            LetVal y e1' (substitute e2 x n)
substitute (Box ctx e) _ _ = Box ctx e 
substitute (Ann e ty) x n = Ann (substitute e x n) ty

substituteSubs :: Subs -> String -> Term -> Subs 
substituteSubs [] _ _ = [] 
substituteSubs ( (y, m) : sigma ) x n  = (y, substitute m x n)  : (substituteSubs sigma x n)

freshVar :: String -> String 
freshVar x = x ++ "'"
