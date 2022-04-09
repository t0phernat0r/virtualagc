## AGC Math Test - Jae Choi 2022
A                               EQUALS          0
L                               EQUALS          1               # L AND Q ARE BOTH CHANNELS AND REGISTERS.
Q                               EQUALS          2
EBANK                           EQUALS          3
FBANK                           EQUALS          4
Z                               EQUALS          5               # ADJACENT TO FBANK AND BBANK FOR DXCH Z
BBANK                           EQUALS          6               # (DTCB) AND DXCH FBANK (DTCF).
                                                                # REGISTER 7 IS A ZERO-SOURCE, USED BY ZL.
ARUPT                           EQUALS          10              # INTERRUPT STORAGE.
LRUPT                           EQUALS          11
QRUPT                           EQUALS          12
SAMPTIME                        EQUALS          13              # SAMPLED TIME 1 & 2.
ZRUPT                           EQUALS          15              # (13 AND 14 ARE SPARES.)
BANKRUPT                        EQUALS          16              # USUALLY HOLDS FBANK OR BBANK.
BRUPT                           EQUALS          17              # RESUME ADDRESS AS WELL.
CYR                             EQUALS          20
SR                              EQUALS          21
CYL                             EQUALS          22
EDOP                            EQUALS          23              # EDITS INTERPRETIVE OPERATION CODE PAIRS.
TIME2                           EQUALS          24
TIME1                           EQUALS          25
TIME3                           EQUALS          26
TIME4                           EQUALS          27
TIME5                           EQUALS          30
TIME6                           EQUALS          31

                                SETLOC          67
NEWJOB                          ERASE                           # Allocate a variable at the location checked by the Night Watchman.
# More variables.
KEYBUF                          ERASE                           # 040 when empty, 0-037 when holding a keycode
LAST040                         ERASE                           # Most recent value from input channel 040.
SECOND                          ERASE                           # Storage for components of time
MINUTE                          ERASE
HOUR                            ERASE
DAY                             ERASE
MONTH                           ERASE
YEAR                            ERASE

HALFY                           ERASE
ROOTRET                         ERASE
SQRARG                          ERASE
SQRMAX                          ERASE
SQRCNT                          ERASE
TEMK                            EQUALS          HALFY
SQ                              EQUALS          ROOTRET

CHANLAMP                        EQUALS          0
CHANREG1                        EQUALS          1
CHANREG2                        EQUALS          2
CHANREG3                        EQUALS          3
CHANVERB                        EQUALS          4
CHANNOUN                        EQUALS          5

CHANG                           EQUALS          6
CHANM                           EQUALS          7
CHANRA                          EQUALS          10
CHANRB                          EQUALS          11
CHANATX                         EQUALS          12
CHANOUTDVA                      EQUALS          13
CHANOUTDVB                      EQUALS          14
CHANDVATX                       EQUALS          15
CHANDVBTX                       EQUALS          16

VPRCHNG                         EQUALS          47      # DEC 39
VIDLE                           EQUALS          23      # DEC 19

LAMPOPERR                       EQUALS          BIT12
NUMSPECM                        EQUALS          POSMAX

CURRV                           ERASE
PASTV                           ERASE
PASTN                           ERASE

1/INPATX                        ERASE
INPUTG                          ERASE
INPUTM                          ERASE
1/INPRA                         ERASE
1/INPRB                         ERASE
OUTPDVA                         ERASE
OUTPDVB                         ERASE
OUTPDVATX                       ERASE
OUTPDVBTX                       ERASE


                                SETLOC          4000            # The interrupt-vector table.
                                                                # Come here at power-up or GOJAM
                                # Come here at power-up or GOJAM
                                INHINT                # Disable interrupts for a moment.
                                TCF       STARTUP     # Go to your "real" code.
                                NOOP
                                NOOP

                                RESUME    # T6RUPT
                                NOOP
                                NOOP
                                NOOP

                                NOOP      # T5RUPT
                                NOOP
                                NOOP
                                NOOP

                                NOOP      # T3RUPT
                                NOOP
                                NOOP
                                NOOP

                                RESUME    # T4RUPT
                                NOOP
                                NOOP
                                NOOP

                                RESUME    # KEYRUPT1
                                NOOP
                                NOOP
                                NOOP

                                RESUME    # KEYRUPT2
                                NOOP
                                NOOP
                                NOOP

                                RESUME    # UPRUPT
                                NOOP
                                NOOP
                                NOOP

                                RESUME    # DOWNRUPT
                                NOOP
                                NOOP
                                NOOP

                                RESUME    # RADAR RUPT
                                NOOP
                                NOOP
                                NOOP

                                RESUME    # RUPT10
                                NOOP
                                NOOP
                                NOOP


STARTUP                         NOOP                                    # RESET ALL VARIABLES aND STATES
                                CA              ZERO
                                TS              CURRV
                                TS              PASTV
                                TS              PASTN

                                TS              INPUTG
                                TS              INPUTM
                                TS              1/INPRA
                                TS              1/INPRB
                                TS              1/INPATX
                                TS              OUTPDVA
                                TS              OUTPDVB

IDLE                            CA              ZERO
                                EXTEND
                                WRITE           CHANLAMP
                                EXTEND
                                WRITE           CHANREG1
                                EXTEND
                                WRITE           CHANREG2
                                EXTEND
                                WRITE           CHANREG3

READV
                                EXTEND
                                READ            CHANVERB
                                TS              CURRV
                                EXTEND
                                SU              PASTV                   # DETECT CHANGE IN VERB
                                EXTEND
                                BZF             READV                   # KEEP WAITING IF NO CHANGE
                                CA              CURRV
                                TS              PASTV
                                EXTEND
                                SU              VPRCHNG                 # CHECK IF VERB == PROGRAM CHANGE (39)
                                EXTEND
                                BZF             PRCHNG
                                CA              CURRV
                                EXTEND
                                SU              VIDLE                   # IDLE
                                EXTEND
                                BZF             IDLE
OPERR                           CA              LAMPOPERR               # OPERATOR ERROR: INVALID VERB
                                EXTEND
                                WRITE           CHANLAMP
                                TCF             READV

PRCHNG
                                EXTEND
                                READ            CHANNOUN
                                INDEX           A
                                TCF             PRJMPTAB

PRJMPTAB                        TCF             PRESCPV
                                TCF             PRHTRNSFR
                                TCF             PRLINJECT
                                TCF             PRMTME
                                TCF             PRPHASE

PRMTME                          CA              NUMSPECM
                                EXTEND
                                WRITE           CHANREG1
                                EXTEND
                                WRITE           CHANREG2
                                EXTEND
                                WRITE           CHANREG3
                                TCF             READV

PRESCPV
                                EXTEND
                                READ            CHANG
                                TS              INPUTG
                                EXTEND
                                READ            CHANM
                                TS              INPUTM
                                EXTEND
                                READ            CHANRA
                                TS              1/INPRA

                                CA              INPUTG
                                EXTEND
                                MP              INPUTM
                                EXTEND
                                MP              1/INPRA                 # INVERSE OF R_A FOR NORMALIZATION
                                # EXTEND
                                # MP              TWO
                                # CA              L
                                DOUBLE

                                TC              SPSQRT
                                CA              ROOTRET

                                EXTEND
                                WRITE           CHANOUTDVA
                                EXTEND
                                WRITE           CHANREG1
                                CA              ZERO
                                EXTEND
                                WRITE           CHANOUTDVB
                                EXTEND
                                WRITE           CHANREG2
                                EXTEND
                                WRITE           CHANREG3
                                TCF             READV

PRLINJECT                       NOOP
PRHTRNSFR
                                EXTEND
                                READ            CHANG
                                TS              INPUTG
                                EXTEND
                                READ            CHANM
                                TS              INPUTM
                                EXTEND
                                READ            CHANRA
                                TS              1/INPRA
                                EXTEND
                                READ            CHANRB
                                TS              1/INPRB
                                EXTEND
                                READ            CHANATX
                                TS              1/INPATX

                                CA              INPUTG                  # CALCULATE INITIAL VELOCITY AT A
                                EXTEND
                                MP              INPUTM
                                EXTEND
                                MP              1/INPRA                 # INVERSE OF R_A FOR NORMALIZATION
                                TC              SPSQRT
                                CA              ROOTRET
                                EXTEND
                                WRITE           CHANOUTDVA
                                TS              OUTPDVA

                                CA              INPUTG                  # CALCULATE INITIAL VELOCITY AT B
                                EXTEND
                                MP              INPUTM
                                EXTEND
                                MP              1/INPRB                 # INVERSE OF R_A FOR NORMALIZATION
                                TC              SPSQRT
                                CA              ROOTRET
                                EXTEND
                                WRITE           CHANOUTDVB
                                TS              OUTPDVB

                                CA              1/INPRA                 # CALCULATE VELOCITY AT TRANSFER ORBIT A
                                DOUBLE
                                EXTEND
                                SU              1/INPATX
                                EXTEND
                                MP              INPUTG
                                EXTEND
                                MP              INPUTM
                                TC              SPSQRT
                                CA              ROOTRET
                                EXTEND
                                WRITE           CHANDVATX
                                TS              OUTPDVATX

                                CA              1/INPRB                 # CALCULATE VELOCITY AT TRANSFER ORBIT A
                                DOUBLE
                                EXTEND
                                SU              1/INPATX
                                EXTEND
                                MP              INPUTG
                                EXTEND
                                MP              INPUTM
                                TC              SPSQRT
                                CA              ROOTRET
                                EXTEND
                                WRITE           CHANDVBTX
                                TS              OUTPDVBTX

                                CA              OUTPDVA                 # CALCULATE DELTA V FOR POINT A
                                EXTEND
                                SU              OUTPDVATX
                                EXTEND
                                WRITE           CHANREG1
                                CA              OUTPDVB                 # CALCULATE DELTA V FOR POINT B
                                EXTEND
                                SU              OUTPDVBTX
                                EXTEND
                                WRITE           CHANREG2
                                CA              ZERO
                                EXTEND
                                WRITE           CHANREG3

                                TCF             READV

PRPHASE
                                EXTEND
                                READ            CHANRA
                                TS              1/INPRA
                                EXTEND
                                READ            CHANRB
                                TS              1/INPRB

                                CA              1/INPRA
                                # TC              SPSIN
                                EXTEND
                                MP              1/INPRB
                                DOUBLE
                                EXTEND
                                WRITE           CHANOUTDVA
                                EXTEND
                                WRITE           CHANREG1
                                CA              ZERO
                                EXTEND
                                WRITE           CHANREG2
                                EXTEND
                                WRITE           CHANREG3

                                TC              READV

## SINGLE PRECISION SINE IMPLEMENTATION (ITERATIVE) - COMANCHE 055
CALCSIN                         CA              QUARTER
                                TC              SPSIN

LOOP                            NOOP
                                EXTEND
                                DCA             50
                                TCF             LOOP

SPCOS                           AD              HALF                    # ARGUMENTS SCALED AT PI
SPSIN                           TS              TEMK
                                TCF             SPT
                                CS              TEMK
SPT                             DOUBLE
                                TS              TEMK
                                TCF             POLLEY
                                XCH             TEMK
                                INDEX           TEMK
                                AD              LIMITS
                                COM
                                AD              TEMK
                                TS              TEMK
                                TCF             POLLEY
                                TCF             ARG90
POLLEY                          EXTEND
                                MP              TEMK
                                TS              SQ
                                EXTEND
                                MP              C5/2
                                AD              C3/2
                                EXTEND
                                MP              SQ
                                AD              C1/2
                                EXTEND
                                MP              TEMK
                                DDOUBL
                                TS              TEMK
                                TC              Q
ARG90                           INDEX           A
                                CS              LIMITS
                                TC              Q                       # RESULT SCALED AT 1

## SINGLE PRECISION SQUARE ROOT IMPLEMENTATION (ITERATIVE)
SPSQRT                          TS              SQRARG
                                EXTEND
                                BZMF            INVALZERO               # INVALID FOR NEGATIVES
                                CA              ZERO                    # RESET ALL VARIABLES AND STATES
                                TS              SQRCNT
                                TS              ROOTRET
                                CA              FIFTEEN
                                TS              SQRMAX
SQRTLOOP                        CA              SQRCNT                  # FOR LOOP CNT = 0:15
                                EXTEND
                                SU              SQRMAX
                                EXTEND
                                BZF             SQRTRET
                                CA              ROOTRET
                                INDEX           SQRCNT
                                AD              BIT14
                                EXTEND
                                SQUARE
                                EXTEND
                                SU              SQRARG
                                COM
                                EXTEND
                                BZF             SQRTADD
                                EXTEND
                                BZMF            SQRTNEG
SQRTADD                         INDEX           SQRCNT
                                CA              BIT14                   # START FROM 1
                                AD              ROOTRET
                                TS              ROOTRET
SQRTNEG                         CA              ONE
                                AD              SQRCNT
                                TS              SQRCNT
                                TCF             SQRTLOOP
INVALZERO                       CA              ZERO
                                TS              ROOTRET
SQRTRET                         TC              Q

## CONSTANTS
C1/2                            DEC             .7853134
C3/2                            DEC             -.3216146
C5/2                            DEC             .0363551

POSMAX                          OCT             37777
LIMITS                          EQUALS          POSMAX          +1
NEG1/2                          OCT             -20000                  # MUST BE TWO LOCATIONS AHEAD OF POS1/2.

BIT15                           OCT             40000                   # BIT TABLE FOLLOWS.
BIT14                           OCT             20000
BIT13                           OCT             10000
BIT12                           OCT             04000
BIT11                           OCT             02000
BIT10                           OCT             01000
BIT9                            OCT             00400
BIT8                            OCT             00200
BIT7                            OCT             00100
BIT6                            OCT             00040
BIT5                            OCT             00020
BIT4                            OCT             00010
BIT3                            OCT             00004
BIT2                            OCT             00002
BIT1                            OCT             00001

NEGMAX                          EQUALS          BIT15
HALF                            EQUALS          BIT14
POS1/2                          EQUALS          HALF
QUARTER                         EQUALS          BIT13
2K                              EQUALS          BIT11
FIFTEEN                         DEC             15
ELEVEN                          DEC             11
NOUTCON                         =               ELEVEN
TEN                             DEC             10
NINE                            DEC             9
EIGHT                           EQUALS          BIT4
SEVEN                           OCT             7
SIX                             OCT             6
FIVE                            OCT             5
FOUR                            EQUALS          BIT3
THREE                           OCT             3
TWO                             EQUALS          BIT2
ONE                             EQUALS          BIT1
ZERO                            OCT             0
NEG0                            OCT             77777
NEGONE                          DEC             -1

NEG1                            =               NEGONE
MINUS1                          EQUALS          NEG1
NEG2                            OCT             77775
NEG3                            DEC             -3
LOW9                            OCT             777
LOW4                            OCT             17

## Page 77
LOW3                            EQUALS          SEVEN
LOW2                            EQUALS          THREE

CALLCODE                        OCT             00030
DLOADCOD                        OCT             40014
VLOADCOD                        EQUALS          BIT15
DLOAD*                          OCT             40015
VLOAD*                          EQUALS          40001
BIT13-14                        OCTAL           30000

