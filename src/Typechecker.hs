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
    | NotADiaType Type
    | DifferentContexts Ctx Ctx
    | SubstitutionLengthMismatch 
    | TypingError String -- general error
    deriving (Show, Eq)

-- Δ;Γ ⊢ σ <= Ψ
checkSubs :: ModCtx -> Ctx -> Subs -> Ctx -> Either Error ()
checkSubs delta gamma sigma psi 
    | length sigma /= length psi = Left (SubstitutionLengthMismatch)
    | otherwise = mapM_ (uncurry (check delta gamma)) (zip (map snd sigma) (map snd psi))

-- Δ;Γ ⊢ c <≑ A⟨Ψ⟩
checkPoss :: ModCtx -> Ctx -> Term -> Type -> Ctx -> Either Error ()
checkPoss delta gamma (Ret sigma e) t psi = 
    checkSubs delta gamma sigma psi >> check delta gamma e t
checkPoss delta gamma (Seq psi x e c) t theta =
    check delta gamma e (DiaTy psi t) >> checkPoss delta ((x, t): psi) c t theta
checkPoss delta gamma (LetBox u e c) t theta = do
    ty <- synth delta gamma e
    case ty of
        BoxTy psi ty' -> 
            checkPoss ((u, (ty', psi)) : delta) gamma c t theta
        _ -> Left (NotABoxType ty)

-- Δ;Γ ⊢ e <= A
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
check modCtx ctx (InL e) t = do
    case t of 
        Sum t1 _ -> check modCtx ctx e t1
        _        -> Left (NotASumType t)
check modCtx ctx (InR e) t = do
    case t of 
        Sum _ t2 -> check modCtx ctx e t2
        _        -> Left (NotASumType t)
check modCtx ctx (LetVal x e1 e2) t = do
    t1 <- synth modCtx ctx e1
    check modCtx ((x, t1): ctx) e2 t
check modCtx ctx (Fun f x e) t =
    case t of
        Arrow t1 t2 -> check modCtx ((f, Arrow t1 t2):( (x, t1) : ctx)) e t2
        _ -> Left (NotAFunctionType t)
check modCtx ctx (IfThenElse b e1 e2) t = 
    check modCtx ctx b BoolTy >> check modCtx ctx e1 t >> check modCtx ctx e2 t
check modCtx ctx (Box psi e) t = 
    case t of
        BoxTy psi' ty 
            | eqCtx psi psi' -> check modCtx psi e ty
            | otherwise      -> Left(DifferentContexts psi psi')
        _ -> Left (NotABoxType t)
check modCtx ctx (LetBox u e1 e2) t = do
    t1 <- synth modCtx ctx e1
    case t1 of
        BoxTy psi ty -> check ((u, (ty, psi)) : modCtx) ctx e2 t
        _            -> Left (NotABoxType t1)
-- T-Do
check modCtx ctx (Do c) t =
    case t of 
        DiaTy psi ty -> checkPoss modCtx ctx c ty psi
        unexpectedType -> Left (NotADiaType unexpectedType)
-- T-Subs
check modCtx ctx e ty = do 
    inferred <- synth modCtx ctx e 
    unless (inferred == ty) $ Left (TypeMismatch {expected = ty, actual = inferred})

-- Δ;Γ ⊢ e => A
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
synth modCtx ctx (BinOp op e1 e2) = check modCtx ctx e1 IntTy >> check modCtx ctx e2 IntTy >> return IntTy
synth modCtx ctx (BinPred pred e1 e2) = check modCtx ctx e1 IntTy >> check modCtx ctx e2 IntTy >> return BoolTy
synth modCtx ctx (Ann e ty) = ty <$ check modCtx ctx e ty
synth _ _ term  = Left (TypingError $ "Could not inferr a type for the provided term: " ++ show term)