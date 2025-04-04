module Interpreter where

import Syntax 

eval :: Term -> Term 
eval Unit = Unit 
