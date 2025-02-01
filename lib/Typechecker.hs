module Typechecker where 

import AST

data Error
    = UnboundVariable String
    | TypeMismatch { expected :: Type, actual :: Type }
    | NotAFunctionType Type
    | NotAProductType Type
    | NotABoxType Type
    | TypingError String -- general error
    deriving (Show, Eq)

check :: Ctx -> Term -> Type -> Either Error ()
check ctx (Lam x e) t = 
    case t of 
        Arrow t1 t2 -> check ((x, t1) : ctx) e t2
        _ -> Left (NotAFunctionType t)
check ctx (Pair e1 e2) t =
    case t of
        Prod t1 t2 -> check ctx e1 t1 >> check ctx e2 t2
        _ -> Left (NotAProductType t)
check ctx (Box psi e) (BoxTy psi' ty) = check psi e ty  
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
synth ctx (Fst e) = do
    t <- synth ctx e
    case t of 
        Prod t1 _ -> return t1
        _ -> Left (NotAProductType t)
synth ctx (Snd e) = do
    t <- synth ctx e
    case t of 
        Prod _ t2 -> return t2
        _ -> Left (NotAProductType t)
synth ctx (Ann e ty) = do 
    check ctx e ty 
    return ty
synth _ term  = Left (TypingError $ "Could not inferr a type for the provided term: " ++ show term)