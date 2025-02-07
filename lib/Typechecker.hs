module Typechecker where 

import Syntax
import Control.Monad (unless, guard)

data Error
    = UnboundVariable String
    | UnboundModalVariable String
    | TypeMismatch { expected :: Type, actual :: Type }
    | NotAFunctionType Type
    | NotAProductType Type
    | NotASumType Type
    | NotABoxType Type
    | DifferentContexts Ctx Ctx
    | SubstitutionLengthMismatch 
    | TypingError String -- general error
    deriving (Show, Eq)

check :: ModCtx -> Ctx -> Term -> Type -> Either Error ()
check modCtx ctx (Lam x e) t = 
    case t of 
        Arrow t1 t2 -> check modCtx ((x, t1) : ctx) e t2
        _ -> Left (NotAFunctionType t)
check modCtx ctx (Pair e1 e2) t =
    case t of
        Prod t1 t2 -> check modCtx ctx e1 t1 >> check modCtx ctx e2 t2
        _ -> Left (NotAProductType t)
check modCtx ctx (Case e x1 e1 x2 e2) t = do
    ty <- synth modCtx ctx e 
    case ty of 
        Sum t1 t2 -> check modCtx ((x1, t1):ctx) e1 t >> check modCtx ((x2, t2):ctx) e2 t
        _         -> Left (NotASumType ty)
check modCtx ctx (Box psi e) t = 
    case t of
        BoxTy psi' ty 
            | eqCtx psi psi' -> check modCtx psi e ty
            | otherwise      -> Left(DifferentContexts psi psi')
        _ -> Left (NotABoxType t)
check modCtx ctx (LetBox u e1 e2) t = do
    t1 <- synth modCtx ctx e1
    case t1 of
        BoxTy psi ty ->
            let newModCtx = (u, (ty, psi)) : modCtx
            in check newModCtx ctx e2 t
        unexpectedType -> Left (NotABoxType unexpectedType)
check modCtx ctx (LetVal x e1 e2) t = do
    t1 <- synth modCtx ctx e1
    check modCtx ((x, t1): ctx) e2 t
check modCtx ctx (Fun f x e) t =
    case t of
        Arrow t1 t2 -> check modCtx ((f, Arrow t1 t2):( (x, t1) : ctx)) e t2
        _ -> Left (NotAFunctionType t)
check modCtx ctx (IfThenElse b e1 e2) t = 
    check modCtx ctx b BoolTy >> check modCtx ctx e1 t >> check modCtx ctx e2 t
check modCtx ctx e ty = do
    inferred <- synth modCtx ctx e 
    unless (inferred == ty) $ Left (TypeMismatch {expected = ty, actual = inferred})

checkSubs :: ModCtx -> Ctx -> Subs -> Ctx -> Either Error ()
checkSubs modCtx gamma sigma psi 
    | length sigma /= length psi = Left (SubstitutionLengthMismatch)
    | otherwise = mapM_ (uncurry (check modCtx gamma)) (zip (map snd sigma) (map snd psi))

synth :: ModCtx -> Ctx -> Term -> Either Error Type
synth _ ctx (Var x) = 
    case lookup x ctx of
        Nothing -> Left (UnboundVariable x)
        Just ty -> Right ty
synth modCtx gamma (ModVar u sigma) =
    case lookup u modCtx of 
        Nothing -> Left (UnboundModalVariable u)
        Just (ty, psi) -> checkSubs modCtx gamma sigma psi >> return ty
synth _ _ Unit = Right UnitTy
synth _ _ TrueT = Right BoolTy
synth _ _ FalseT = Right BoolTy
synth _ _ (IntT n) = Right IntTy
synth modCtx ctx (App e1 e2) = do 
    t <- synth modCtx ctx e1 
    case t of 
        Arrow t1 t2 -> check modCtx ctx e2 t1 >> return t2
        _ -> Left (NotAFunctionType t)    
synth modCtx ctx (Fst e) = do
    t <- synth modCtx ctx e
    case t of 
        Prod t1 _ -> return t1
        _ -> Left (NotAProductType t)
synth modCtx ctx (Snd e) = do
    t <- synth modCtx ctx e
    case t of 
        Prod _ t2 -> return t2
        _ -> Left (NotAProductType t)
synth modCtx ctx (InL t2 e) = do
    t1 <- synth modCtx ctx e
    return (Sum t1 t2)
synth modCtx ctx (InR t1 e) = do
    t2 <- synth modCtx ctx e
    return (Sum t1 t2)
synth modCtx ctx (BinOp op e1 e2) = check modCtx ctx e1 IntTy >> check modCtx ctx e2 IntTy >> return IntTy
synth modCtx ctx (BinPred pred e1 e2) = check modCtx ctx e1 IntTy >> check modCtx ctx e2 IntTy >> return BoolTy
synth modCtx ctx (Ann e ty) = ty <$ check modCtx ctx e ty
synth _ _ term  = Left (TypingError $ "Could not inferr a type for the provided term: " ++ show term)