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
happyExpList = Happy_Data_Array.listArray (0,190) ([0,58024,4063,0,16,0,0,32,0,0,0,0,32768,65066,253,20480,65301,126,40960,32650,63,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,32768,0,0,50512,8127,0,58024,4063,0,61780,2031,0,63658,1015,0,0,768,32768,65194,253,0,0,0,0,32768,0,0,96,0,0,64,0,0,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,128,0,0,64,0,0,0,0,4608,0,0,16,0,0,32,0,32768,65066,253,32768,0,0,40960,32650,63,32768,0,0,33848,40,0,21504,61425,7,0,0,0,21760,64508,1,17408,0,0,0,0,0,0,0,0,1,0,0,58024,4063,0,61780,2031,4096,0,0,2048,0,0,0,260,0,0,0,0,0,0,0,8192,0,0,43008,57314,15,0,0,0,8462,10,0,0,4,0,0,0,0,5440,32511,0,35488,16255,0,0,0,0,0,0,0,61780,2031,0,2048,0,0,0,0,0,64,0,0,8,0,4320,162,0,1792,0,0,0,0,0,0,0,0,0,0,0,4231,5,32768,34883,2,0,0,0,0,35488,16255,0,512,0,32768,259,0,32768,1,0,3584,2593,0,34560,1296,0,17280,648,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,0,0,4,0,0,0,28,0,0,35488,16255,0,50512,8127,0,0,0,0,0,0,57344,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parse","Term","Context","CtxElems","CtxElem","Subs","SubElems","SubElem","Type","unit","int","bool","\"=\"","\"\8594\"","\"\215\"","\"+\"","\"\9744\"","\"@\"","\":\"","app","\",\"","\"(\"","\")\"","\"\10216\"","\"\10217\"","\"[\"","\"]\"","id","modId","intT","true","false","unitTerm","\"\\\\\"","\"\955\"","\".\"","fst","snd","inl","inr","let","box","val","in","%eof"]
        bit_start = st * 47
        bit_end = (st + 1) * 47
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..46]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (20) = happyShift action_4
action_0 (22) = happyShift action_2
action_0 (24) = happyShift action_5
action_0 (26) = happyShift action_6
action_0 (30) = happyShift action_7
action_0 (31) = happyShift action_8
action_0 (32) = happyShift action_9
action_0 (33) = happyShift action_10
action_0 (34) = happyShift action_11
action_0 (35) = happyShift action_12
action_0 (36) = happyShift action_13
action_0 (37) = happyShift action_14
action_0 (39) = happyShift action_15
action_0 (40) = happyShift action_16
action_0 (41) = happyShift action_17
action_0 (42) = happyShift action_18
action_0 (43) = happyShift action_19
action_0 (44) = happyShift action_20
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (22) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (24) = happyShift action_38
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (47) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (20) = happyShift action_4
action_4 (22) = happyShift action_2
action_4 (24) = happyShift action_5
action_4 (26) = happyShift action_6
action_4 (30) = happyShift action_7
action_4 (31) = happyShift action_8
action_4 (32) = happyShift action_9
action_4 (33) = happyShift action_10
action_4 (34) = happyShift action_11
action_4 (35) = happyShift action_12
action_4 (36) = happyShift action_13
action_4 (37) = happyShift action_14
action_4 (39) = happyShift action_15
action_4 (40) = happyShift action_16
action_4 (41) = happyShift action_17
action_4 (42) = happyShift action_18
action_4 (43) = happyShift action_19
action_4 (44) = happyShift action_20
action_4 (4) = happyGoto action_37
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (18) = happyShift action_36
action_5 (20) = happyShift action_4
action_5 (22) = happyShift action_2
action_5 (24) = happyShift action_5
action_5 (26) = happyShift action_6
action_5 (30) = happyShift action_7
action_5 (31) = happyShift action_8
action_5 (32) = happyShift action_9
action_5 (33) = happyShift action_10
action_5 (34) = happyShift action_11
action_5 (35) = happyShift action_12
action_5 (36) = happyShift action_13
action_5 (37) = happyShift action_14
action_5 (39) = happyShift action_15
action_5 (40) = happyShift action_16
action_5 (41) = happyShift action_17
action_5 (42) = happyShift action_18
action_5 (43) = happyShift action_19
action_5 (44) = happyShift action_20
action_5 (4) = happyGoto action_35
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (20) = happyShift action_4
action_6 (22) = happyShift action_2
action_6 (24) = happyShift action_5
action_6 (26) = happyShift action_6
action_6 (30) = happyShift action_7
action_6 (31) = happyShift action_8
action_6 (32) = happyShift action_9
action_6 (33) = happyShift action_10
action_6 (34) = happyShift action_11
action_6 (35) = happyShift action_12
action_6 (36) = happyShift action_13
action_6 (37) = happyShift action_14
action_6 (39) = happyShift action_15
action_6 (40) = happyShift action_16
action_6 (41) = happyShift action_17
action_6 (42) = happyShift action_18
action_6 (43) = happyShift action_19
action_6 (44) = happyShift action_20
action_6 (4) = happyGoto action_34
action_6 _ = happyFail (happyExpListPerState 6)

action_7 _ = happyReduce_6

action_8 (26) = happyShift action_33
action_8 (8) = happyGoto action_32
action_8 _ = happyReduce_7

action_9 _ = happyReduce_2

action_10 _ = happyReduce_3

action_11 _ = happyReduce_4

action_12 _ = happyReduce_5

action_13 (30) = happyShift action_31
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (30) = happyShift action_30
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (20) = happyShift action_4
action_15 (22) = happyShift action_2
action_15 (24) = happyShift action_5
action_15 (26) = happyShift action_6
action_15 (30) = happyShift action_7
action_15 (31) = happyShift action_8
action_15 (32) = happyShift action_9
action_15 (33) = happyShift action_10
action_15 (34) = happyShift action_11
action_15 (35) = happyShift action_12
action_15 (36) = happyShift action_13
action_15 (37) = happyShift action_14
action_15 (39) = happyShift action_15
action_15 (40) = happyShift action_16
action_15 (41) = happyShift action_17
action_15 (42) = happyShift action_18
action_15 (43) = happyShift action_19
action_15 (44) = happyShift action_20
action_15 (4) = happyGoto action_29
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (20) = happyShift action_4
action_16 (22) = happyShift action_2
action_16 (24) = happyShift action_5
action_16 (26) = happyShift action_6
action_16 (30) = happyShift action_7
action_16 (31) = happyShift action_8
action_16 (32) = happyShift action_9
action_16 (33) = happyShift action_10
action_16 (34) = happyShift action_11
action_16 (35) = happyShift action_12
action_16 (36) = happyShift action_13
action_16 (37) = happyShift action_14
action_16 (39) = happyShift action_15
action_16 (40) = happyShift action_16
action_16 (41) = happyShift action_17
action_16 (42) = happyShift action_18
action_16 (43) = happyShift action_19
action_16 (44) = happyShift action_20
action_16 (4) = happyGoto action_28
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (20) = happyShift action_4
action_17 (22) = happyShift action_2
action_17 (24) = happyShift action_5
action_17 (26) = happyShift action_6
action_17 (30) = happyShift action_7
action_17 (31) = happyShift action_8
action_17 (32) = happyShift action_9
action_17 (33) = happyShift action_10
action_17 (34) = happyShift action_11
action_17 (35) = happyShift action_12
action_17 (36) = happyShift action_13
action_17 (37) = happyShift action_14
action_17 (39) = happyShift action_15
action_17 (40) = happyShift action_16
action_17 (41) = happyShift action_17
action_17 (42) = happyShift action_18
action_17 (43) = happyShift action_19
action_17 (44) = happyShift action_20
action_17 (4) = happyGoto action_27
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (20) = happyShift action_4
action_18 (22) = happyShift action_2
action_18 (24) = happyShift action_5
action_18 (26) = happyShift action_6
action_18 (30) = happyShift action_7
action_18 (31) = happyShift action_8
action_18 (32) = happyShift action_9
action_18 (33) = happyShift action_10
action_18 (34) = happyShift action_11
action_18 (35) = happyShift action_12
action_18 (36) = happyShift action_13
action_18 (37) = happyShift action_14
action_18 (39) = happyShift action_15
action_18 (40) = happyShift action_16
action_18 (41) = happyShift action_17
action_18 (42) = happyShift action_18
action_18 (43) = happyShift action_19
action_18 (44) = happyShift action_20
action_18 (4) = happyGoto action_26
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (44) = happyShift action_24
action_19 (45) = happyShift action_25
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (20) = happyShift action_4
action_20 (22) = happyShift action_2
action_20 (24) = happyShift action_5
action_20 (26) = happyShift action_6
action_20 (28) = happyShift action_23
action_20 (30) = happyShift action_7
action_20 (31) = happyShift action_8
action_20 (32) = happyShift action_9
action_20 (33) = happyShift action_10
action_20 (34) = happyShift action_11
action_20 (35) = happyShift action_12
action_20 (36) = happyShift action_13
action_20 (37) = happyShift action_14
action_20 (39) = happyShift action_15
action_20 (40) = happyShift action_16
action_20 (41) = happyShift action_17
action_20 (42) = happyShift action_18
action_20 (43) = happyShift action_19
action_20 (44) = happyShift action_20
action_20 (4) = happyGoto action_21
action_20 (5) = happyGoto action_22
action_20 _ = happyFail (happyExpListPerState 20)

action_21 _ = happyReduce_19

action_22 (38) = happyShift action_56
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (29) = happyShift action_54
action_23 (30) = happyShift action_55
action_23 (6) = happyGoto action_52
action_23 (7) = happyGoto action_53
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (31) = happyShift action_51
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (30) = happyShift action_50
action_25 _ = happyFail (happyExpListPerState 25)

action_26 _ = happyReduce_15

action_27 _ = happyReduce_14

action_28 _ = happyReduce_12

action_29 _ = happyReduce_11

action_30 (38) = happyShift action_49
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (38) = happyShift action_48
action_31 _ = happyFail (happyExpListPerState 31)

action_32 _ = happyReduce_8

action_33 (27) = happyShift action_46
action_33 (30) = happyShift action_47
action_33 (9) = happyGoto action_44
action_33 (10) = happyGoto action_45
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (23) = happyShift action_43
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (25) = happyShift action_42
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (20) = happyShift action_4
action_36 (22) = happyShift action_2
action_36 (24) = happyShift action_5
action_36 (26) = happyShift action_6
action_36 (30) = happyShift action_7
action_36 (31) = happyShift action_8
action_36 (32) = happyShift action_9
action_36 (33) = happyShift action_10
action_36 (34) = happyShift action_11
action_36 (35) = happyShift action_12
action_36 (36) = happyShift action_13
action_36 (37) = happyShift action_14
action_36 (39) = happyShift action_15
action_36 (40) = happyShift action_16
action_36 (41) = happyShift action_17
action_36 (42) = happyShift action_18
action_36 (43) = happyShift action_19
action_36 (44) = happyShift action_20
action_36 (4) = happyGoto action_41
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (21) = happyShift action_40
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (20) = happyShift action_4
action_38 (22) = happyShift action_2
action_38 (24) = happyShift action_5
action_38 (26) = happyShift action_6
action_38 (30) = happyShift action_7
action_38 (31) = happyShift action_8
action_38 (32) = happyShift action_9
action_38 (33) = happyShift action_10
action_38 (34) = happyShift action_11
action_38 (35) = happyShift action_12
action_38 (36) = happyShift action_13
action_38 (37) = happyShift action_14
action_38 (39) = happyShift action_15
action_38 (40) = happyShift action_16
action_38 (41) = happyShift action_17
action_38 (42) = happyShift action_18
action_38 (43) = happyShift action_19
action_38 (44) = happyShift action_20
action_38 (4) = happyGoto action_39
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (23) = happyShift action_78
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (12) = happyShift action_72
action_40 (13) = happyShift action_73
action_40 (14) = happyShift action_74
action_40 (19) = happyShift action_75
action_40 (24) = happyShift action_76
action_40 (28) = happyShift action_23
action_40 (30) = happyShift action_77
action_40 (5) = happyGoto action_70
action_40 (11) = happyGoto action_71
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (20) = happyShift action_4
action_41 (22) = happyShift action_2
action_41 (24) = happyShift action_5
action_41 (26) = happyShift action_6
action_41 (30) = happyShift action_7
action_41 (31) = happyShift action_8
action_41 (32) = happyShift action_9
action_41 (33) = happyShift action_10
action_41 (34) = happyShift action_11
action_41 (35) = happyShift action_12
action_41 (36) = happyShift action_13
action_41 (37) = happyShift action_14
action_41 (39) = happyShift action_15
action_41 (40) = happyShift action_16
action_41 (41) = happyShift action_17
action_41 (42) = happyShift action_18
action_41 (43) = happyShift action_19
action_41 (44) = happyShift action_20
action_41 (4) = happyGoto action_69
action_41 _ = happyFail (happyExpListPerState 41)

action_42 _ = happyReduce_16

action_43 (20) = happyShift action_4
action_43 (22) = happyShift action_2
action_43 (24) = happyShift action_5
action_43 (26) = happyShift action_6
action_43 (30) = happyShift action_7
action_43 (31) = happyShift action_8
action_43 (32) = happyShift action_9
action_43 (33) = happyShift action_10
action_43 (34) = happyShift action_11
action_43 (35) = happyShift action_12
action_43 (36) = happyShift action_13
action_43 (37) = happyShift action_14
action_43 (39) = happyShift action_15
action_43 (40) = happyShift action_16
action_43 (41) = happyShift action_17
action_43 (42) = happyShift action_18
action_43 (43) = happyShift action_19
action_43 (44) = happyShift action_20
action_43 (4) = happyGoto action_68
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (23) = happyShift action_66
action_44 (27) = happyShift action_67
action_44 _ = happyFail (happyExpListPerState 44)

action_45 _ = happyReduce_31

action_46 _ = happyReduce_29

action_47 (16) = happyShift action_65
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (20) = happyShift action_4
action_48 (22) = happyShift action_2
action_48 (24) = happyShift action_5
action_48 (26) = happyShift action_6
action_48 (30) = happyShift action_7
action_48 (31) = happyShift action_8
action_48 (32) = happyShift action_9
action_48 (33) = happyShift action_10
action_48 (34) = happyShift action_11
action_48 (35) = happyShift action_12
action_48 (36) = happyShift action_13
action_48 (37) = happyShift action_14
action_48 (39) = happyShift action_15
action_48 (40) = happyShift action_16
action_48 (41) = happyShift action_17
action_48 (42) = happyShift action_18
action_48 (43) = happyShift action_19
action_48 (44) = happyShift action_20
action_48 (4) = happyGoto action_64
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (20) = happyShift action_4
action_49 (22) = happyShift action_2
action_49 (24) = happyShift action_5
action_49 (26) = happyShift action_6
action_49 (30) = happyShift action_7
action_49 (31) = happyShift action_8
action_49 (32) = happyShift action_9
action_49 (33) = happyShift action_10
action_49 (34) = happyShift action_11
action_49 (35) = happyShift action_12
action_49 (36) = happyShift action_13
action_49 (37) = happyShift action_14
action_49 (39) = happyShift action_15
action_49 (40) = happyShift action_16
action_49 (41) = happyShift action_17
action_49 (42) = happyShift action_18
action_49 (43) = happyShift action_19
action_49 (44) = happyShift action_20
action_49 (4) = happyGoto action_63
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (15) = happyShift action_62
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (15) = happyShift action_61
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (23) = happyShift action_59
action_52 (29) = happyShift action_60
action_52 _ = happyFail (happyExpListPerState 52)

action_53 _ = happyReduce_25

action_54 _ = happyReduce_23

action_55 (21) = happyShift action_58
action_55 _ = happyReduce_27

action_56 (20) = happyShift action_4
action_56 (22) = happyShift action_2
action_56 (24) = happyShift action_5
action_56 (26) = happyShift action_6
action_56 (30) = happyShift action_7
action_56 (31) = happyShift action_8
action_56 (32) = happyShift action_9
action_56 (33) = happyShift action_10
action_56 (34) = happyShift action_11
action_56 (35) = happyShift action_12
action_56 (36) = happyShift action_13
action_56 (37) = happyShift action_14
action_56 (39) = happyShift action_15
action_56 (40) = happyShift action_16
action_56 (41) = happyShift action_17
action_56 (42) = happyShift action_18
action_56 (43) = happyShift action_19
action_56 (44) = happyShift action_20
action_56 (4) = happyGoto action_57
action_56 _ = happyFail (happyExpListPerState 56)

action_57 _ = happyReduce_18

action_58 (12) = happyShift action_72
action_58 (13) = happyShift action_73
action_58 (14) = happyShift action_74
action_58 (19) = happyShift action_75
action_58 (24) = happyShift action_76
action_58 (28) = happyShift action_23
action_58 (30) = happyShift action_77
action_58 (5) = happyGoto action_70
action_58 (11) = happyGoto action_93
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (30) = happyShift action_55
action_59 (7) = happyGoto action_92
action_59 _ = happyFail (happyExpListPerState 59)

action_60 _ = happyReduce_24

action_61 (20) = happyShift action_4
action_61 (22) = happyShift action_2
action_61 (24) = happyShift action_5
action_61 (26) = happyShift action_6
action_61 (30) = happyShift action_7
action_61 (31) = happyShift action_8
action_61 (32) = happyShift action_9
action_61 (33) = happyShift action_10
action_61 (34) = happyShift action_11
action_61 (35) = happyShift action_12
action_61 (36) = happyShift action_13
action_61 (37) = happyShift action_14
action_61 (39) = happyShift action_15
action_61 (40) = happyShift action_16
action_61 (41) = happyShift action_17
action_61 (42) = happyShift action_18
action_61 (43) = happyShift action_19
action_61 (44) = happyShift action_20
action_61 (4) = happyGoto action_91
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (20) = happyShift action_4
action_62 (22) = happyShift action_2
action_62 (24) = happyShift action_5
action_62 (26) = happyShift action_6
action_62 (30) = happyShift action_7
action_62 (31) = happyShift action_8
action_62 (32) = happyShift action_9
action_62 (33) = happyShift action_10
action_62 (34) = happyShift action_11
action_62 (35) = happyShift action_12
action_62 (36) = happyShift action_13
action_62 (37) = happyShift action_14
action_62 (39) = happyShift action_15
action_62 (40) = happyShift action_16
action_62 (41) = happyShift action_17
action_62 (42) = happyShift action_18
action_62 (43) = happyShift action_19
action_62 (44) = happyShift action_20
action_62 (4) = happyGoto action_90
action_62 _ = happyFail (happyExpListPerState 62)

action_63 _ = happyReduce_10

action_64 _ = happyReduce_9

action_65 (20) = happyShift action_4
action_65 (22) = happyShift action_2
action_65 (24) = happyShift action_5
action_65 (26) = happyShift action_6
action_65 (30) = happyShift action_7
action_65 (31) = happyShift action_8
action_65 (32) = happyShift action_9
action_65 (33) = happyShift action_10
action_65 (34) = happyShift action_11
action_65 (35) = happyShift action_12
action_65 (36) = happyShift action_13
action_65 (37) = happyShift action_14
action_65 (39) = happyShift action_15
action_65 (40) = happyShift action_16
action_65 (41) = happyShift action_17
action_65 (42) = happyShift action_18
action_65 (43) = happyShift action_19
action_65 (44) = happyShift action_20
action_65 (4) = happyGoto action_89
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (30) = happyShift action_47
action_66 (10) = happyGoto action_88
action_66 _ = happyFail (happyExpListPerState 66)

action_67 _ = happyReduce_30

action_68 (27) = happyShift action_87
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (25) = happyShift action_86
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (12) = happyShift action_72
action_70 (13) = happyShift action_73
action_70 (14) = happyShift action_74
action_70 (19) = happyShift action_75
action_70 (24) = happyShift action_76
action_70 (28) = happyShift action_23
action_70 (30) = happyShift action_77
action_70 (5) = happyGoto action_70
action_70 (11) = happyGoto action_85
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (16) = happyShift action_82
action_71 (17) = happyShift action_83
action_71 (18) = happyShift action_84
action_71 _ = happyReduce_17

action_72 _ = happyReduce_43

action_73 _ = happyReduce_42

action_74 _ = happyReduce_41

action_75 (12) = happyShift action_72
action_75 (13) = happyShift action_73
action_75 (14) = happyShift action_74
action_75 (19) = happyShift action_75
action_75 (24) = happyShift action_76
action_75 (28) = happyShift action_23
action_75 (30) = happyShift action_77
action_75 (5) = happyGoto action_70
action_75 (11) = happyGoto action_81
action_75 _ = happyFail (happyExpListPerState 75)

action_76 (12) = happyShift action_72
action_76 (13) = happyShift action_73
action_76 (14) = happyShift action_74
action_76 (19) = happyShift action_75
action_76 (24) = happyShift action_76
action_76 (28) = happyShift action_23
action_76 (30) = happyShift action_77
action_76 (5) = happyGoto action_70
action_76 (11) = happyGoto action_80
action_76 _ = happyFail (happyExpListPerState 76)

action_77 _ = happyReduce_40

action_78 (20) = happyShift action_4
action_78 (22) = happyShift action_2
action_78 (24) = happyShift action_5
action_78 (26) = happyShift action_6
action_78 (30) = happyShift action_7
action_78 (31) = happyShift action_8
action_78 (32) = happyShift action_9
action_78 (33) = happyShift action_10
action_78 (34) = happyShift action_11
action_78 (35) = happyShift action_12
action_78 (36) = happyShift action_13
action_78 (37) = happyShift action_14
action_78 (39) = happyShift action_15
action_78 (40) = happyShift action_16
action_78 (41) = happyShift action_17
action_78 (42) = happyShift action_18
action_78 (43) = happyShift action_19
action_78 (44) = happyShift action_20
action_78 (4) = happyGoto action_79
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (25) = happyShift action_100
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (16) = happyShift action_82
action_80 (17) = happyShift action_83
action_80 (18) = happyShift action_84
action_80 (25) = happyShift action_99
action_80 _ = happyFail (happyExpListPerState 80)

action_81 (17) = happyShift action_83
action_81 (18) = happyShift action_84
action_81 _ = happyReduce_38

action_82 (12) = happyShift action_72
action_82 (13) = happyShift action_73
action_82 (14) = happyShift action_74
action_82 (19) = happyShift action_75
action_82 (24) = happyShift action_76
action_82 (28) = happyShift action_23
action_82 (30) = happyShift action_77
action_82 (5) = happyGoto action_70
action_82 (11) = happyGoto action_98
action_82 _ = happyFail (happyExpListPerState 82)

action_83 (12) = happyShift action_72
action_83 (13) = happyShift action_73
action_83 (14) = happyShift action_74
action_83 (19) = happyShift action_75
action_83 (24) = happyShift action_76
action_83 (28) = happyShift action_23
action_83 (30) = happyShift action_77
action_83 (5) = happyGoto action_70
action_83 (11) = happyGoto action_97
action_83 _ = happyFail (happyExpListPerState 83)

action_84 (12) = happyShift action_72
action_84 (13) = happyShift action_73
action_84 (14) = happyShift action_74
action_84 (19) = happyShift action_75
action_84 (24) = happyShift action_76
action_84 (28) = happyShift action_23
action_84 (30) = happyShift action_77
action_84 (5) = happyGoto action_70
action_84 (11) = happyGoto action_96
action_84 _ = happyFail (happyExpListPerState 84)

action_85 (16) = happyShift action_82
action_85 (17) = happyShift action_83
action_85 (18) = happyShift action_84
action_85 _ = happyReduce_39

action_86 _ = happyReduce_22

action_87 _ = happyReduce_13

action_88 _ = happyReduce_32

action_89 _ = happyReduce_33

action_90 (46) = happyShift action_95
action_90 _ = happyFail (happyExpListPerState 90)

action_91 (46) = happyShift action_94
action_91 _ = happyFail (happyExpListPerState 91)

action_92 _ = happyReduce_26

action_93 (16) = happyShift action_82
action_93 (17) = happyShift action_83
action_93 (18) = happyShift action_84
action_93 _ = happyReduce_28

action_94 (20) = happyShift action_4
action_94 (22) = happyShift action_2
action_94 (24) = happyShift action_5
action_94 (26) = happyShift action_6
action_94 (30) = happyShift action_7
action_94 (31) = happyShift action_8
action_94 (32) = happyShift action_9
action_94 (33) = happyShift action_10
action_94 (34) = happyShift action_11
action_94 (35) = happyShift action_12
action_94 (36) = happyShift action_13
action_94 (37) = happyShift action_14
action_94 (39) = happyShift action_15
action_94 (40) = happyShift action_16
action_94 (41) = happyShift action_17
action_94 (42) = happyShift action_18
action_94 (43) = happyShift action_19
action_94 (44) = happyShift action_20
action_94 (4) = happyGoto action_102
action_94 _ = happyFail (happyExpListPerState 94)

action_95 (20) = happyShift action_4
action_95 (22) = happyShift action_2
action_95 (24) = happyShift action_5
action_95 (26) = happyShift action_6
action_95 (30) = happyShift action_7
action_95 (31) = happyShift action_8
action_95 (32) = happyShift action_9
action_95 (33) = happyShift action_10
action_95 (34) = happyShift action_11
action_95 (35) = happyShift action_12
action_95 (36) = happyShift action_13
action_95 (37) = happyShift action_14
action_95 (39) = happyShift action_15
action_95 (40) = happyShift action_16
action_95 (41) = happyShift action_17
action_95 (42) = happyShift action_18
action_95 (43) = happyShift action_19
action_95 (44) = happyShift action_20
action_95 (4) = happyGoto action_101
action_95 _ = happyFail (happyExpListPerState 95)

action_96 _ = happyReduce_36

action_97 _ = happyReduce_35

action_98 (16) = happyShift action_82
action_98 (17) = happyShift action_83
action_98 (18) = happyShift action_84
action_98 _ = happyReduce_34

action_99 _ = happyReduce_37

action_100 _ = happyReduce_1

action_101 _ = happyReduce_21

action_102 _ = happyReduce_20

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

happyReduce_8 = happySpecReduce_2  4 happyReduction_8
happyReduction_8 (HappyAbsSyn8  happy_var_2)
	(HappyTerminal (ModIdTok happy_var_1))
	 =  HappyAbsSyn4
		 (ModVar happy_var_1 happy_var_2
	)
happyReduction_8 _ _  = notHappyAtAll 

happyReduce_9 = happyReduce 4 4 happyReduction_9
happyReduction_9 ((HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (IdTok happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Lam happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_10 = happyReduce 4 4 happyReduction_10
happyReduction_10 ((HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (IdTok happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Lam happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_11 = happySpecReduce_2  4 happyReduction_11
happyReduction_11 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (Fst happy_var_2
	)
happyReduction_11 _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_2  4 happyReduction_12
happyReduction_12 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (Snd happy_var_2
	)
happyReduction_12 _ _  = notHappyAtAll 

happyReduce_13 = happyReduce 5 4 happyReduction_13
happyReduction_13 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Pair happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_14 = happySpecReduce_2  4 happyReduction_14
happyReduction_14 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (InL happy_var_2
	)
happyReduction_14 _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_2  4 happyReduction_15
happyReduction_15 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (InR happy_var_2
	)
happyReduction_15 _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  4 happyReduction_16
happyReduction_16 _
	(HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (happy_var_2
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happyReduce 4 4 happyReduction_17
happyReduction_17 ((HappyAbsSyn11  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Ann happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_18 = happyReduce 4 4 happyReduction_18
happyReduction_18 ((HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Box happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_19 = happySpecReduce_2  4 happyReduction_19
happyReduction_19 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (Box [] happy_var_2
	)
happyReduction_19 _ _  = notHappyAtAll 

happyReduce_20 = happyReduce 7 4 happyReduction_20
happyReduction_20 ((HappyAbsSyn4  happy_var_7) `HappyStk`
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

happyReduce_21 = happyReduce 7 4 happyReduction_21
happyReduction_21 ((HappyAbsSyn4  happy_var_7) `HappyStk`
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

happyReduce_22 = happyReduce 5 4 happyReduction_22
happyReduction_22 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (BinOp Add happy_var_3 happy_var_4
	) `HappyStk` happyRest

happyReduce_23 = happySpecReduce_2  5 happyReduction_23
happyReduction_23 _
	_
	 =  HappyAbsSyn5
		 ([]
	)

happyReduce_24 = happySpecReduce_3  5 happyReduction_24
happyReduction_24 _
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (happy_var_2
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_1  6 happyReduction_25
happyReduction_25 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 ([happy_var_1]
	)
happyReduction_25 _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  6 happyReduction_26
happyReduction_26 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1 ++ [happy_var_3]
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_1  7 happyReduction_27
happyReduction_27 (HappyTerminal (IdTok happy_var_1))
	 =  HappyAbsSyn7
		 ((happy_var_1, UnspecCtxTy)
	)
happyReduction_27 _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  7 happyReduction_28
happyReduction_28 (HappyAbsSyn11  happy_var_3)
	_
	(HappyTerminal (IdTok happy_var_1))
	 =  HappyAbsSyn7
		 ((happy_var_1, happy_var_3)
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_2  8 happyReduction_29
happyReduction_29 _
	_
	 =  HappyAbsSyn8
		 ([]
	)

happyReduce_30 = happySpecReduce_3  8 happyReduction_30
happyReduction_30 _
	(HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (happy_var_2
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_1  9 happyReduction_31
happyReduction_31 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 ([happy_var_1]
	)
happyReduction_31 _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  9 happyReduction_32
happyReduction_32 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1 ++ [happy_var_3]
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_3  10 happyReduction_33
happyReduction_33 (HappyAbsSyn4  happy_var_3)
	_
	(HappyTerminal (IdTok happy_var_1))
	 =  HappyAbsSyn10
		 ((happy_var_1, happy_var_3)
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  11 happyReduction_34
happyReduction_34 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (Arrow happy_var_1 happy_var_3
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_3  11 happyReduction_35
happyReduction_35 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (Prod happy_var_1 happy_var_3
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_3  11 happyReduction_36
happyReduction_36 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (Sum happy_var_1 happy_var_3
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_3  11 happyReduction_37
happyReduction_37 _
	(HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (happy_var_2
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_2  11 happyReduction_38
happyReduction_38 (HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (BoxTy [] happy_var_2
	)
happyReduction_38 _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_2  11 happyReduction_39
happyReduction_39 (HappyAbsSyn11  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn11
		 (BoxTy happy_var_1 happy_var_2
	)
happyReduction_39 _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_1  11 happyReduction_40
happyReduction_40 (HappyTerminal (IdTok happy_var_1))
	 =  HappyAbsSyn11
		 (BaseTy happy_var_1
	)
happyReduction_40 _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_1  11 happyReduction_41
happyReduction_41 _
	 =  HappyAbsSyn11
		 (BoolTy
	)

happyReduce_42 = happySpecReduce_1  11 happyReduction_42
happyReduction_42 _
	 =  HappyAbsSyn11
		 (IntTy
	)

happyReduce_43 = happySpecReduce_1  11 happyReduction_43
happyReduction_43 _
	 =  HappyAbsSyn11
		 (UnitTy
	)

happyNewToken action sts stk [] =
	action 47 47 notHappyAtAll (HappyState action) sts stk []

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
	AnnTok -> cont 20;
	AnnSepTok -> cont 21;
	AppTok -> cont 22;
	CommaTok -> cont 23;
	LParen -> cont 24;
	RParen -> cont 25;
	LAngleTok -> cont 26;
	RAngleTok -> cont 27;
	LBrackTok -> cont 28;
	RBrackTok -> cont 29;
	IdTok happy_dollar_dollar -> cont 30;
	ModIdTok happy_dollar_dollar -> cont 31;
	IntTok happy_dollar_dollar -> cont 32;
	TrueTok -> cont 33;
	FalseTok -> cont 34;
	UnitTermTok -> cont 35;
	LambdaTok -> cont 36;
	LambdaTok -> cont 37;
	LambdaBodyTok -> cont 38;
	FstTok -> cont 39;
	SndTok -> cont 40;
	InlTok -> cont 41;
	InrTok -> cont 42;
	LetTok -> cont 43;
	BoxTok -> cont 44;
	ValTok -> cont 45;
	InTok -> cont 46;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 47 tk tks = happyError' (tks, explist)
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
    ("u",rest) -> ModIdTok "u" : lexer rest
    ("w",rest) -> ModIdTok "w" : lexer rest
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
