module Substitution where   

import Syntax
import Data.Set (Set, member, notMember, fromList, toList, union, singleton, intersection)
import Data.List (elemIndex)

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
                    let x' = freshVar x (fv s)
                        m' = substitute m x (Var x')
                    in (x', substitute m v s)
                else (x, substitute m v s)
        (y', n') = 
                if y == v then (y, n) 
                else if y `member` (fv s) then
                    let y' = freshVar y (fv s) 
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
        newVar  = freshVar y (fv n)
        newBody = substitute m y (Var newVar)
substitute (BinOp op e1 e2) x n = BinOp op (substitute e1 x n) (substitute e2 x n)
substitute (BinPred pred e1 e2) x n = BinPred pred (substitute e1 x n) (substitute e2 x n)
substitute (LetVal y e1 e2) x n = 
    let e1' = substitute e1 x n in 
        if y == x then 
            LetVal y e1' e2
        else if y `member` (fv n) then 
            let y' = freshVar y (fv n) 
                e2' = substitute e2 y (Var y')
            in LetVal y' e1' (substitute e2' x n)
        else 
            LetVal y e1' (substitute e2 x n)
substitute (Fun f x e) v s =
    if v == f || x == x then 
        Fun f x e 
    else 
        let (f', e') = if f `member` fv s
                        then let f' = freshVar f (fv s) 
                            in (f', substitute e f (Var f'))
                        else (f, e)
            (x', e'') = if x `member` fv s 
                        then let x' = freshVar x (fv s) 
                            in (x', substitute e' x (Var x'))
                        else (x, e')
            eFinal = substitute e'' v s
        in Fun f' x' eFinal
substitute (Box ctx e) _ _ = Box ctx e
substitute (LetBox u e1 e2) x m = LetBox u (substitute e1 x m) (substitute e2 x m)
substitute (Do c) x m = Do (substitute c x m)
substitute (Ret sigma e) x m = Ret (substituteSubs sigma x m) (substitute e x m)
substitute (Seq ctx x e c) y m = 
    let 
        e' = substitute e y m 
    in         
        if x == y || y `member` (fromList (map fst ctx)) then 
            Seq ctx x e' c
        else
            let 
                i = toList ((fv m) `intersection` ( fromList(map fst ctx) `union` (singleton x)))
                i' = freshVars i ((fv m) `union` ( fromList(map fst ctx) `union` (singleton x)))
                x' = case elemIndex x i of
                    Just idx -> i' !! idx
                    Nothing  -> x
                c' = substituteLst c i i'
                ctx' = substituteLstCtx ctx i i'
            in
                Seq ctx' x' e' c'
substitute (Ann e ty) x n = Ann (substitute e x n) ty

substituteSubs :: Subs -> String -> Term -> Subs 
substituteSubs [] _ _ = [] 
substituteSubs ( (y, m) : sigma ) x n  = (y, substitute m x n)  : (substituteSubs sigma x n)

-- lst1 and lst2 must have the same length!
substituteLst :: Term -> [String] -> [String] -> Term
substituteLst e lst1 lst2 = 
    foldl (\term (x, x') -> substitute term x (Var x')) e (zip lst1 lst2)

substituteLstCtx :: Ctx -> [String] -> [String] -> Ctx
substituteLstCtx ctx lst1 lst2 = map substituteVar ctx
    where
        substituteVar (var, typ) = 
            case elemIndex var lst1 of
                Just idx -> (lst2 !! idx, typ)
                Nothing  -> (var, typ)         
