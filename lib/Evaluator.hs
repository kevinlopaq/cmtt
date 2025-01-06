module Evaluator where

import Data.Map as Map

type Context = Map String Type

-- Function to do beta reduction on a lambda term
eval :: Term -> Term
eval (Var x) = Var x
eval (Lam x m) = Lam x (reduce m)
eval (App (Lam x m) n) = reduce (subs m x n)
eval (App m n) = 
    let m' = eval m  -- Reduce the function part of the application
        n' = eval n  -- Reduce the argument part of the application
    in if m' == m && n' == n  -- If no change in m or n, stop the reduction
        then App m' n'
        else eval (App m' n')  -- Otherwise, continue reducing

