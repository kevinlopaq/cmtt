{-# OPTIONS_GHC -w #-}
module Parser where
import Syntax
import Data.Char (isDigit, isAlpha, isSpace)
import Data.List (isPrefixOf)
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.12

data HappyAbsSyn t4 t5 t6
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,62) ([40960,1983,64000,123,16,0,31738,0,0,0,0,0,0,0,0,0,2048,0,128,0,31738,40960,1983,64000,123,49056,7,0,0,0,0,0,0,0,0,0,64,0,4,64,7168,8,3584,0,0,0,0,0,0,0,0,0,0,49056,7,31738,0,0,0,49152,129,7168,8,33216,0,0,0,0,57344,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parse","Ann","Type","Term","unit","int","bool","\"\8594\"","\"\215\"","\"+\"","\"::\"","\"(\"","\")\"","id","intT","true","false","unitTerm","\"\\\\\"","\"\955\"","\".\"","fst","snd","inl","inr","%eof"]
        bit_start = st * 28
        bit_end = (st + 1) * 28
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..27]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (14) = happyShift action_3
action_0 (16) = happyShift action_4
action_0 (17) = happyShift action_5
action_0 (18) = happyShift action_6
action_0 (19) = happyShift action_7
action_0 (20) = happyShift action_8
action_0 (21) = happyShift action_9
action_0 (22) = happyShift action_10
action_0 (24) = happyShift action_11
action_0 (25) = happyShift action_12
action_0 (26) = happyShift action_13
action_0 (27) = happyShift action_14
action_0 (4) = happyGoto action_15
action_0 (6) = happyGoto action_2
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (14) = happyShift action_3
action_1 (16) = happyShift action_4
action_1 (17) = happyShift action_5
action_1 (18) = happyShift action_6
action_1 (19) = happyShift action_7
action_1 (20) = happyShift action_8
action_1 (21) = happyShift action_9
action_1 (22) = happyShift action_10
action_1 (24) = happyShift action_11
action_1 (25) = happyShift action_12
action_1 (26) = happyShift action_13
action_1 (27) = happyShift action_14
action_1 (6) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (13) = happyShift action_23
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (14) = happyShift action_3
action_3 (16) = happyShift action_4
action_3 (17) = happyShift action_5
action_3 (18) = happyShift action_6
action_3 (19) = happyShift action_7
action_3 (20) = happyShift action_8
action_3 (21) = happyShift action_9
action_3 (22) = happyShift action_10
action_3 (24) = happyShift action_11
action_3 (25) = happyShift action_12
action_3 (26) = happyShift action_13
action_3 (27) = happyShift action_14
action_3 (6) = happyGoto action_22
action_3 _ = happyFail (happyExpListPerState 3)

action_4 _ = happyReduce_13

action_5 _ = happyReduce_9

action_6 _ = happyReduce_10

action_7 _ = happyReduce_11

action_8 _ = happyReduce_12

action_9 (16) = happyShift action_21
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (16) = happyShift action_20
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (14) = happyShift action_3
action_11 (16) = happyShift action_4
action_11 (17) = happyShift action_5
action_11 (18) = happyShift action_6
action_11 (19) = happyShift action_7
action_11 (20) = happyShift action_8
action_11 (21) = happyShift action_9
action_11 (22) = happyShift action_10
action_11 (24) = happyShift action_11
action_11 (25) = happyShift action_12
action_11 (26) = happyShift action_13
action_11 (27) = happyShift action_14
action_11 (6) = happyGoto action_19
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (14) = happyShift action_3
action_12 (16) = happyShift action_4
action_12 (17) = happyShift action_5
action_12 (18) = happyShift action_6
action_12 (19) = happyShift action_7
action_12 (20) = happyShift action_8
action_12 (21) = happyShift action_9
action_12 (22) = happyShift action_10
action_12 (24) = happyShift action_11
action_12 (25) = happyShift action_12
action_12 (26) = happyShift action_13
action_12 (27) = happyShift action_14
action_12 (6) = happyGoto action_18
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (14) = happyShift action_3
action_13 (16) = happyShift action_4
action_13 (17) = happyShift action_5
action_13 (18) = happyShift action_6
action_13 (19) = happyShift action_7
action_13 (20) = happyShift action_8
action_13 (21) = happyShift action_9
action_13 (22) = happyShift action_10
action_13 (24) = happyShift action_11
action_13 (25) = happyShift action_12
action_13 (26) = happyShift action_13
action_13 (27) = happyShift action_14
action_13 (6) = happyGoto action_17
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (14) = happyShift action_3
action_14 (16) = happyShift action_4
action_14 (17) = happyShift action_5
action_14 (18) = happyShift action_6
action_14 (19) = happyShift action_7
action_14 (20) = happyShift action_8
action_14 (21) = happyShift action_9
action_14 (22) = happyShift action_10
action_14 (24) = happyShift action_11
action_14 (25) = happyShift action_12
action_14 (26) = happyShift action_13
action_14 (27) = happyShift action_14
action_14 (6) = happyGoto action_16
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (28) = happyAccept
action_15 _ = happyFail (happyExpListPerState 15)

action_16 _ = happyReduce_19

action_17 _ = happyReduce_18

action_18 _ = happyReduce_17

action_19 _ = happyReduce_16

action_20 (23) = happyShift action_31
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (23) = happyShift action_30
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (15) = happyShift action_29
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (7) = happyShift action_25
action_23 (8) = happyShift action_26
action_23 (9) = happyShift action_27
action_23 (16) = happyShift action_28
action_23 (5) = happyGoto action_24
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (10) = happyShift action_34
action_24 (11) = happyShift action_35
action_24 (12) = happyShift action_36
action_24 _ = happyReduce_1

action_25 _ = happyReduce_8

action_26 _ = happyReduce_7

action_27 _ = happyReduce_6

action_28 _ = happyReduce_5

action_29 _ = happyReduce_20

action_30 (14) = happyShift action_3
action_30 (16) = happyShift action_4
action_30 (17) = happyShift action_5
action_30 (18) = happyShift action_6
action_30 (19) = happyShift action_7
action_30 (20) = happyShift action_8
action_30 (21) = happyShift action_9
action_30 (22) = happyShift action_10
action_30 (24) = happyShift action_11
action_30 (25) = happyShift action_12
action_30 (26) = happyShift action_13
action_30 (27) = happyShift action_14
action_30 (6) = happyGoto action_33
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (14) = happyShift action_3
action_31 (16) = happyShift action_4
action_31 (17) = happyShift action_5
action_31 (18) = happyShift action_6
action_31 (19) = happyShift action_7
action_31 (20) = happyShift action_8
action_31 (21) = happyShift action_9
action_31 (22) = happyShift action_10
action_31 (24) = happyShift action_11
action_31 (25) = happyShift action_12
action_31 (26) = happyShift action_13
action_31 (27) = happyShift action_14
action_31 (6) = happyGoto action_32
action_31 _ = happyFail (happyExpListPerState 31)

action_32 _ = happyReduce_15

action_33 _ = happyReduce_14

action_34 (7) = happyShift action_25
action_34 (8) = happyShift action_26
action_34 (9) = happyShift action_27
action_34 (16) = happyShift action_28
action_34 (5) = happyGoto action_39
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (7) = happyShift action_25
action_35 (8) = happyShift action_26
action_35 (9) = happyShift action_27
action_35 (16) = happyShift action_28
action_35 (5) = happyGoto action_38
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (7) = happyShift action_25
action_36 (8) = happyShift action_26
action_36 (9) = happyShift action_27
action_36 (16) = happyShift action_28
action_36 (5) = happyGoto action_37
action_36 _ = happyFail (happyExpListPerState 36)

action_37 _ = happyReduce_4

action_38 _ = happyReduce_3

action_39 (10) = happyShift action_34
action_39 (11) = happyShift action_35
action_39 (12) = happyShift action_36
action_39 _ = happyReduce_2

happyReduce_1 = happySpecReduce_3  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn4
		 (Ann happy_var_1 happy_var_3
	)
happyReduction_1 _ _ _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_3  5 happyReduction_2
happyReduction_2 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (Arrow happy_var_1 happy_var_3
	)
happyReduction_2 _ _ _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_3  5 happyReduction_3
happyReduction_3 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (Prod happy_var_1 happy_var_3
	)
happyReduction_3 _ _ _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_3  5 happyReduction_4
happyReduction_4 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (Sum happy_var_1 happy_var_3
	)
happyReduction_4 _ _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_1  5 happyReduction_5
happyReduction_5 (HappyTerminal (IdTok happy_var_1))
	 =  HappyAbsSyn5
		 (BaseTy happy_var_1
	)
happyReduction_5 _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_1  5 happyReduction_6
happyReduction_6 _
	 =  HappyAbsSyn5
		 (BoolTy
	)

happyReduce_7 = happySpecReduce_1  5 happyReduction_7
happyReduction_7 _
	 =  HappyAbsSyn5
		 (IntTy
	)

happyReduce_8 = happySpecReduce_1  5 happyReduction_8
happyReduction_8 _
	 =  HappyAbsSyn5
		 (UnitTy
	)

happyReduce_9 = happySpecReduce_1  6 happyReduction_9
happyReduction_9 (HappyTerminal (IntTok happy_var_1))
	 =  HappyAbsSyn6
		 (IntT happy_var_1
	)
happyReduction_9 _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_1  6 happyReduction_10
happyReduction_10 _
	 =  HappyAbsSyn6
		 (TrueT
	)

happyReduce_11 = happySpecReduce_1  6 happyReduction_11
happyReduction_11 _
	 =  HappyAbsSyn6
		 (FalseT
	)

happyReduce_12 = happySpecReduce_1  6 happyReduction_12
happyReduction_12 _
	 =  HappyAbsSyn6
		 (Unit
	)

happyReduce_13 = happySpecReduce_1  6 happyReduction_13
happyReduction_13 (HappyTerminal (IdTok happy_var_1))
	 =  HappyAbsSyn6
		 (Var happy_var_1
	)
happyReduction_13 _  = notHappyAtAll 

happyReduce_14 = happyReduce 4 6 happyReduction_14
happyReduction_14 ((HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (IdTok happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Lam happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_15 = happyReduce 4 6 happyReduction_15
happyReduction_15 ((HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (IdTok happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Lam happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_16 = happySpecReduce_2  6 happyReduction_16
happyReduction_16 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (Fst happy_var_2
	)
happyReduction_16 _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_2  6 happyReduction_17
happyReduction_17 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (Snd happy_var_2
	)
happyReduction_17 _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_2  6 happyReduction_18
happyReduction_18 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (InL happy_var_2
	)
happyReduction_18 _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_2  6 happyReduction_19
happyReduction_19 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (InR happy_var_2
	)
happyReduction_19 _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  6 happyReduction_20
happyReduction_20 _
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (Parens happy_var_2
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 28 28 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	UnitTyTok -> cont 7;
	IntTyTok -> cont 8;
	BoolTyTok -> cont 9;
	ArrowTok -> cont 10;
	ProdTyTok -> cont 11;
	SumTok -> cont 12;
	AnnTok -> cont 13;
	LParen -> cont 14;
	RParen -> cont 15;
	IdTok happy_dollar_dollar -> cont 16;
	IntTok happy_dollar_dollar -> cont 17;
	TrueTok -> cont 18;
	FalseTok -> cont 19;
	UnitTermTok -> cont 20;
	LambdaTok -> cont 21;
	LambdaTok -> cont 22;
	LambdaBodyTok -> cont 23;
	FstTok -> cont 24;
	SndTok -> cont 25;
	InlTok -> cont 26;
	InrTok -> cont 27;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 28 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => ([(Token)], [String]) -> HappyIdentity a
happyError' = HappyIdentity . (\(tokens, _) -> parseError tokens)
parse tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError _ = error "Parse error"

data Token
    = UnitTyTok
    | IntTyTok
    | BoolTyTok
    | ArrowTok
    | ProdTyTok
    | SumTok
    | IdTok String
    | UnitTermTok
    | IntTok Int
    | TrueTok 
    | FalseTok
    | LambdaTok
    | LambdaBodyTok
    | FstTok 
    | SndTok
    | InlTok
    | InrTok
    | LParen
    | RParen
    | AnnTok 
    deriving Show

lexer :: String -> [Token]
lexer [] = []
lexer cs
    | Just ("→", rest) <- unconsPrefix "→" cs = ArrowTok : lexer rest
    | Just ("×", rest) <- unconsPrefix "×" cs = ProdTyTok : lexer rest
    | Just ("->", rest) <- unconsPrefix "->" cs = ArrowTok : lexer rest
    | Just ("::", rest) <- unconsPrefix "::" cs = AnnTok : lexer rest
    | Just ("()", rest) <- unconsPrefix "()" cs = UnitTermTok : lexer rest
    | Just ("λ", rest) <- unconsPrefix "λ" cs = LambdaTok : lexer rest
    | Just ("\\", rest) <- unconsPrefix "\\\\" cs = LambdaTok : lexer rest
    | Just (".", rest) <- unconsPrefix "." cs = LambdaBodyTok : lexer rest
    | Just ("fst", rest) <- unconsPrefix "fst" cs = FstTok : lexer rest
    | Just ("snd", rest) <- unconsPrefix "snd" cs = SndTok : lexer rest
    | Just ("(", rest) <- unconsPrefix "(" cs = LParen : lexer rest
    | Just (")", rest) <- unconsPrefix ")" cs = RParen : lexer rest
    | Just ("inl", rest) <- unconsPrefix "inl" cs = InlTok : lexer rest
    | Just ("inr", rest) <- unconsPrefix "inr" cs = InrTok : lexer rest
    | isSpace (head cs) = lexer (tail cs)
    | isAlpha (head cs) = lexId cs
    | isDigit (head cs) = lexNum cs
    | otherwise = error $ "Unexpected character: " ++ [head cs]

lexNum cs = IntTok (read num) : lexer rest
    where (num,rest) = span isDigit cs

unconsPrefix :: String -> String -> Maybe (String, String)
unconsPrefix prefix str
    | prefix `isPrefixOf` str = Just (prefix, drop (length prefix) str)
    | otherwise = Nothing

lexId cs =
    case span isAlpha cs of
    ("unit",rest) -> UnitTyTok : lexer rest
    ("bool",rest) -> BoolTyTok : lexer rest
    ("int",rest)  -> IntTyTok : lexer rest
    (var,rest)   -> IdTok var : lexer rest

parseString =  parse . lexer
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x < y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `div` 16)) (bit `mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
