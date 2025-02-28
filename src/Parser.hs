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

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,171) ([0,50512,8127,0,64,0,0,256,0,0,0,0,0,50512,8127,0,50514,8127,0,50512,8127,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16384,0,0,16384,0,0,50512,8127,0,50512,8127,0,50512,8127,0,50512,8127,0,0,12288,0,54608,8127,0,0,0,0,0,64,0,24576,0,0,32768,0,0,16384,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,64,0,0,64,0,128,0,0,512,0,0,50512,8127,0,32,0,0,50512,8127,0,128,0,14336,16644,0,0,50512,8127,0,0,0,0,50512,8127,0,50512,8127,0,50512,8127,16384,0,0,16384,0,0,0,8320,0,0,0,0,0,0,0,0,32,0,0,50512,8127,0,0,0,14336,16644,0,0,16384,0,0,0,0,0,50512,8127,0,50512,8127,0,0,0,0,0,0,0,2048,0,0,512,0,32768,3,0,0,0,0,0,0,0,0,0,0,14336,16644,0,14336,16644,0,0,0,0,0,50512,8127,0,512,0,32768,515,0,0,3,0,14336,16644,0,14336,16644,0,14336,16644,0,0,0,0,0,0,0,0,0,16384,0,0,16384,0,0,0,32768,3,0,0,50512,8127,0,50512,8127,0,0,0,0,0,0,32768,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parse","Term","Context","CtxElems","CtxElem","Subs","SubElems","SubElem","Type","unit","int","bool","\"=\"","\"\8594\"","\"\215\"","\"+\"","\"\9744\"","\"[]\"","\"@\"","\":\"","app","\",\"","\"(\"","\")\"","\"\10216\"","\"\10217\"","\"[\"","\"]\"","id","modId","intT","true","false","unitTerm","\"\\\\\"","\"\955\"","\".\"","fst","snd","inl","inr","let","box","val","in","%eof"]
        bit_start = st * 48
        bit_end = (st + 1) * 48
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..47]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (21) = happyShift action_4
action_0 (23) = happyShift action_2
action_0 (25) = happyShift action_5
action_0 (27) = happyShift action_6
action_0 (31) = happyShift action_7
action_0 (32) = happyShift action_8
action_0 (33) = happyShift action_9
action_0 (34) = happyShift action_10
action_0 (35) = happyShift action_11
action_0 (36) = happyShift action_12
action_0 (37) = happyShift action_13
action_0 (38) = happyShift action_14
action_0 (40) = happyShift action_15
action_0 (41) = happyShift action_16
action_0 (42) = happyShift action_17
action_0 (43) = happyShift action_18
action_0 (44) = happyShift action_19
action_0 (45) = happyShift action_20
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (23) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (25) = happyShift action_36
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (48) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (21) = happyShift action_4
action_4 (23) = happyShift action_2
action_4 (25) = happyShift action_5
action_4 (27) = happyShift action_6
action_4 (31) = happyShift action_7
action_4 (32) = happyShift action_8
action_4 (33) = happyShift action_9
action_4 (34) = happyShift action_10
action_4 (35) = happyShift action_11
action_4 (36) = happyShift action_12
action_4 (37) = happyShift action_13
action_4 (38) = happyShift action_14
action_4 (40) = happyShift action_15
action_4 (41) = happyShift action_16
action_4 (42) = happyShift action_17
action_4 (43) = happyShift action_18
action_4 (44) = happyShift action_19
action_4 (45) = happyShift action_20
action_4 (4) = happyGoto action_35
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (18) = happyShift action_34
action_5 (21) = happyShift action_4
action_5 (23) = happyShift action_2
action_5 (25) = happyShift action_5
action_5 (27) = happyShift action_6
action_5 (31) = happyShift action_7
action_5 (32) = happyShift action_8
action_5 (33) = happyShift action_9
action_5 (34) = happyShift action_10
action_5 (35) = happyShift action_11
action_5 (36) = happyShift action_12
action_5 (37) = happyShift action_13
action_5 (38) = happyShift action_14
action_5 (40) = happyShift action_15
action_5 (41) = happyShift action_16
action_5 (42) = happyShift action_17
action_5 (43) = happyShift action_18
action_5 (44) = happyShift action_19
action_5 (45) = happyShift action_20
action_5 (4) = happyGoto action_33
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (21) = happyShift action_4
action_6 (23) = happyShift action_2
action_6 (25) = happyShift action_5
action_6 (27) = happyShift action_6
action_6 (31) = happyShift action_7
action_6 (32) = happyShift action_8
action_6 (33) = happyShift action_9
action_6 (34) = happyShift action_10
action_6 (35) = happyShift action_11
action_6 (36) = happyShift action_12
action_6 (37) = happyShift action_13
action_6 (38) = happyShift action_14
action_6 (40) = happyShift action_15
action_6 (41) = happyShift action_16
action_6 (42) = happyShift action_17
action_6 (43) = happyShift action_18
action_6 (44) = happyShift action_19
action_6 (45) = happyShift action_20
action_6 (4) = happyGoto action_32
action_6 _ = happyFail (happyExpListPerState 6)

action_7 _ = happyReduce_6

action_8 _ = happyReduce_7

action_9 _ = happyReduce_2

action_10 _ = happyReduce_3

action_11 _ = happyReduce_4

action_12 _ = happyReduce_5

action_13 (31) = happyShift action_31
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (31) = happyShift action_30
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (21) = happyShift action_4
action_15 (23) = happyShift action_2
action_15 (25) = happyShift action_5
action_15 (27) = happyShift action_6
action_15 (31) = happyShift action_7
action_15 (32) = happyShift action_8
action_15 (33) = happyShift action_9
action_15 (34) = happyShift action_10
action_15 (35) = happyShift action_11
action_15 (36) = happyShift action_12
action_15 (37) = happyShift action_13
action_15 (38) = happyShift action_14
action_15 (40) = happyShift action_15
action_15 (41) = happyShift action_16
action_15 (42) = happyShift action_17
action_15 (43) = happyShift action_18
action_15 (44) = happyShift action_19
action_15 (45) = happyShift action_20
action_15 (4) = happyGoto action_29
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (21) = happyShift action_4
action_16 (23) = happyShift action_2
action_16 (25) = happyShift action_5
action_16 (27) = happyShift action_6
action_16 (31) = happyShift action_7
action_16 (32) = happyShift action_8
action_16 (33) = happyShift action_9
action_16 (34) = happyShift action_10
action_16 (35) = happyShift action_11
action_16 (36) = happyShift action_12
action_16 (37) = happyShift action_13
action_16 (38) = happyShift action_14
action_16 (40) = happyShift action_15
action_16 (41) = happyShift action_16
action_16 (42) = happyShift action_17
action_16 (43) = happyShift action_18
action_16 (44) = happyShift action_19
action_16 (45) = happyShift action_20
action_16 (4) = happyGoto action_28
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (21) = happyShift action_4
action_17 (23) = happyShift action_2
action_17 (25) = happyShift action_5
action_17 (27) = happyShift action_6
action_17 (31) = happyShift action_7
action_17 (32) = happyShift action_8
action_17 (33) = happyShift action_9
action_17 (34) = happyShift action_10
action_17 (35) = happyShift action_11
action_17 (36) = happyShift action_12
action_17 (37) = happyShift action_13
action_17 (38) = happyShift action_14
action_17 (40) = happyShift action_15
action_17 (41) = happyShift action_16
action_17 (42) = happyShift action_17
action_17 (43) = happyShift action_18
action_17 (44) = happyShift action_19
action_17 (45) = happyShift action_20
action_17 (4) = happyGoto action_27
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (21) = happyShift action_4
action_18 (23) = happyShift action_2
action_18 (25) = happyShift action_5
action_18 (27) = happyShift action_6
action_18 (31) = happyShift action_7
action_18 (32) = happyShift action_8
action_18 (33) = happyShift action_9
action_18 (34) = happyShift action_10
action_18 (35) = happyShift action_11
action_18 (36) = happyShift action_12
action_18 (37) = happyShift action_13
action_18 (38) = happyShift action_14
action_18 (40) = happyShift action_15
action_18 (41) = happyShift action_16
action_18 (42) = happyShift action_17
action_18 (43) = happyShift action_18
action_18 (44) = happyShift action_19
action_18 (45) = happyShift action_20
action_18 (4) = happyGoto action_26
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (45) = happyShift action_24
action_19 (46) = happyShift action_25
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (21) = happyShift action_4
action_20 (23) = happyShift action_2
action_20 (25) = happyShift action_5
action_20 (27) = happyShift action_6
action_20 (29) = happyShift action_23
action_20 (31) = happyShift action_7
action_20 (32) = happyShift action_8
action_20 (33) = happyShift action_9
action_20 (34) = happyShift action_10
action_20 (35) = happyShift action_11
action_20 (36) = happyShift action_12
action_20 (37) = happyShift action_13
action_20 (38) = happyShift action_14
action_20 (40) = happyShift action_15
action_20 (41) = happyShift action_16
action_20 (42) = happyShift action_17
action_20 (43) = happyShift action_18
action_20 (44) = happyShift action_19
action_20 (45) = happyShift action_20
action_20 (4) = happyGoto action_21
action_20 (5) = happyGoto action_22
action_20 _ = happyFail (happyExpListPerState 20)

action_21 _ = happyReduce_18

action_22 (39) = happyShift action_50
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (30) = happyShift action_48
action_23 (31) = happyShift action_49
action_23 (6) = happyGoto action_46
action_23 (7) = happyGoto action_47
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (32) = happyShift action_45
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (31) = happyShift action_44
action_25 _ = happyFail (happyExpListPerState 25)

action_26 _ = happyReduce_14

action_27 _ = happyReduce_13

action_28 _ = happyReduce_11

action_29 _ = happyReduce_10

action_30 (39) = happyShift action_43
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (39) = happyShift action_42
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (24) = happyShift action_41
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (26) = happyShift action_40
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (21) = happyShift action_4
action_34 (23) = happyShift action_2
action_34 (25) = happyShift action_5
action_34 (27) = happyShift action_6
action_34 (31) = happyShift action_7
action_34 (32) = happyShift action_8
action_34 (33) = happyShift action_9
action_34 (34) = happyShift action_10
action_34 (35) = happyShift action_11
action_34 (36) = happyShift action_12
action_34 (37) = happyShift action_13
action_34 (38) = happyShift action_14
action_34 (40) = happyShift action_15
action_34 (41) = happyShift action_16
action_34 (42) = happyShift action_17
action_34 (43) = happyShift action_18
action_34 (44) = happyShift action_19
action_34 (45) = happyShift action_20
action_34 (4) = happyGoto action_39
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (22) = happyShift action_38
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (21) = happyShift action_4
action_36 (23) = happyShift action_2
action_36 (25) = happyShift action_5
action_36 (27) = happyShift action_6
action_36 (31) = happyShift action_7
action_36 (32) = happyShift action_8
action_36 (33) = happyShift action_9
action_36 (34) = happyShift action_10
action_36 (35) = happyShift action_11
action_36 (36) = happyShift action_12
action_36 (37) = happyShift action_13
action_36 (38) = happyShift action_14
action_36 (40) = happyShift action_15
action_36 (41) = happyShift action_16
action_36 (42) = happyShift action_17
action_36 (43) = happyShift action_18
action_36 (44) = happyShift action_19
action_36 (45) = happyShift action_20
action_36 (4) = happyGoto action_37
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (24) = happyShift action_68
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (12) = happyShift action_62
action_38 (13) = happyShift action_63
action_38 (14) = happyShift action_64
action_38 (19) = happyShift action_65
action_38 (25) = happyShift action_66
action_38 (31) = happyShift action_67
action_38 (11) = happyGoto action_61
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (21) = happyShift action_4
action_39 (23) = happyShift action_2
action_39 (25) = happyShift action_5
action_39 (27) = happyShift action_6
action_39 (31) = happyShift action_7
action_39 (32) = happyShift action_8
action_39 (33) = happyShift action_9
action_39 (34) = happyShift action_10
action_39 (35) = happyShift action_11
action_39 (36) = happyShift action_12
action_39 (37) = happyShift action_13
action_39 (38) = happyShift action_14
action_39 (40) = happyShift action_15
action_39 (41) = happyShift action_16
action_39 (42) = happyShift action_17
action_39 (43) = happyShift action_18
action_39 (44) = happyShift action_19
action_39 (45) = happyShift action_20
action_39 (4) = happyGoto action_60
action_39 _ = happyFail (happyExpListPerState 39)

action_40 _ = happyReduce_15

action_41 (21) = happyShift action_4
action_41 (23) = happyShift action_2
action_41 (25) = happyShift action_5
action_41 (27) = happyShift action_6
action_41 (31) = happyShift action_7
action_41 (32) = happyShift action_8
action_41 (33) = happyShift action_9
action_41 (34) = happyShift action_10
action_41 (35) = happyShift action_11
action_41 (36) = happyShift action_12
action_41 (37) = happyShift action_13
action_41 (38) = happyShift action_14
action_41 (40) = happyShift action_15
action_41 (41) = happyShift action_16
action_41 (42) = happyShift action_17
action_41 (43) = happyShift action_18
action_41 (44) = happyShift action_19
action_41 (45) = happyShift action_20
action_41 (4) = happyGoto action_59
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (21) = happyShift action_4
action_42 (23) = happyShift action_2
action_42 (25) = happyShift action_5
action_42 (27) = happyShift action_6
action_42 (31) = happyShift action_7
action_42 (32) = happyShift action_8
action_42 (33) = happyShift action_9
action_42 (34) = happyShift action_10
action_42 (35) = happyShift action_11
action_42 (36) = happyShift action_12
action_42 (37) = happyShift action_13
action_42 (38) = happyShift action_14
action_42 (40) = happyShift action_15
action_42 (41) = happyShift action_16
action_42 (42) = happyShift action_17
action_42 (43) = happyShift action_18
action_42 (44) = happyShift action_19
action_42 (45) = happyShift action_20
action_42 (4) = happyGoto action_58
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (21) = happyShift action_4
action_43 (23) = happyShift action_2
action_43 (25) = happyShift action_5
action_43 (27) = happyShift action_6
action_43 (31) = happyShift action_7
action_43 (32) = happyShift action_8
action_43 (33) = happyShift action_9
action_43 (34) = happyShift action_10
action_43 (35) = happyShift action_11
action_43 (36) = happyShift action_12
action_43 (37) = happyShift action_13
action_43 (38) = happyShift action_14
action_43 (40) = happyShift action_15
action_43 (41) = happyShift action_16
action_43 (42) = happyShift action_17
action_43 (43) = happyShift action_18
action_43 (44) = happyShift action_19
action_43 (45) = happyShift action_20
action_43 (4) = happyGoto action_57
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (15) = happyShift action_56
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (15) = happyShift action_55
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (24) = happyShift action_53
action_46 (30) = happyShift action_54
action_46 _ = happyFail (happyExpListPerState 46)

action_47 _ = happyReduce_24

action_48 _ = happyReduce_22

action_49 (22) = happyShift action_52
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (21) = happyShift action_4
action_50 (23) = happyShift action_2
action_50 (25) = happyShift action_5
action_50 (27) = happyShift action_6
action_50 (31) = happyShift action_7
action_50 (32) = happyShift action_8
action_50 (33) = happyShift action_9
action_50 (34) = happyShift action_10
action_50 (35) = happyShift action_11
action_50 (36) = happyShift action_12
action_50 (37) = happyShift action_13
action_50 (38) = happyShift action_14
action_50 (40) = happyShift action_15
action_50 (41) = happyShift action_16
action_50 (42) = happyShift action_17
action_50 (43) = happyShift action_18
action_50 (44) = happyShift action_19
action_50 (45) = happyShift action_20
action_50 (4) = happyGoto action_51
action_50 _ = happyFail (happyExpListPerState 50)

action_51 _ = happyReduce_17

action_52 (12) = happyShift action_62
action_52 (13) = happyShift action_63
action_52 (14) = happyShift action_64
action_52 (19) = happyShift action_65
action_52 (25) = happyShift action_66
action_52 (31) = happyShift action_67
action_52 (11) = happyGoto action_80
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (31) = happyShift action_49
action_53 (7) = happyGoto action_79
action_53 _ = happyFail (happyExpListPerState 53)

action_54 _ = happyReduce_23

action_55 (21) = happyShift action_4
action_55 (23) = happyShift action_2
action_55 (25) = happyShift action_5
action_55 (27) = happyShift action_6
action_55 (31) = happyShift action_7
action_55 (32) = happyShift action_8
action_55 (33) = happyShift action_9
action_55 (34) = happyShift action_10
action_55 (35) = happyShift action_11
action_55 (36) = happyShift action_12
action_55 (37) = happyShift action_13
action_55 (38) = happyShift action_14
action_55 (40) = happyShift action_15
action_55 (41) = happyShift action_16
action_55 (42) = happyShift action_17
action_55 (43) = happyShift action_18
action_55 (44) = happyShift action_19
action_55 (45) = happyShift action_20
action_55 (4) = happyGoto action_78
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (21) = happyShift action_4
action_56 (23) = happyShift action_2
action_56 (25) = happyShift action_5
action_56 (27) = happyShift action_6
action_56 (31) = happyShift action_7
action_56 (32) = happyShift action_8
action_56 (33) = happyShift action_9
action_56 (34) = happyShift action_10
action_56 (35) = happyShift action_11
action_56 (36) = happyShift action_12
action_56 (37) = happyShift action_13
action_56 (38) = happyShift action_14
action_56 (40) = happyShift action_15
action_56 (41) = happyShift action_16
action_56 (42) = happyShift action_17
action_56 (43) = happyShift action_18
action_56 (44) = happyShift action_19
action_56 (45) = happyShift action_20
action_56 (4) = happyGoto action_77
action_56 _ = happyFail (happyExpListPerState 56)

action_57 _ = happyReduce_9

action_58 _ = happyReduce_8

action_59 (28) = happyShift action_76
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (26) = happyShift action_75
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (16) = happyShift action_72
action_61 (17) = happyShift action_73
action_61 (18) = happyShift action_74
action_61 _ = happyReduce_16

action_62 _ = happyReduce_40

action_63 _ = happyReduce_39

action_64 _ = happyReduce_38

action_65 (12) = happyShift action_62
action_65 (13) = happyShift action_63
action_65 (14) = happyShift action_64
action_65 (19) = happyShift action_65
action_65 (25) = happyShift action_66
action_65 (31) = happyShift action_67
action_65 (11) = happyGoto action_71
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (12) = happyShift action_62
action_66 (13) = happyShift action_63
action_66 (14) = happyShift action_64
action_66 (19) = happyShift action_65
action_66 (25) = happyShift action_66
action_66 (31) = happyShift action_67
action_66 (11) = happyGoto action_70
action_66 _ = happyFail (happyExpListPerState 66)

action_67 _ = happyReduce_37

action_68 (21) = happyShift action_4
action_68 (23) = happyShift action_2
action_68 (25) = happyShift action_5
action_68 (27) = happyShift action_6
action_68 (31) = happyShift action_7
action_68 (32) = happyShift action_8
action_68 (33) = happyShift action_9
action_68 (34) = happyShift action_10
action_68 (35) = happyShift action_11
action_68 (36) = happyShift action_12
action_68 (37) = happyShift action_13
action_68 (38) = happyShift action_14
action_68 (40) = happyShift action_15
action_68 (41) = happyShift action_16
action_68 (42) = happyShift action_17
action_68 (43) = happyShift action_18
action_68 (44) = happyShift action_19
action_68 (45) = happyShift action_20
action_68 (4) = happyGoto action_69
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (26) = happyShift action_87
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (16) = happyShift action_72
action_70 (17) = happyShift action_73
action_70 (18) = happyShift action_74
action_70 (26) = happyShift action_86
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (17) = happyShift action_73
action_71 (18) = happyShift action_74
action_71 _ = happyReduce_36

action_72 (12) = happyShift action_62
action_72 (13) = happyShift action_63
action_72 (14) = happyShift action_64
action_72 (19) = happyShift action_65
action_72 (25) = happyShift action_66
action_72 (31) = happyShift action_67
action_72 (11) = happyGoto action_85
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (12) = happyShift action_62
action_73 (13) = happyShift action_63
action_73 (14) = happyShift action_64
action_73 (19) = happyShift action_65
action_73 (25) = happyShift action_66
action_73 (31) = happyShift action_67
action_73 (11) = happyGoto action_84
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (12) = happyShift action_62
action_74 (13) = happyShift action_63
action_74 (14) = happyShift action_64
action_74 (19) = happyShift action_65
action_74 (25) = happyShift action_66
action_74 (31) = happyShift action_67
action_74 (11) = happyGoto action_83
action_74 _ = happyFail (happyExpListPerState 74)

action_75 _ = happyReduce_21

action_76 _ = happyReduce_12

action_77 (47) = happyShift action_82
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (47) = happyShift action_81
action_78 _ = happyFail (happyExpListPerState 78)

action_79 _ = happyReduce_25

action_80 (16) = happyShift action_72
action_80 (17) = happyShift action_73
action_80 (18) = happyShift action_74
action_80 _ = happyReduce_26

action_81 (21) = happyShift action_4
action_81 (23) = happyShift action_2
action_81 (25) = happyShift action_5
action_81 (27) = happyShift action_6
action_81 (31) = happyShift action_7
action_81 (32) = happyShift action_8
action_81 (33) = happyShift action_9
action_81 (34) = happyShift action_10
action_81 (35) = happyShift action_11
action_81 (36) = happyShift action_12
action_81 (37) = happyShift action_13
action_81 (38) = happyShift action_14
action_81 (40) = happyShift action_15
action_81 (41) = happyShift action_16
action_81 (42) = happyShift action_17
action_81 (43) = happyShift action_18
action_81 (44) = happyShift action_19
action_81 (45) = happyShift action_20
action_81 (4) = happyGoto action_89
action_81 _ = happyFail (happyExpListPerState 81)

action_82 (21) = happyShift action_4
action_82 (23) = happyShift action_2
action_82 (25) = happyShift action_5
action_82 (27) = happyShift action_6
action_82 (31) = happyShift action_7
action_82 (32) = happyShift action_8
action_82 (33) = happyShift action_9
action_82 (34) = happyShift action_10
action_82 (35) = happyShift action_11
action_82 (36) = happyShift action_12
action_82 (37) = happyShift action_13
action_82 (38) = happyShift action_14
action_82 (40) = happyShift action_15
action_82 (41) = happyShift action_16
action_82 (42) = happyShift action_17
action_82 (43) = happyShift action_18
action_82 (44) = happyShift action_19
action_82 (45) = happyShift action_20
action_82 (4) = happyGoto action_88
action_82 _ = happyFail (happyExpListPerState 82)

action_83 _ = happyReduce_34

action_84 _ = happyReduce_33

action_85 (16) = happyShift action_72
action_85 (17) = happyShift action_73
action_85 (18) = happyShift action_74
action_85 _ = happyReduce_32

action_86 _ = happyReduce_35

action_87 _ = happyReduce_1

action_88 _ = happyReduce_20

action_89 _ = happyReduce_19

happyReduce_1 = happyReduce 6 4 happyReduction_1
happyReduction_1 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (App happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_2 = happySpecReduce_1  4 happyReduction_2
happyReduction_2 (HappyTerminal (IntTok happy_var_1))
	 =  HappyAbsSyn4
		 (IntT happy_var_1
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_1  4 happyReduction_3
happyReduction_3 _
	 =  HappyAbsSyn4
		 (TrueT
	)

happyReduce_4 = happySpecReduce_1  4 happyReduction_4
happyReduction_4 _
	 =  HappyAbsSyn4
		 (FalseT
	)

happyReduce_5 = happySpecReduce_1  4 happyReduction_5
happyReduction_5 _
	 =  HappyAbsSyn4
		 (Unit
	)

happyReduce_6 = happySpecReduce_1  4 happyReduction_6
happyReduction_6 (HappyTerminal (IdTok happy_var_1))
	 =  HappyAbsSyn4
		 (Var happy_var_1
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_1  4 happyReduction_7
happyReduction_7 (HappyTerminal (ModIdTok happy_var_1))
	 =  HappyAbsSyn4
		 (ModVar happy_var_1 []
	)
happyReduction_7 _  = notHappyAtAll 

happyReduce_8 = happyReduce 4 4 happyReduction_8
happyReduction_8 ((HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (IdTok happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Lam happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_9 = happyReduce 4 4 happyReduction_9
happyReduction_9 ((HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (IdTok happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Lam happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_10 = happySpecReduce_2  4 happyReduction_10
happyReduction_10 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (Fst happy_var_2
	)
happyReduction_10 _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_2  4 happyReduction_11
happyReduction_11 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (Snd happy_var_2
	)
happyReduction_11 _ _  = notHappyAtAll 

happyReduce_12 = happyReduce 5 4 happyReduction_12
happyReduction_12 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Pair happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_13 = happySpecReduce_2  4 happyReduction_13
happyReduction_13 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (InL happy_var_2
	)
happyReduction_13 _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_2  4 happyReduction_14
happyReduction_14 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (InR happy_var_2
	)
happyReduction_14 _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  4 happyReduction_15
happyReduction_15 _
	(HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (happy_var_2
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happyReduce 4 4 happyReduction_16
happyReduction_16 ((HappyAbsSyn11  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Ann happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_17 = happyReduce 4 4 happyReduction_17
happyReduction_17 ((HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Box happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_18 = happySpecReduce_2  4 happyReduction_18
happyReduction_18 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (Box [] happy_var_2
	)
happyReduction_18 _ _  = notHappyAtAll 

happyReduce_19 = happyReduce 7 4 happyReduction_19
happyReduction_19 ((HappyAbsSyn4  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ModIdTok happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (LetBox happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_20 = happyReduce 7 4 happyReduction_20
happyReduction_20 ((HappyAbsSyn4  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (IdTok happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (LetVal happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_21 = happyReduce 5 4 happyReduction_21
happyReduction_21 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (BinOp Add happy_var_3 happy_var_4
	) `HappyStk` happyRest

happyReduce_22 = happySpecReduce_2  5 happyReduction_22
happyReduction_22 _
	_
	 =  HappyAbsSyn5
		 ([]
	)

happyReduce_23 = happySpecReduce_3  5 happyReduction_23
happyReduction_23 _
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (happy_var_2
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_1  6 happyReduction_24
happyReduction_24 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 ([happy_var_1]
	)
happyReduction_24 _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  6 happyReduction_25
happyReduction_25 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1 ++ [happy_var_3]
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  7 happyReduction_26
happyReduction_26 (HappyAbsSyn11  happy_var_3)
	_
	(HappyTerminal (IdTok happy_var_1))
	 =  HappyAbsSyn7
		 ((happy_var_1, happy_var_3)
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_2  8 happyReduction_27
happyReduction_27 _
	_
	 =  HappyAbsSyn8
		 ([]
	)

happyReduce_28 = happySpecReduce_3  8 happyReduction_28
happyReduction_28 _
	(HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (happy_var_2
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_1  9 happyReduction_29
happyReduction_29 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 ([happy_var_1]
	)
happyReduction_29 _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  9 happyReduction_30
happyReduction_30 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1 ++ [happy_var_3]
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  10 happyReduction_31
happyReduction_31 (HappyAbsSyn4  happy_var_3)
	_
	(HappyTerminal (IdTok happy_var_1))
	 =  HappyAbsSyn10
		 ((happy_var_1, happy_var_3)
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  11 happyReduction_32
happyReduction_32 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (Arrow happy_var_1 happy_var_3
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_3  11 happyReduction_33
happyReduction_33 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (Prod happy_var_1 happy_var_3
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  11 happyReduction_34
happyReduction_34 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (Sum happy_var_1 happy_var_3
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_3  11 happyReduction_35
happyReduction_35 _
	(HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (happy_var_2
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_2  11 happyReduction_36
happyReduction_36 (HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (BoxTy [] happy_var_2
	)
happyReduction_36 _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_1  11 happyReduction_37
happyReduction_37 (HappyTerminal (IdTok happy_var_1))
	 =  HappyAbsSyn11
		 (BaseTy happy_var_1
	)
happyReduction_37 _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_1  11 happyReduction_38
happyReduction_38 _
	 =  HappyAbsSyn11
		 (BoolTy
	)

happyReduce_39 = happySpecReduce_1  11 happyReduction_39
happyReduction_39 _
	 =  HappyAbsSyn11
		 (IntTy
	)

happyReduce_40 = happySpecReduce_1  11 happyReduction_40
happyReduction_40 _
	 =  HappyAbsSyn11
		 (UnitTy
	)

happyNewToken action sts stk [] =
	action 48 48 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	UnitTyTok -> cont 12;
	IntTyTok -> cont 13;
	BoolTyTok -> cont 14;
	EqualTok -> cont 15;
	ArrowTok -> cont 16;
	ProdTyTok -> cont 17;
	SumTok -> cont 18;
	EmptyCtxTok -> cont 19;
	EmptyCtxTok -> cont 20;
	AnnTok -> cont 21;
	AnnSepTok -> cont 22;
	AppTok -> cont 23;
	CommaTok -> cont 24;
	LParen -> cont 25;
	RParen -> cont 26;
	LAngleTok -> cont 27;
	RAngleTok -> cont 28;
	LBrackTok -> cont 29;
	RBrackTok -> cont 30;
	IdTok happy_dollar_dollar -> cont 31;
	ModIdTok happy_dollar_dollar -> cont 32;
	IntTok happy_dollar_dollar -> cont 33;
	TrueTok -> cont 34;
	FalseTok -> cont 35;
	UnitTermTok -> cont 36;
	LambdaTok -> cont 37;
	LambdaTok -> cont 38;
	LambdaBodyTok -> cont 39;
	FstTok -> cont 40;
	SndTok -> cont 41;
	InlTok -> cont 42;
	InrTok -> cont 43;
	LetTok -> cont 44;
	BoxTok -> cont 45;
	ValTok -> cont 46;
	InTok -> cont 47;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 48 tk tks = happyError' (tks, explist)
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
    | ModIdTok String
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
    | AnnSepTok
    | CommaTok
    | AppTok
    | LAngleTok
    | RAngleTok
    | LBrackTok
    | RBrackTok
    | EmptyCtxTok
    | LetTok 
    | BoxTok 
    | ValTok 
    | InTok
    | EqualTok
    deriving Show

lexer :: String -> [Token]
lexer [] = []
lexer cs
    | Just ("→", rest) <- unconsPrefix "→" cs = ArrowTok : lexer rest
    | Just ("×", rest) <- unconsPrefix "×" cs = ProdTyTok : lexer rest
    | Just ("+", rest) <- unconsPrefix "+" cs = SumTok : lexer rest
    | Just ("->", rest) <- unconsPrefix "->" cs = ArrowTok : lexer rest
    | Just (":", rest) <- unconsPrefix ":" cs = AnnSepTok : lexer rest
    | Just ("()", rest) <- unconsPrefix "()" cs = UnitTermTok : lexer rest
    | Just ("λ", rest) <- unconsPrefix "λ" cs = LambdaTok : lexer rest
    | Just ("\\", rest) <- unconsPrefix "\\\\" cs = LambdaTok : lexer rest
    | Just (".", rest) <- unconsPrefix "." cs = LambdaBodyTok : lexer rest
    | Just ("fst", rest) <- unconsPrefix "fst" cs = FstTok : lexer rest
    | Just ("snd", rest) <- unconsPrefix "snd" cs = SndTok : lexer rest
    | Just ("☐", rest) <- unconsPrefix "☐" cs = EmptyCtxTok : lexer rest
    | Just ("(", rest) <- unconsPrefix "(" cs = LParen : lexer rest
    | Just (")", rest) <- unconsPrefix ")" cs = RParen : lexer rest
    | Just ("⟨", rest) <- unconsPrefix "⟨" cs = LAngleTok : lexer rest
    | Just ("⟩", rest) <- unconsPrefix "⟩" cs = RAngleTok : lexer rest
    | Just ("[", rest) <- unconsPrefix "[" cs = LBrackTok : lexer rest
    | Just ("]", rest) <- unconsPrefix "]" cs = RBrackTok : lexer rest
    | Just ("inl", rest) <- unconsPrefix "inl" cs = InlTok : lexer rest
    | Just ("inr", rest) <- unconsPrefix "inr" cs = InrTok : lexer rest
    | Just ("app", rest) <- unconsPrefix "app" cs = AppTok : lexer rest
    | Just ("@", rest) <- unconsPrefix "@" cs = AnnTok : lexer rest
    | Just (",", rest) <- unconsPrefix "," cs = CommaTok : lexer rest
    | Just ("let", rest) <- unconsPrefix "let" cs = LetTok : lexer rest
    | Just ("box", rest) <- unconsPrefix "box" cs = BoxTok : lexer rest
    | Just ("val", rest) <- unconsPrefix "val" cs = ValTok : lexer rest
    | Just ("=", rest) <- unconsPrefix "=" cs = EqualTok : lexer rest
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
    ("in", rest)  -> InTok : lexer rest
    ("u",rest)  -> ModIdTok "u" : lexer rest
    ("w",rest)  -> ModIdTok "w" : lexer rest
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
