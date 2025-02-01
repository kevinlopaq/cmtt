module Typechecker where 

import AST

data Error
    = UnboundVariable String
    | TypeMismatch { expected :: Type, actual :: Type }
    | NotAFunctionType Type 
    | UnknownError String 
    deriving (Show, Eq)

check :: Ctx -> Term -> Type -> Either Error ()
check ctx (Lam x e) (Arrow t1 t2) = check ((x, t1) : ctx) e t2 
check ctx e ty = do
    inferred <- synth ctx e 
    if inferred == ty 
        then return ()
        else Left (TypeMismatch { expected = ty, actual = inferred})

synth :: Ctx -> Term -> Either Error Type
synth ctx (Var x) = 
    case lookup x ctx of
        Just ty -> Right ty
        Nothing -> Left (UnboundVariable x)
synth _ Unit = Right UnitTy
synth _ TrueT = Right BoolTy
synth _ FalseT = Right BoolTy
synth _ (IntT n) = Right IntTy
synth ctx (App e1 e2) = do 
    t <- synth ctx e1 
    case t of 
        Arrow t1 t2 -> check ctx e2 t1 >> return t2
        _ -> Left (NotAFunctionType t)    
synth ctx (Ann e ty) = do 
    check ctx e ty 
    return ty
synth _ term  = Left (UnknownError $ "Could not inferr a type for the provided term: " ++ show term)