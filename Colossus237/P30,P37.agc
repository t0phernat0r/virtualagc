### FILE="Main.annotation"
## Copyright:   Public domain.
## Filename:	P30,P37.agc
## Purpose:     Part of the source code for Colossus build 237.
##              This is for the Command Module's (CM) Apollo Guidance
##              Computer (AGC), for Apollo 8.
## Assembler:   yaYUL
## Contact:     Jim Lawton <jim DOT lawton AT gmail DOT com>
## Website:     www.ibiblio.org/apollo/index.html
## Page Scans:  www.ibiblio.org/apollo/ScansForConversion/Colossus237/
## Mod history: 2011-02-19 JL	Adapted from corresponding Colossus 249 file.
##		2011-04-29 JL	Added missing line at the bottom of page 632.
##		2016-12-31 RSB	Proofed comment text using octopus/ProoferComments,
##				and corrected errors found.

## Page 624
		BANK	32

		SETLOC	P30S1
		BANK

		EBANK=	+MGA

		COUNT	35/P34

DISPMGA		STQ	EXIT		# USED IN P30

			RGEXIT
		TC	COMPTGO

DISP45		CAF	V16N45
		TC	BANKCALL
		CADR	GOFLASHR
		TC	GOTOPOOH
		TC	END45
		TC	DISP45
P30PHSI		TC	PHASCHNG
		OCT	14
		TCR	ENDOFJOB
END45		TC	INTPRET
		CLEAR	GOTO
			TIMRFLAG
			RGEXIT

COMPTGO		EXTEND			# USED TO COMPUTE TTOGO
		QXCH	PHSPRDT6	# ** GROUP 6 TEMPORARY USED ,, BEWARE **

		TC	UPFLAG		# SET TIMRFLAG
		ADRES	TIMRFLAG	# BIT 11 FLAG 7
		CAF	ZERO
		TS	NVWORD1

		INHINT
		CAF	ONE
		TC	WAITLIST
		EBANK=	TIG
		2CADR	CLOKTASK

		TC	2PHSCHNG
		OCT	40036		# 6.3SPOT FOR CLOKTASK
		OCT	05024		# GROUP 4 CONTINUES HERE
		OCT	13000

		TC	PHSPRDT6

## Page 625
# PROGRAM DESCRIPTION  P30    DATE 3-6-67

# MOD.I BY S. ZELDIN- TO ADD P31 AND AD APT P30 FOR P31 USE.    22DEC67
# FUNCTIONAL DESCRIPTION
# +30(EXTERNAL DELTA-V TARGETTING PROGRAM)
#     ACCEPTS ASTRONAUT INPUTS OF TIG,DELV(LV) AND COMPUTES,FOR DISPLAY,
#     APOGEE,PERIGEE,DELV(MAG),MGA ASSOCIATED WITH DESIRED MANEUVER

# P31 (GENERAL LAMBERT AIMPOINT GUIDANCE)
# A GROUND RULE FOR P31 IS THE ANGLE BETWEEN THE TARGET VECTOR AND
# POSITION VECTOR AT TIG IS NOT 165-195 DEGREES APART
#     BASED ON STORED INPUT OF OFFSET TARGET(B+29) AND DELTA T TRANS,AND
#     ASTRONAUT ENTRY OF TIG,P31 COMPUTES REQUIRED VELOCITY FOR MANEUVER
#     AND,FOR DISPLAY,APOGEE,PERIGEE,DELV(7AG),+MGA ASSOCIATED WITH
#     DESIRED MANEUVER

#     THE FOLLOWING SUBROUTINES ARE USED IN P30 AND P31
#        S30.1 (P30 ONLY)
#        S31.1 (P31 ONLY)
#        P30/P31 - DISPLAYS TIG
#        CNTUP30 - DISPLAYS DELV(LV)
#        PARAM30 - DISPLAYS APOGEE,PERIGEE,DELV(MAG),MGA,TIME FROM TIG,
#                  MARKS SINCE LAST THRUSTING MANEUVER

# CALLING SEQUENCE VIA JOB FROM V37

# EXIT VIA V37 CALL OR GOTOPOOH

# OUTPUT FOR POWERED FLIGHT
#          VTIG   X
#          RTIG    XSEE S30.1
#          DELVSIN X
#          VGDISP
#          RTARG  X
#          TPASS4  X SEE S31.1
#                 X


		COUNT	35/P30

P30		TC	P30/P31
		TC	CNTNUP30
		TC	DOWNFLAG	# RESET UPDATFLG
		ADRES	UPDATFLG	# BIT 7  FLAG 1
		TC	INTPRET
		CALL	
			S30.1
		EXIT
		TC	PARAM30
		TC	UPFLAG
## Page 626
		ADRES	XDELVFLG	# SET XDELVFLG    BIT 8  FLAG 2
		TCF	GOTOPOOH

P31		TC	P30/P31
		TC	DOWNFLAG
		ADRES	UPDATFLG	# RESET UPDATFLG  BIT 7 FLAG 1
		TC	DOWNFLAG
		ADRES	NORMSW		# RESET NORMSW       BIT 10  FLAG 7
		TC	INTPRET
		CALL
			S31.1
		EXIT
		TC	CNTNUP30
		TC	PARAM30
		TC	DOWNFLAG
		ADRES	XDELVFLG	# BIT 8  FLAG 2
		TCF	GOTOPOOH

P30/P31		XCH	Q
		TS	P30/31RT
		TC	UPFLAG
		ADRES	UPDATFLG	# SET UPDATFLG  BIT 7  FLAG 1
		TC	UPFLAG
		ADRES	TRACKFLG	# SET TRACKFLG  BIT 5  FLAG 1
		CAF	V06N33		# T OF IGN
		TC	BANKCALL
		CADR	GOFLASHR
		TCF	GOTOPOOH
		TC	P30/31RT
		TCF	P30/P31 +4
		TC	PHASCHNG
		OCT	00014
		TC	ENDOFJOB


CNTNUP30	XCH	Q
		TS	P30/RET
		CAF	V06N81
		TC	BANKCALL
		CADR	GOFLASH
		TCF	GOTOPOOH
		TC	 P30/RET
		TCF	CNTNUP30 +2
PARAM30		XCH	Q
		TS	P30/31RT
		CAF	V06N42
		TC	BANKCALL
		CADR	GOFLASH
		TC	GOTOPOOH	# ON TERMINATION GOTOPOOH
		TCF	REFTEST		# ON PROCEED GO DO REFTEST
## Page 627
		TCF	PARAM30 +2
REFTEST		CAF	BIT13
		MASK	STATE +3	# REFSMFLAG
		EXTEND
		BZF	NOTSET		# REFSMFLAG =0 , THEN BRANCH TO NOTSET
		TC	INTPRET
		VLOAD	PUSH
			DELVSIN
		CALL
			GET+MGA
		GOTO
			FLASHMGA
NOTSET		EXTEND
		DCS	MARSDP
		DXCH	+MGA		# +MGA, +MGA+1  CONTAINS (-00001)
		TC	INTPRET
FLASHMGA	CALL
			DISPMGA
		EXIT
		TC	P30/31RT
MARSDP		OCT	00000		# (00000) (16440)  = (+00001)
		OCT	35100
#					  ( .01 ) DEGREES IN THE LOW ORDER REGISTE
V06N33		VN	0633
V06N42		VN	0642
V16N35		VN	1635
V06N45		VN	0645

## Page 628
# PROGRAM DESCRIPTION S30.1       DATE 9NOV66

# MOD NO 1        LOG SECTION  P30,P37
# MOD  BY  RAMA AIYAWAR **
# MOD.2 BY S.ZELDIN - TO CORRECT MOD.1 FOR COLOSSUS         29DEC67
# FUNCTIONAL DESCRIPTION
#          BASED ON STORED TARGET PARAMETERS(R OF IGNITION(RTIG),V OF
# IGNITION(VTIG),TIME OF IGNITION(TIG),DELV(LV),COMPUTE PERIGEE ALTITUDE
# A+OGEE ALTITUDE AND DELTA-V REQUIRED IN REF. COORDS.(DELVSIN)
# CALLING SEQUENCE
#    L     CALL
#    L+1          S30.1
# NORMAL EXIT MODE
#     AT L+2 OR CALLING SEQUENCE (GOTO L+2)
# SUBROUTINES CALLED
#          THISPREC
#          PERIAPO
# ALARM OR ABORT EXIT MODES
#                 NONE
# ERASABLE INITIALIZATION REQUIRED
#          TIG       TIME OF IGNITION                   DP     B28CS
#          DELVSLV   SPECIFIED DELTA-V IN LOCAL VERT.
#                    COORDS. OF ACTIVE VEHICLE AT
#          TIME OF IGNITION                         VCT.    B+7M/CS
# OUTPUT
#          RTIG         POSITION AT TIG             VCT.    B+29M
#          VTIG         VELOCITY AT TIG             VCT.    B+7M
#          HAPO         APOGEE ALT.                 DP      B+29M
#          HPER         PERIGEE ALT.                DP      B+29M
#          DELVSIN      DELVSLV IN REF COORDS       VCT.    B+7M/CS
#          VGDISP       MAG. OF DELVSIN             DP      B+7M/CS
# DEBRIS QTEMP    TEMP. ERASABLE
#        QPRET,MPAC
#        PUSHLIST

		SETLOC	P30S1A
		BANK

		COUNT	35/S30S

S30.1		STQ	DLOAD
			QTEMP
			TIG		# TIME IGNITION SCALED AT 2(+28)CS
		STCALL	TDEC1
			THISPREC	# ENCKE ROUTINE FOR 

		VLOAD	SXA,2
			VATT
			RTX2
		STOVL	VTIG
## Page 629
			RATT
		STORE	RTIG
		STORE	RACT3
		VXV	UNIT
			VTIG
		STCALL	UNRM
			LOMAT
		VLOAD	VXM
			DELVSLV
			0
		VSL1	SXA,1
			RTX1
		STORE	DELVSIN
		ABVAL
		STOVL	VGDISP		# MAG DELV
			RTIG
		PDVL	VAD
			DELVSIN	
			VTIG
		CALL
			PERIAPO1
		CALL
			SHIFTR1	
		CALL			
			MAXCHK
		STODL	HPER		# PERIGEE ALT B+29
			4D
		CALL
			SHIFTR1	
		CALL		
			MAXCHK
		STCALL	HAPO		# APOGEE ALT B+29
			QTEMP

## Page 630
# S31.1  PROGRAM DESCRIPTION                   26DEC67
# MOD.1 BY S.ZELDIN

# S31.1 COMPUTES DELV IN REF AND LV COORDS,MAG OF DELV,INTERCEPT TIME,
# APOGEE AND PERIGEE ALT FOR REQUIRED MANEUVER

# CALLING SEQUENCE
#         L      CALL
#       L +1          S31.1

# NORMAL EXIT MODE
#         AT L +2 OF CALLING SEQUENCE(GOTO L+2)
# SUBROUTINES CALLED
#          AGAIN
#          PERIAPO1
#          SHIFTR1
#          MIDGIM
# NO ALARM OR ABORT MODES
# INPUT
#          DELLT4          DP  +28
#          TIG            DP  +28
#          RTARG           VCT +29
# OUTPUT
#          DELVLVC         VCT +7
#          VGDISP          DP  +7
#          HAPO            DP  +29
#          HPER            DP  +29
#          TPASS4          DP  +28
# DEBRIS  - QTEMP
S31.1		STQ	DLOAD
			QTEMP
			TIG
		STCALL	TDEC1	
			AGAIN		# RETURNS RTX2,RTX1,RATT,VATT,VIPRIME
		VLOAD	PDVL		# DELUEET3
			RTIG
			VIPRIME
		CALL
			PERIAPO1
		CALL
			SHIFTR1
		CALL
			MAXCHK
		STODL	HPER		# B29
			4D
		CALL
			SHIFTR1
		CALL
			MAXCHK	
		STOVL	HAPO		# B29
## Page 631
			DELVEET3
		STORE	0
		SET	CALL
			AVFLAG
			MIDGIM		# GET DELVLVC B7 FORDISPLAY
		ABVAL
		STODL	VGDISP		# B+7 FOR DISPLAY
			DELLT4
		DAD
			TIG
		STCALL	TPASS4		# FOR S40.1
			QTEMP

## Page 632
# SUBROUTINE NAME:      DELRSPL                                           (CONTINUATION OF V 62 IN CSM IF P11 ACTI
# TRANSFERRED COMPLETELY FROM SUNDISK, P30S REV 33. 9 SEPT 67.
# MOD NO:  0           MOD BY:  ZELDIN               DATE:
# MOD NO:  1           MOD BY:  RR BAIRNSFATHER      DATE:  11 APR 67
# MOD NO:  2           MOD BY:  RR BAIRNSFATHER      DATE:  12 MAY 67     ADD UR.RT CALC WHEN BELOW 300K FT
# MOD NO:  2.1         MOD BY:  RR BAIRNSFATHER      DATE: 5 JULY 67      FIX ERROR IN MOD. 2.
# MOD NO:  3           MOD BY:  RR BAIRNSFATHER      DATE:  12 JUL 67     CHANGE SIGN OF DISPLAYED ERROR.
# MOD 4                MOD BY   S.ZELDIN             DATE  3 APRIL 68	  CHANGE EQUATIONS FOR L/D=.18 WHICH REPLA
# FUNCTION:            CALCULATE (FOR DISPLAY ON CALL) AN APPROXIMATE     MEASURE OF IN-PLANE SPLASH DOWN
#                      ERROR. IF THE FREE-FALL TRANSFER ANGLE TO 300K FT  ABOVE PAD RADIUS IS POSITIVE:
#                      SPLASH ERROR= -RANGE TO TARGET + FREE-FALL TRANSFER ANGLE + ESTIMATED ENTRY ANGLE.
#                      THE TARGET LOCATION AT ESTIMATED TIME OF IMPACT IS USED.  IF THE FREE-FALL TRANSFER
#                      ANGLE IS NEGATIVE:  SPLASH ERROR= -RANGE TO TARGET
#                      THE PRESENT TARGET LOCATION IS USED.
# CALLING SEQUENCE     CALLED AFTER SR30.1 IF IN CSM AND IF P11 OPERATING (UNDER CONTROL OF V82)
# SUBROUTINES CALLED:  VGAMCALC, TFF/TRIG, LALOTORV.
# EXIT                 RETURN DIRECTLY TO V 82 PROG. AT SPLRET
# ERASABLE INITIALIZATION   LEFT BY SR30.1 AND V82GON1
# OUTPUT:  RSP-RREC  RANGE IN REVOLUTIONS                                 DSKY DISPLAY IN N. MI.
# DEBRIS:  QPRET, PDL0 ...PDL7 ,PDL10

# THETA(1)
#

		BANK	32
		SETLOC	DELRSPL1
		BANK
		COUNT*	$$/P30		# PROGRAMS: P30 EXTERNAL DELTA V

DELRSPL		STORE	8D
		BPL	DSU
			CANTDO		# GONE PAST 300K FT ALT
			1BITDP
		BOV	CALL
			CANTDO		# POSMAX INDICATES NO 300K FT SOLUTION.
			VGAMCALC	# +GAMMA(REV) IN PMAC,V300 MAG(B-7)=PDL 0
		PUSH	CALL
			TFF/TRIG
		CALL
			AUGEKUGL
		PDDL	ACOS		# T ENTRY PDL 6
			CDELF/2
		DAD
			4
GETARG		STOVL	THETA(1)
			LAT(SPL)
		STODL	LAT
			HI6ZEROS
		STODL	ALT		# ALT=0  = LAT +4
		DSU	DAD
## Page 633
			8D
			PIPTIME
		CLEAR	CALL
			ERADFLAG
			LALOTORV	# R RECOV. IN ALPHAV AND MPAC

		UNIT	PDVL
			RONE
		UNIT	DOT
		SL1	ARCCOS
		BDSU			# ERROR = THETA EST - THETA TARG
#			       NEGATIVE NUMBER SIGNIFIES THAT WILL FALL SHORT.
#			       POSITIVE NUMBER SIGNIFIES THAT WILL OVERSHOOT.
			THETA(1)
DELRDONE	STCALL	RSP-RREC	# DOWNRANGE RECOVERY RANGE ERROR    /360
			INTWAKE0
		CALL
			SPLRET
CANTDO		DLOAD	PDDL		# INITIALIZE ERASE TO DOT TARGET AND UR
#					  FOR RANGE ANGLE.
			HIDPHALF	# TO PDL 0 FOR DEN IN DDV.
			HI6ZEROS
		PUSH			# ZERO TO PDL 2 FOR PHI ENTRY
		STCALL	8D
			GETARG		# GO SET RSP-RREC =0

AUGEKUGL	VLOAD
			X1CON -2
		STODL	X1 -2
			0
		DSU	BMN
			V(21K)
			LOOPSET
		XSU,1	XCHX,2
			S1
			X1
		XCHX,2	DSU
			S1
			V(3K)
		BMN	XCHX,2
			LOOPSET
			S1
		DSU	BMN
			V(4K)
			LOOPSET
		XCHX,2	XCHX,2
			S1
			X1
		DSU	BMN
			V(400)
## Page 634
			LOOPSET
		SXA,1
			S1
LOOPSET		INCR,1	GOTO
		DEC	1
			K1K2LOOP
K2CALC		SXA,1
			S1
K1K2LOOP	DLOAD	DSU*
			0
			V(32K) +1,1
		DMP*	DAD*
			YK1K2 +1,1
			CK1K2 +1,1
		PDDL	TIX,1
			2
			K2CALC
		DSU	BDDV
		BOV	BMN
			MAXPHI
			MAXPHI
PHICALC		PDDL	DSU		# PHI ENTRY PDL 4D
			0
			V(26K)
		BPL	DLOAD
			TGR26
			TLESS26
		DDV
			0
TENT		DMP	RVQ
			4D
TGR26		DLOAD	GOTO
			TGR26CON
			TENT


MAXPHI		DLOAD	GOTO
			MAXPHIC
			PHICALC
MAXPHIC		2DEC	.09259298	# 2000 NM FOR MAXIMUM PHI ENTRY
		COUNT*	$$/P30
		
#					                   BELOW
#					<<<< TABLE IS INDEXED. KEEP IN ORDER >>>

		2DEC	7.07304526 E-4	# 5500
		2DEC	3.08641975 E-4	# 2400
## Page 635
		2DEC	3.08641975 E-4	# 2400
		2DEC	-8.8888888 E-3	# -3.2
		2DEC	2.7777777 E-3	# 1
CK1K2		2DEC	6.6666666 E-3	# 2.4
		2DEC	0		# 0
		2DEC*	-1.86909989 E-5 B7*    # -.443
		2DEC	0
		2DEC*	1.11639691 E-3 B7*     # .001225
		2DEC*	9.56911636 E-4 B7*     # .00105
YK1K2		2DEC*	2.59733157 E-4 B7*     #      .000285
V(400)		2DEC	1.2192 B-7
V(28K)		2DEC	85.344 B-7
V(3K)		2DEC	9.144 B-7
V(24K)		2DEC	73.152 B-7
		2DEC	85.344 B-7
V(32K)		2DEC	97.536 B-7
V(4K)		2DEC	12.192 B-7
V(21K)		2DEC	64.000 B-7
TLESS26		2DEC*	5.70146688 E7 B-35*   # 8660PHI/V
TGR26CON	2DEC	7.2 E5 B-28	# PHI/3
V(26K)		2DEC	79.248 B-7	# 26000
X1CON		DEC	10
		DEC	8
		DEC	6
#					  <<<< TABLE IS INDEXED. KEEP IN ORDER >>>
#					                     ABOVE

## Page 636
# ..... AVFLAGA/P .....

# SUBROUTINES USED

#       UPFLAG
#       DOWNFLAG
		SETLOC	P30S1
		BANK
		EBANK=	SUBEXIT
AVFLAGA		EXTEND			# AVFLAG = CSM
		QXCH	SUBEXIT
		TC	DOWNFLAG
		ADRES	AVFLAG		# BIT 5  FLAG 2
		CAF	EBANK7
		TS	EBANK
		EBANK=	ECSTEER
		CAF	BIT13
		TS	ECSTEER		# SET ECSTEER = 1
		CAF	EBANK4
		TS	EBANK
		EBANK=	SUBEXIT
		TC	SUBEXIT
AVFLAGP		EXTEND			# AVFLAG = LEM
		QXCH	SUBEXIT
		TC	UPFLAG
		ADRES	AVFLAG		# BIT 5  FLAG 2
		TC	SUBEXIT
P20FLGON	EXTEND
		QXCH	SUBEXIT
		TC	UPFLAG
		ADRES	TRACKFLG
		TC	UPFLAG
		ADRES	UPDATFLG
		TC	SUBEXIT
