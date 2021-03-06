/*
 * Harbour Project source code:
 *    RDD tests
 *
 * Copyright 2008 Przemyslaw Czerpak <druzus / at / priv.onet.pl>
 * www - http://harbour-project.org
 *
 */

REQUEST DBFNTX
#define _TESTRDD "dbfntx"
#include "rddtst.prg"

PROCEDURE test_main()

RDDTESTC {0,.t.,.t.,.f.}, LOCAL n
RDDTESTF "DBFNTX", {0,.t.,.t.,.f.}, rddSetDefault()
RDDTESTC {1,.t.,.t.,.f.}, USE "_tst" SHARED
RDDTESTF NIL, {1,.t.,.t.,.f.}, dbGoTop()
RDDTESTF NIL, {1,.t.,.t.,.f.}, dbGoBottom()
RDDTESTF NIL, {1,.t.,.t.,.f.}, dbSkip(0)
RDDTESTF NIL, {1,.t.,.t.,.f.}, dbGoto(0)
RDDTESTF NIL, {1,.f.,.t.,.f.}, dbSkip(1)
RDDTESTF NIL, {1,.t.,.f.,.f.}, dbSkip(-1)
RDDTESTF NIL, {1,.t.,.f.,.f.}, dbSkip(0)
RDDTESTC {1,.t.,.f.,.f.}, SET DELETED ON
RDDTESTF NIL, {1,.t.,.t.,.f.}, dbGoTop()
RDDTESTF NIL, {1,.t.,.t.,.f.}, dbGoBottom()
RDDTESTF NIL, {1,.t.,.t.,.f.}, dbSkip(0)
RDDTESTF NIL, {1,.t.,.t.,.f.}, dbGoto(0)
RDDTESTF NIL, {1,.f.,.t.,.f.}, dbSkip(1)
RDDTESTF NIL, {1,.t.,.f.,.f.}, dbSkip(-1)
RDDTESTF NIL, {1,.t.,.f.,.f.}, dbSkip(0)
RDDTESTC {1,.t.,.f.,.f.}, SET DELETED OFF
RDDTESTC {1,.t.,.t.,.f.}, INDEX on FNUM to TG_N
RDDTESTC {1,.t.,.t.,.f.}, INDEX on FSTR to TG_C
RDDTESTF "TG_C", {1,.t.,.t.,.f.}, ordSetFocus()
RDDTESTF NIL, {1,.t.,.t.,.f.}, dbGoTop()
RDDTESTF NIL, {1,.t.,.t.,.f.}, dbGoBottom()
RDDTESTF NIL, {1,.t.,.t.,.f.}, dbSkip(0)
RDDTESTF NIL, {1,.t.,.t.,.f.}, dbGoto(0)
RDDTESTF NIL, {1,.f.,.t.,.f.}, dbSkip(1)
RDDTESTF NIL, {1,.t.,.f.,.f.}, dbSkip(-1)
RDDTESTF NIL, {1,.t.,.f.,.f.}, dbSkip(0)
RDDTESTC {1,.t.,.f.,.f.}, SET DELETED ON
RDDTESTF NIL, {1,.t.,.t.,.f.}, dbGoTop()
RDDTESTF NIL, {1,.t.,.t.,.f.}, dbGoBottom()
RDDTESTF NIL, {1,.t.,.t.,.f.}, dbSkip(0)
RDDTESTF NIL, {1,.t.,.t.,.f.}, dbGoto(0)
RDDTESTF NIL, {1,.f.,.t.,.f.}, dbSkip(1)
RDDTESTF NIL, {1,.t.,.f.,.f.}, dbSkip(-1)
RDDTESTF NIL, {1,.t.,.f.,.f.}, dbSkip(0)
RDDTESTF NIL, {1,.t.,.t.,.f.}, dbGoto(0)
RDDTESTF .f., {1,.t.,.t.,.f.}, dbSeek("", .T.,.F.)
RDDTESTF .f., {1,.t.,.t.,.f.}, dbSeek("", .T.,.T.)
RDDTESTF .f., {1,.t.,.t.,.f.}, dbSeek("", .F.,.F.)
RDDTESTF .f., {1,.t.,.t.,.f.}, dbSeek("", .F.,.T.)
RDDTESTC {1,.t.,.t.,.f.}, SET DELETED OFF
RDDTESTC {15,.f.,.f.,.f.}, for n:=1 to 15                    ; dbAppend()                          ; replace FNUM with int((n+2)/3)      ; replace FSTR with Chr(FNUM+48)      ; next
RDDTESTF NIL, {15,.f.,.f.,.f.}, dbCommit()
RDDTESTF NIL, {15,.f.,.f.,.f.}, dbUnlock()
RDDTESTF "TG_C", {15,.f.,.f.,.f.}, ordSetFocus(1)
RDDTESTF "TG_C", {15,.f.,.f.,.f.}, ordSetFocus()
RDDTESTF .f., {16,.f.,.t.,.f.}, dbSeek(0,.T.,.F.)
RDDTESTF .f., {16,.f.,.t.,.f.}, dbSeek(0,.T.,.T.)
RDDTESTF .f., {16,.f.,.t.,.f.}, dbSeek(0.5,.T.,.F.)
RDDTESTF .f., {16,.f.,.t.,.f.}, dbSeek(0.5,.T.,.T.)
RDDTESTF .f., {16,.f.,.t.,.f.}, dbSeek(1.0,.T.,.F.)
RDDTESTF .f., {16,.f.,.t.,.f.}, dbSeek(1.0,.T.,.T.)
RDDTESTF .f., {16,.f.,.t.,.f.}, dbSeek(2.0,.T.,.F.)
RDDTESTF .f., {16,.f.,.t.,.f.}, dbSeek(2.0,.T.,.T.)
RDDTESTF .f., {16,.f.,.t.,.f.}, dbSeek(2.5,.T.,.F.)
RDDTESTF .f., {16,.f.,.t.,.f.}, dbSeek(2.5,.T.,.T.)
RDDTESTF .f., {16,.f.,.t.,.f.}, dbSeek(5.0,.T.,.F.)
RDDTESTF .f., {16,.f.,.t.,.f.}, dbSeek(5.0,.T.,.T.)
RDDTESTF "TG_C", {16,.f.,.t.,.f.}, ordSetFocus(2)
RDDTESTF "TG_C", {16,.f.,.t.,.f.}, ordSetFocus()
RDDTESTF .t., {1,.f.,.f.,.t.}, dbSeek("", .T.,.F.)
RDDTESTF .t., {1,.f.,.f.,.t.}, dbSeek("", .T.,.T.)
RDDTESTF .f., {16,.f.,.t.,.f.}, dbSeek(" ",.T.,.F.)
RDDTESTF .f., {16,.f.,.t.,.f.}, dbSeek(" ",.T.,.T.)
RDDTESTF .f., {16,.f.,.t.,.f.}, dbSeek("0",.T.,.F.)
RDDTESTF .f., {16,.f.,.t.,.f.}, dbSeek("0",.T.,.T.)
RDDTESTF .t., {1,.f.,.f.,.t.}, dbSeek("1",.T.,.F.)
RDDTESTF .t., {1,.f.,.f.,.t.}, dbSeek("1",.T.,.T.)
RDDTESTF .t., {4,.f.,.f.,.t.}, dbSeek("2",.T.,.F.)
RDDTESTF .t., {4,.f.,.f.,.t.}, dbSeek("2",.T.,.T.)
RDDTESTF .t., {7,.f.,.f.,.t.}, dbSeek("3",.T.,.F.)
RDDTESTF .t., {7,.f.,.f.,.t.}, dbSeek("3",.T.,.T.)
RDDTESTF .t., {10,.f.,.f.,.t.}, dbSeek("4",.T.,.F.)
RDDTESTF .t., {10,.f.,.f.,.t.}, dbSeek("4",.T.,.T.)
RDDTESTF .t., {13,.f.,.f.,.t.}, dbSeek("5",.T.,.F.)
RDDTESTF .t., {13,.f.,.f.,.t.}, dbSeek("5",.T.,.T.)
RDDTESTF .f., {16,.f.,.t.,.f.}, dbSeek("6",.T.,.F.)
RDDTESTF .f., {16,.f.,.t.,.f.}, dbSeek("6",.T.,.T.)
RDDTESTF .t., {1,.f.,.f.,.t.}, dbSeek("", .T.,.F.)
RDDTESTF .t., {1,.f.,.f.,.t.}, dbSeek("", .T.,.T.)
RDDTESTF .f., {16,.f.,.t.,.f.}, dbSeek(" ",.T.,.F.)
RDDTESTF .f., {16,.f.,.t.,.f.}, dbSeek(" ",.T.,.T.)
RDDTESTF .f., {16,.f.,.t.,.f.}, dbSeek("0",.T.,.F.)
RDDTESTF .f., {16,.f.,.t.,.f.}, dbSeek("0",.T.,.T.)
RDDTESTF .t., {1,.f.,.f.,.t.}, dbSeek("1",.T.,.F.)
RDDTESTF .t., {1,.f.,.f.,.t.}, dbSeek("1",.T.,.T.)
RDDTESTF .t., {4,.f.,.f.,.t.}, dbSeek("2",.T.,.F.)
RDDTESTF .t., {4,.f.,.f.,.t.}, dbSeek("2",.T.,.T.)
RDDTESTF .t., {7,.f.,.f.,.t.}, dbSeek("3",.T.,.F.)
RDDTESTF .t., {7,.f.,.f.,.t.}, dbSeek("3",.T.,.T.)
RDDTESTF .t., {10,.f.,.f.,.t.}, dbSeek("4",.T.,.F.)
RDDTESTF .t., {10,.f.,.f.,.t.}, dbSeek("4",.T.,.T.)
RDDTESTF .t., {13,.f.,.f.,.t.}, dbSeek("5",.T.,.F.)
RDDTESTF .t., {13,.f.,.f.,.t.}, dbSeek("5",.T.,.T.)
RDDTESTF .f., {16,.f.,.t.,.f.}, dbSeek("6",.T.,.F.)
RDDTESTF .f., {16,.f.,.t.,.f.}, dbSeek("6",.T.,.T.)
RDDTESTC {13,.f.,.f.,.f.}, INDEX on FSTR to TG_C DESCEND
RDDTESTF .t., {13,.f.,.f.,.t.}, dbSeek("",.T.,.F.)
RDDTESTF .t., {13,.f.,.f.,.t.}, dbSeek("",.T.,.T.)
RDDTESTF .f., {16,.f.,.t.,.f.}, dbSeek(" ",.T.,.F.)
RDDTESTF .f., {16,.f.,.t.,.f.}, dbSeek(" ",.T.,.T.)
RDDTESTF .f., {16,.f.,.t.,.f.}, dbSeek("0",.T.,.F.)
RDDTESTF .f., {16,.f.,.t.,.f.}, dbSeek("0",.T.,.T.)
RDDTESTF .t., {1,.f.,.f.,.t.}, dbSeek("1",.T.,.F.)
RDDTESTF .t., {1,.f.,.f.,.t.}, dbSeek("1",.T.,.T.)
RDDTESTF .t., {4,.f.,.f.,.t.}, dbSeek("2",.T.,.F.)
RDDTESTF .t., {4,.f.,.f.,.t.}, dbSeek("2",.T.,.T.)
RDDTESTF .t., {7,.f.,.f.,.t.}, dbSeek("3",.T.,.F.)
RDDTESTF .t., {7,.f.,.f.,.t.}, dbSeek("3",.T.,.T.)
RDDTESTF .t., {10,.f.,.f.,.t.}, dbSeek("4",.T.,.F.)
RDDTESTF .t., {10,.f.,.f.,.t.}, dbSeek("4",.T.,.T.)
RDDTESTF .t., {13,.f.,.f.,.t.}, dbSeek("5",.T.,.F.)
RDDTESTF .t., {13,.f.,.f.,.t.}, dbSeek("5",.T.,.T.)
RDDTESTF .f., {16,.f.,.t.,.f.}, dbSeek("6",.T.,.F.)
RDDTESTF .f., {16,.f.,.t.,.f.}, dbSeek("6",.T.,.T.)
RDDTESTC {1,.f.,.f.,.f.}, INDEX on FSTR to TG_C
RDDTESTF NIL, {1,.f.,.f.,.f.}, dbGoTop()
RDDTESTF NIL, {1,.f.,.f.,.f.}, dbSkip(0)
RDDTESTF NIL, {1,.t.,.f.,.f.}, dbSkip(-1)
RDDTESTF NIL, {1,.t.,.f.,.f.}, dbSkip(0)
RDDTESTF NIL, {15,.f.,.f.,.f.}, dbGoBottom()
RDDTESTF NIL, {15,.f.,.f.,.f.}, dbSkip(0)
RDDTESTF NIL, {16,.f.,.t.,.f.}, dbSkip(1)
RDDTESTF NIL, {16,.f.,.t.,.f.}, dbSkip(0)
RDDTESTF NIL, {1,.f.,.f.,.f.}, dbGoto(1)
RDDTESTF NIL, {1,.t.,.f.,.f.}, dbSkip(-1)
RDDTESTF NIL, {2,.f.,.f.,.f.}, dbSkip(1)
RDDTESTF NIL, {7,.f.,.f.,.f.}, dbSkip(5)
RDDTESTF NIL, {12,.f.,.f.,.f.}, dbSkip(5)
RDDTESTF NIL, {16,.f.,.t.,.f.}, dbSkip(5)
RDDTESTF NIL, {15,.f.,.f.,.f.}, dbSkip(-1)
RDDTESTF NIL, {10,.f.,.f.,.f.}, dbSkip(-5)
RDDTESTF NIL, {16,.f.,.t.,.f.}, dbSkip(10)
RDDTESTF NIL, {11,.f.,.f.,.f.}, dbSkip(-5)
RDDTESTF NIL, {16,.t.,.t.,.f.}, dbGoto(16)
RDDTESTF NIL, {15,.f.,.f.,.f.}, dbSkip(-1)
RDDTESTF NIL, {1,.f.,.f.,.f.}, dbGoto(1)
RDDTESTF NIL, {2,.f.,.f.,.f.}, dbSkip(1)
RDDTESTF NIL, {1,.f.,.f.,.f.}, dbGoto(1)
RDDTESTF NIL, {1,.t.,.f.,.f.}, dbSkip(-1)
RDDTESTF NIL, {4,.f.,.f.,.f.}, dbGoto(4)
RDDTESTF NIL, {5,.f.,.f.,.f.}, dbSkip(1)
RDDTESTF NIL, {4,.f.,.f.,.f.}, dbGoto(4)
RDDTESTF NIL, {3,.f.,.f.,.f.}, dbSkip(-1)
RDDTESTF NIL, {6,.f.,.f.,.f.}, dbGoto(6)
RDDTESTF NIL, {7,.f.,.f.,.f.}, dbSkip(1)
RDDTESTF NIL, {6,.f.,.f.,.f.}, dbGoto(6)
RDDTESTF NIL, {5,.f.,.f.,.f.}, dbSkip(-1)
RDDTESTF NIL, {7,.f.,.f.,.f.}, dbGoto(7)
RDDTESTF NIL, {8,.f.,.f.,.f.}, dbSkip(1)
RDDTESTF NIL, {7,.f.,.f.,.f.}, dbGoto(7)
RDDTESTF NIL, {6,.f.,.f.,.f.}, dbSkip(-1)
RDDTESTF NIL, {12,.f.,.f.,.f.}, dbGoto(12)
RDDTESTF NIL, {13,.f.,.f.,.f.}, dbSkip(1)
RDDTESTF NIL, {12,.f.,.f.,.f.}, dbGoto(12)
RDDTESTF NIL, {11,.f.,.f.,.f.}, dbSkip(-1)
RDDTESTF NIL, {13,.f.,.f.,.f.}, dbGoto(13)
RDDTESTF NIL, {14,.f.,.f.,.f.}, dbSkip(1)
RDDTESTF NIL, {13,.f.,.f.,.f.}, dbGoto(13)
RDDTESTF NIL, {12,.f.,.f.,.f.}, dbSkip(-1)
RDDTESTF NIL, {14,.f.,.f.,.f.}, dbGoto(14)
RDDTESTF NIL, {13,.f.,.f.,.f.}, dbSkip(-1)
RDDTESTF NIL, {16,.t.,.t.,.f.}, dbGoto(16)
RDDTESTF NIL, {15,.f.,.f.,.f.}, dbSkip(-1)
RDDTESTF "TG_C", {15,.f.,.f.,.f.}, ordSetFocus(0)
RDDTESTF NIL, {1,.f.,.f.,.f.}, dbGoTop()
RDDTESTF NIL, {1,.t.,.f.,.f.}, dbSkip(-1)
RDDTESTF NIL, {1,.f.,.f.,.f.}, dbGoTop()
RDDTESTF NIL, {1,.t.,.f.,.f.}, dbSkip(-10)
RDDTESTC {7,.f.,.f.,.f.}, INDEX on FSTR to TG_C FOR FNUM>2 .AND. FNUM<=4
RDDTESTF NIL, {1,.f.,.f.,.f.}, dbGoto(1)
RDDTESTF NIL, {16,.f.,.t.,.f.}, dbSkip(1)
RDDTESTF NIL, {1,.f.,.f.,.f.}, dbGoto(1)
RDDTESTF NIL, {7,.t.,.f.,.f.}, dbSkip(-1)
RDDTESTF NIL, {4,.f.,.f.,.f.}, dbGoto(4)
RDDTESTF NIL, {16,.f.,.t.,.f.}, dbSkip(1)
RDDTESTF NIL, {4,.f.,.f.,.f.}, dbGoto(4)
RDDTESTF NIL, {7,.t.,.f.,.f.}, dbSkip(-1)
RDDTESTF NIL, {6,.f.,.f.,.f.}, dbGoto(6)
RDDTESTF NIL, {16,.f.,.t.,.f.}, dbSkip(1)
RDDTESTF NIL, {6,.f.,.f.,.f.}, dbGoto(6)
RDDTESTF NIL, {7,.t.,.f.,.f.}, dbSkip(-1)
RDDTESTF NIL, {7,.f.,.f.,.f.}, dbGoto(7)
RDDTESTF NIL, {8,.f.,.f.,.f.}, dbSkip(1)
RDDTESTF NIL, {7,.f.,.f.,.f.}, dbGoto(7)
RDDTESTF NIL, {7,.t.,.f.,.f.}, dbSkip(-1)
RDDTESTF NIL, {12,.f.,.f.,.f.}, dbGoto(12)
RDDTESTF NIL, {16,.f.,.t.,.f.}, dbSkip(1)
RDDTESTF NIL, {12,.f.,.f.,.f.}, dbGoto(12)
RDDTESTF NIL, {11,.f.,.f.,.f.}, dbSkip(-1)
RDDTESTF NIL, {13,.f.,.f.,.f.}, dbGoto(13)
RDDTESTF NIL, {16,.f.,.t.,.f.}, dbSkip(1)
RDDTESTF NIL, {13,.f.,.f.,.f.}, dbGoto(13)
RDDTESTF NIL, {7,.t.,.f.,.f.}, dbSkip(-1)
RDDTESTF NIL, {14,.f.,.f.,.f.}, dbGoto(14)
RDDTESTF NIL, {7,.t.,.f.,.f.}, dbSkip(-1)
RDDTESTF NIL, {16,.t.,.t.,.f.}, dbGoto(16)
RDDTESTF NIL, {12,.f.,.f.,.f.}, dbSkip(-1)
RDDTESTC {1,.f.,.f.,.f.}, INDEX on FSTR to TG_C FOR FNUM!=2 .AND. FNUM<4
RDDTESTF NIL, {1,.f.,.f.,.f.}, dbGoto(1)
RDDTESTF NIL, {2,.f.,.f.,.f.}, dbSkip(1)
RDDTESTF NIL, {1,.f.,.f.,.f.}, dbGoto(1)
RDDTESTF NIL, {1,.t.,.f.,.f.}, dbSkip(-1)
RDDTESTF NIL, {4,.f.,.f.,.f.}, dbGoto(4)
RDDTESTF NIL, {16,.f.,.t.,.f.}, dbSkip(1)
RDDTESTF NIL, {4,.f.,.f.,.f.}, dbGoto(4)
RDDTESTF NIL, {1,.t.,.f.,.f.}, dbSkip(-1)
RDDTESTF NIL, {7,.f.,.f.,.f.}, dbGoto(7)
RDDTESTF NIL, {8,.f.,.f.,.f.}, dbSkip(1)
RDDTESTF NIL, {7,.f.,.f.,.f.}, dbGoto(7)
RDDTESTF NIL, {3,.f.,.f.,.f.}, dbSkip(-1)
RDDTESTF NIL, {10,.f.,.f.,.f.}, dbGoto(10)
RDDTESTF NIL, {16,.f.,.t.,.f.}, dbSkip(1)
RDDTESTF NIL, {10,.f.,.f.,.f.}, dbGoto(10)
RDDTESTF NIL, {1,.t.,.f.,.f.}, dbSkip(-1)
RDDTESTF NIL, {13,.f.,.f.,.f.}, dbGoto(13)
RDDTESTF NIL, {16,.f.,.t.,.f.}, dbSkip(1)
RDDTESTF NIL, {13,.f.,.f.,.f.}, dbGoto(13)
RDDTESTF NIL, {1,.t.,.f.,.f.}, dbSkip(-1)
RDDTESTF NIL, {14,.f.,.f.,.f.}, dbGoto(14)
RDDTESTF NIL, {1,.t.,.f.,.f.}, dbSkip(-1)
RDDTESTF NIL, {16,.t.,.t.,.f.}, dbGoto(16)
RDDTESTF NIL, {9,.f.,.f.,.f.}, dbSkip(-1)
RDDTESTF NIL, {1,.f.,.f.,.f.}, dbGoTop()
RDDTESTF NIL, {2,.f.,.f.,.f.}, dbSkip(1)
RDDTESTF NIL, {1,.f.,.f.,.f.}, dbGoTop()
RDDTESTF NIL, {1,.t.,.f.,.f.}, dbSkip(-1)
RDDTESTF NIL, {9,.f.,.f.,.f.}, dbGoBottom()
RDDTESTF NIL, {16,.f.,.t.,.f.}, dbSkip(1)
RDDTESTF NIL, {9,.f.,.f.,.f.}, dbGoBottom()
RDDTESTF NIL, {8,.f.,.f.,.f.}, dbSkip(-1)
RDDTESTF NIL, {1,.f.,.f.,.f.}, dbGoto(1)
RDDTESTF NIL, {1,.f.,.f.,.f.}, dbGoTop()
RDDTESTF NIL, {9,.f.,.f.,.f.}, dbGoBottom()
RDDTESTC {16,.t.,.t.,.f.}, INDEX on FSTR to TG_C FOR FNUM==6
RDDTESTF NIL, {1,.f.,.f.,.f.}, dbGoto(1)
RDDTESTF NIL, {16,.t.,.t.,.f.}, dbGoTop()
RDDTESTF NIL, {16,.t.,.t.,.f.}, dbGoBottom()
RDDTESTC {13,.f.,.f.,.f.}, INDEX on FSTR to TG_C FOR RecNo()!=5 DESCEND
RDDTESTF NIL, {5,.f.,.f.,.f.}, dbGoto(5)
RDDTESTF NIL, {13,.t.,.f.,.f.}, dbSkip(-1)
RDDTESTF NIL, {5,.f.,.f.,.f.}, dbGoto(5)
RDDTESTF NIL, {16,.f.,.t.,.f.}, dbSkip(1)
RDDTESTC {1,.f.,.f.,.f.}, INDEX on FSTR to TG_C FOR RecNo()!=5
RDDTESTF NIL, {5,.f.,.f.,.f.}, dbGoto(5)
RDDTESTF NIL, {1,.t.,.f.,.f.}, dbSkip(-1)
RDDTESTF NIL, {5,.f.,.f.,.f.}, dbGoto(5)
RDDTESTF NIL, {16,.f.,.t.,.f.}, dbSkip(1)
RDDTESTF "TG_C", {16,.f.,.t.,.f.}, ordSetFocus(0)
RDDTESTC {16,.f.,.t.,.f.}, SET DELETED ON
RDDTESTF .t., {16,.t.,.t.,.f.}, FLock()
RDDTESTF NIL, {1,.f.,.f.,.f.}, dbGoto(1)
RDDTESTF NIL, {1,.f.,.f.,.f.}, dbDelete()
RDDTESTF NIL, {3,.f.,.f.,.f.}, dbGoto(3)
RDDTESTF NIL, {3,.f.,.f.,.f.}, dbDelete()
RDDTESTF NIL, {6,.f.,.f.,.f.}, dbGoto(6)
RDDTESTF NIL, {6,.f.,.f.,.f.}, dbDelete()
RDDTESTF NIL, {7,.f.,.f.,.f.}, dbGoto(7)
RDDTESTF NIL, {7,.f.,.f.,.f.}, dbDelete()
RDDTESTF NIL, {13,.f.,.f.,.f.}, dbGoto(13)
RDDTESTF NIL, {13,.f.,.f.,.f.}, dbDelete()
RDDTESTF NIL, {14,.f.,.f.,.f.}, dbGoto(14)
RDDTESTF NIL, {14,.f.,.f.,.f.}, dbDelete()
RDDTESTF NIL, {15,.f.,.f.,.f.}, dbGoto(15)
RDDTESTF NIL, {15,.f.,.f.,.f.}, dbDelete()
RDDTESTF NIL, {16,.t.,.t.,.f.}, dbGoto(16)
RDDTESTF NIL, {16,.t.,.t.,.f.}, dbDelete()
RDDTESTF NIL, {16,.t.,.t.,.f.}, dbCommit()
RDDTESTF NIL, {16,.t.,.t.,.f.}, dbUnlock()
RDDTESTF NIL, {2,.f.,.f.,.f.}, dbGoTop()
RDDTESTF NIL, {2,.t.,.f.,.f.}, dbSkip(-1)
RDDTESTF NIL, {2,.f.,.f.,.f.}, dbGoTop()
RDDTESTF NIL, {2,.t.,.f.,.f.}, dbSkip(-10)
RDDTESTF NIL, {10,.f.,.f.,.f.}, dbSkip(5)
RDDTESTF NIL, {2,.f.,.f.,.f.}, dbSkip(-5)
RDDTESTF NIL, {11,.f.,.f.,.f.}, dbSkip(6)
RDDTESTF NIL, {2,.t.,.f.,.f.}, dbSkip(-7)
RDDTESTF NIL, {16,.f.,.t.,.f.}, dbSkip(8)
RDDTESTF NIL, {2,.t.,.f.,.f.}, dbSkip(-20)
RDDTESTF NIL, {12,.f.,.f.,.f.}, dbGoBottom()
RDDTESTF NIL, {16,.f.,.t.,.f.}, dbSkip(1)
RDDTESTF NIL, {12,.f.,.f.,.f.}, dbGoBottom()
RDDTESTF NIL, {16,.f.,.t.,.f.}, dbSkip(10)
RDDTESTF NIL, {8,.f.,.f.,.f.}, dbSkip(-5)
RDDTESTF NIL, {16,.f.,.t.,.f.}, dbSkip(5)
RDDTESTF NIL, {5,.f.,.f.,.f.}, dbSkip(-6)
RDDTESTF NIL, {16,.f.,.t.,.f.}, dbSkip(7)
RDDTESTF NIL, {2,.f.,.f.,.f.}, dbSkip(-8)
RDDTESTF NIL, {16,.f.,.t.,.f.}, dbSkip(20)
RDDTESTF NIL, {12,.f.,.f.,.f.}, dbGoBottom()
RDDTESTF NIL, {2,.t.,.f.,.f.}, dbSkip(-20)
RDDTESTF .t., {2,.t.,.f.,.f.}, FLock()
RDDTESTC {16,.f.,.t.,.f.}, DELETE ALL
RDDTESTF NIL, {16,.f.,.t.,.f.}, dbUnlock()
RDDTESTF NIL, {16,.t.,.t.,.f.}, dbGoTop()
RDDTESTF NIL, {16,.t.,.t.,.f.}, dbGoBottom()
RDDTESTF NIL, {7,.f.,.f.,.f.}, dbGoto(7)
RDDTESTF NIL, {16,.f.,.t.,.f.}, dbSkip(1)
RDDTESTF NIL, {7,.f.,.f.,.f.}, dbGoto(7)
RDDTESTF NIL, {16,.t.,.f.,.f.}, dbSkip(-1)
RDDTESTF NIL, {16,.f.,.t.,.f.}, dbSkip(1)
RDDTESTF NIL, {16,.t.,.f.,.f.}, dbSkip(-1)
RDDTESTF NIL, {16,.t.,.f.,.f.}, dbSkip(0)
RDDTESTF NIL, {16,.t.,.t.,.f.}, dbGoto(0)
RDDTESTF NIL, {16,.f.,.t.,.f.}, dbSkip(1)
RDDTESTF NIL, {16,.t.,.f.,.f.}, dbSkip(-1)
RDDTESTF NIL, {7,.f.,.f.,.f.}, dbGoto(7)
RDDTESTF .t., {7,.f.,.f.,.f.}, dbRLock()
RDDTESTF NIL, {7,.f.,.f.,.f.}, dbRecall()
RDDTESTF NIL, {7,.f.,.f.,.f.}, dbUnlock()
RDDTESTF NIL, {4,.f.,.f.,.f.}, dbGoto(4)
RDDTESTF NIL, {7,.t.,.f.,.f.}, dbSkip(-1)
RDDTESTF NIL, {4,.f.,.f.,.f.}, dbGoto(4)
RDDTESTF NIL, {7,.f.,.f.,.f.}, dbSkip(1)
RDDTESTF NIL, {11,.f.,.f.,.f.}, dbGoto(11)
RDDTESTF NIL, {7,.f.,.f.,.f.}, dbSkip(-1)
RDDTESTF NIL, {11,.f.,.f.,.f.}, dbGoto(11)
RDDTESTF NIL, {16,.f.,.t.,.f.}, dbSkip(1)
RDDTESTC {16,.f.,.t.,.f.}, SET DELETED OFF
RDDTESTF .t., {16,.t.,.t.,.f.}, FLock()
RDDTESTC {16,.f.,.t.,.f.}, RECALL ALL
RDDTESTF NIL, {16,.f.,.t.,.f.}, dbUnlock()
RDDTESTC {16,.f.,.t.,.f.}, SET DELETED ON
RDDTESTF NIL, {1,.f.,.f.,.f.}, dbGoTop()
RDDTESTF NIL, {15,.f.,.f.,.f.}, dbGoBottom()
RDDTESTF NIL, {15,.f.,.f.,.f.}, dbCommit()
RDDTESTF "", {15,.f.,.f.,.f.}, ordSetFocus(1)
RDDTESTC {15,.f.,.f.,.f.}, SET DELETED ON
RDDTESTF .t., {15,.f.,.f.,.f.}, FLock()
RDDTESTF NIL, {1,.f.,.f.,.f.}, dbGoto(1)
RDDTESTF NIL, {1,.f.,.f.,.f.}, dbDelete()
RDDTESTF NIL, {3,.f.,.f.,.f.}, dbGoto(3)
RDDTESTF NIL, {3,.f.,.f.,.f.}, dbDelete()
RDDTESTF NIL, {6,.f.,.f.,.f.}, dbGoto(6)
RDDTESTF NIL, {6,.f.,.f.,.f.}, dbDelete()
RDDTESTF NIL, {7,.f.,.f.,.f.}, dbGoto(7)
RDDTESTF NIL, {7,.f.,.f.,.f.}, dbDelete()
RDDTESTF NIL, {13,.f.,.f.,.f.}, dbGoto(13)
RDDTESTF NIL, {13,.f.,.f.,.f.}, dbDelete()
RDDTESTF NIL, {14,.f.,.f.,.f.}, dbGoto(14)
RDDTESTF NIL, {14,.f.,.f.,.f.}, dbDelete()
RDDTESTF NIL, {15,.f.,.f.,.f.}, dbGoto(15)
RDDTESTF NIL, {15,.f.,.f.,.f.}, dbDelete()
RDDTESTF NIL, {16,.t.,.t.,.f.}, dbGoto(16)
RDDTESTF NIL, {16,.t.,.t.,.f.}, dbDelete()
RDDTESTF NIL, {16,.t.,.t.,.f.}, dbCommit()
RDDTESTF NIL, {16,.t.,.t.,.f.}, dbUnlock()
RDDTESTF NIL, {2,.f.,.f.,.f.}, dbGoTop()
RDDTESTF NIL, {2,.t.,.f.,.f.}, dbSkip(-1)
RDDTESTF NIL, {2,.f.,.f.,.f.}, dbGoTop()
RDDTESTF NIL, {2,.t.,.f.,.f.}, dbSkip(-10)
RDDTESTF NIL, {11,.f.,.f.,.f.}, dbSkip(5)
RDDTESTF NIL, {2,.f.,.f.,.f.}, dbSkip(-5)
RDDTESTF NIL, {12,.f.,.f.,.f.}, dbSkip(6)
RDDTESTF NIL, {2,.t.,.f.,.f.}, dbSkip(-7)
RDDTESTF NIL, {16,.f.,.t.,.f.}, dbSkip(8)
RDDTESTF NIL, {2,.t.,.f.,.f.}, dbSkip(-20)
RDDTESTF NIL, {12,.f.,.f.,.f.}, dbGoBottom()
RDDTESTF NIL, {16,.f.,.t.,.f.}, dbSkip(1)
RDDTESTF NIL, {12,.f.,.f.,.f.}, dbGoBottom()
RDDTESTF NIL, {16,.f.,.t.,.f.}, dbSkip(10)
RDDTESTF NIL, {8,.f.,.f.,.f.}, dbSkip(-5)
RDDTESTF NIL, {16,.f.,.t.,.f.}, dbSkip(5)
RDDTESTF NIL, {4,.f.,.f.,.f.}, dbSkip(-6)
RDDTESTF NIL, {16,.f.,.t.,.f.}, dbSkip(7)
RDDTESTF NIL, {2,.t.,.f.,.f.}, dbSkip(-8)
RDDTESTF NIL, {16,.f.,.t.,.f.}, dbSkip(20)
RDDTESTF NIL, {12,.f.,.f.,.f.}, dbGoBottom()
RDDTESTF NIL, {2,.t.,.f.,.f.}, dbSkip(-20)
RDDTESTF .t., {2,.t.,.f.,.f.}, FLock()
RDDTESTC {16,.f.,.t.,.f.}, DELETE ALL
RDDTESTF NIL, {16,.f.,.t.,.f.}, dbCommit()
RDDTESTF NIL, {16,.f.,.t.,.f.}, dbUnlock()
RDDTESTF NIL, {16,.t.,.t.,.f.}, dbGoTop()
RDDTESTF NIL, {16,.t.,.t.,.f.}, dbGoBottom()
RDDTESTF NIL, {7,.f.,.f.,.f.}, dbGoto(7)
RDDTESTF NIL, {16,.f.,.t.,.f.}, dbSkip(1)
RDDTESTF NIL, {7,.f.,.f.,.f.}, dbGoto(7)
RDDTESTF NIL, {16,.t.,.f.,.f.}, dbSkip(-1)
RDDTESTF NIL, {16,.f.,.t.,.f.}, dbSkip(1)
RDDTESTF NIL, {16,.t.,.f.,.f.}, dbSkip(-1)
RDDTESTF NIL, {16,.t.,.f.,.f.}, dbSkip(0)
RDDTESTF NIL, {16,.t.,.t.,.f.}, dbGoto(0)
RDDTESTF NIL, {16,.f.,.t.,.f.}, dbSkip(1)
RDDTESTF NIL, {16,.t.,.f.,.f.}, dbSkip(-1)
RDDTESTF NIL, {16,.t.,.t.,.f.}, dbGoto(0)
RDDTESTF NIL, {16,.f.,.t.,.f.}, dbSkip(1)
RDDTESTF NIL, {7,.f.,.f.,.f.}, dbGoto(7)
RDDTESTF .t., {7,.f.,.f.,.f.}, dbRLock()
RDDTESTF NIL, {7,.f.,.f.,.f.}, dbRecall()
RDDTESTF NIL, {7,.f.,.f.,.f.}, dbUnlock()
RDDTESTF NIL, {4,.f.,.f.,.f.}, dbGoto(4)
RDDTESTF NIL, {7,.t.,.f.,.f.}, dbSkip(-1)
RDDTESTF NIL, {4,.f.,.f.,.f.}, dbGoto(4)
RDDTESTF NIL, {7,.f.,.f.,.f.}, dbSkip(1)
RDDTESTF NIL, {11,.f.,.f.,.f.}, dbGoto(11)
RDDTESTF NIL, {7,.f.,.f.,.f.}, dbSkip(-1)
RDDTESTF NIL, {11,.f.,.f.,.f.}, dbGoto(11)
RDDTESTF NIL, {16,.f.,.t.,.f.}, dbSkip(1)
RDDTESTC {16,.f.,.t.,.f.}, SET DELETED OFF
RDDTESTF .t., {16,.t.,.t.,.f.}, FLock()
RDDTESTC {16,.f.,.t.,.f.}, RECALL ALL
RDDTESTF NIL, {16,.f.,.t.,.f.}, dbUnlock()
RDDTESTC {16,.f.,.t.,.f.}, SET DELETED ON
RDDTESTF NIL, {1,.f.,.f.,.f.}, dbGoTop()
RDDTESTF NIL, {15,.f.,.f.,.f.}, dbGoBottom()
RDDTESTF NIL, {15,.f.,.f.,.f.}, dbCommit()
RDDTESTC {1,.f.,.f.,.f.}, INDEX on FSTR to TG_C
RDDTESTF .f., {16,.f.,.t.,.f.}, dbSeek(PadR(" ",10)+" ",.T.,.F.)
RDDTESTF .f., {16,.f.,.t.,.f.}, dbSeek(PadR(" ",10)+" ",.T.,.T.)
RDDTESTF .f., {16,.f.,.t.,.f.}, dbSeek(PadR("0",10)+" ",.T.,.F.)
RDDTESTF .f., {16,.f.,.t.,.f.}, dbSeek(PadR("0",10)+" ",.T.,.T.)
RDDTESTF .t., {1,.f.,.f.,.t.}, dbSeek(PadR("1",10)+" ",.T.,.F.)
RDDTESTF .t., {1,.f.,.f.,.t.}, dbSeek(PadR("1",10)+" ",.T.,.T.)
RDDTESTF .t., {4,.f.,.f.,.t.}, dbSeek(PadR("2",10)+" ",.T.,.F.)
RDDTESTF .t., {4,.f.,.f.,.t.}, dbSeek(PadR("2",10)+" ",.T.,.T.)
RDDTESTF .t., {7,.f.,.f.,.t.}, dbSeek(PadR("3",10)+" ",.T.,.F.)
RDDTESTF .t., {7,.f.,.f.,.t.}, dbSeek(PadR("3",10)+" ",.T.,.T.)
RDDTESTF .t., {10,.f.,.f.,.t.}, dbSeek(PadR("4",10)+" ",.T.,.F.)
RDDTESTF .t., {10,.f.,.f.,.t.}, dbSeek(PadR("4",10)+" ",.T.,.T.)
RDDTESTF .t., {13,.f.,.f.,.t.}, dbSeek(PadR("5",10)+" ",.T.,.F.)
RDDTESTF .t., {13,.f.,.f.,.t.}, dbSeek(PadR("5",10)+" ",.T.,.T.)
RDDTESTF .f., {16,.f.,.t.,.f.}, dbSeek(PadR("6",10)+" ",.T.,.F.)
RDDTESTF .f., {16,.f.,.t.,.f.}, dbSeek(PadR("6",10)+" ",.T.,.T.)
RDDTESTF .f., {16,.f.,.t.,.f.}, dbSeek(PadR(" ",10)+"*",.T.,.F.)
RDDTESTF .f., {16,.f.,.t.,.f.}, dbSeek(PadR(" ",10)+"*",.T.,.T.)
RDDTESTF .f., {16,.f.,.t.,.f.}, dbSeek(PadR("0",10)+"*",.T.,.F.)
RDDTESTF .f., {16,.f.,.t.,.f.}, dbSeek(PadR("0",10)+"*",.T.,.T.)
RDDTESTF .t., {1,.f.,.f.,.t.}, dbSeek(PadR("1",10)+"*",.T.,.F.)
RDDTESTF .t., {1,.f.,.f.,.t.}, dbSeek(PadR("1",10)+"*",.T.,.T.)
RDDTESTF .t., {4,.f.,.f.,.t.}, dbSeek(PadR("2",10)+"*",.T.,.F.)
RDDTESTF .t., {4,.f.,.f.,.t.}, dbSeek(PadR("2",10)+"*",.T.,.T.)
RDDTESTF .t., {7,.f.,.f.,.t.}, dbSeek(PadR("3",10)+"*",.T.,.F.)
RDDTESTF .t., {7,.f.,.f.,.t.}, dbSeek(PadR("3",10)+"*",.T.,.T.)
RDDTESTF .t., {10,.f.,.f.,.t.}, dbSeek(PadR("4",10)+"*",.T.,.F.)
RDDTESTF .t., {10,.f.,.f.,.t.}, dbSeek(PadR("4",10)+"*",.T.,.T.)
RDDTESTF .t., {13,.f.,.f.,.t.}, dbSeek(PadR("5",10)+"*",.T.,.F.)
RDDTESTF .t., {13,.f.,.f.,.t.}, dbSeek(PadR("5",10)+"*",.T.,.T.)
RDDTESTF .f., {16,.f.,.t.,.f.}, dbSeek(PadR("6",10)+"*",.T.,.F.)
RDDTESTF .f., {16,.f.,.t.,.f.}, dbSeek(PadR("6",10)+"*",.T.,.T.)

RETURN
