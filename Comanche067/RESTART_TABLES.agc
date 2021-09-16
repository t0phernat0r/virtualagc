### FILE="Main.annotation"
## Copyright:	Public domain.
## Filename:	RESTART_TABLES.agc
## Purpose:	Part of the source code for Comanche 67 (Colossus 2C),
##		the one-and-only software release for the Apollo Guidance 
##		Computer (AGC) of Apollo 12's command module.  In the 
##		absence of a contemporary assembly listing for Comanche 67, 
##		the intention is to reconstruct the source code from a 
##		Comanche 55 (Colossus 2A, Apollo 11 CM) baseline and 
##		contemporary documentation describing the differences 
##		between the two.  Page numbers listed in the program 
##		comments follow Comanche 55 unless otherwise noted.
## Assembler:	yaYUL
## Contact:	Ron Burkey <info@sandroid.org>.
## Website:	www.ibiblio.org/apollo.
## Mod history: 2020-12-25 RSB	Began adaptation from Comanche 55 baseline.
##		2021-08-28 RSB	Changes related to known partial octal listing of Comanche 67.

## Page 211
# RESTART TABLES
# ------------------
#
# THERE ARE TWO FORMS OF RESTART TABLES FOR EACH GROUP.  THEY ARE KNOWN AS THE EVEN RESTART TABLES AND THE ODD
# RESTART TABLES.  THE ODD TABLES HAVE ONLY ONE ENTRY OF THREE LOCATIONS WHILE THE EVEN TABLES HAVE TWO ENTRIES
# EACH USING THREE LOCATIONS.  THE INFORMATION AS TO WHETHER IT IS A JOB, WAITLIST, OR A LONGCALL IS GIVEN BY THE
# WAY THINGS ARE PUT IN TO THE TABLES.
#
# A JOB HAS ITS PRIORITY STORED IN PRDTTAB OF THE CORRECT PHASE SPOT - A POSITIVE PRIORITY INDICATES A
# FINDVAC JOB, A NEGATIVE PRIORITY A NOVAC.  THE 2CADR OF THE JOB IS STORED IN THE CADRTAB.
# FOR EXAMPLE,
#
#		5.7SPOT		OCT	23000
#				2CADR	SOMEJOB
#
# A RESTART OF GROUP 5 WITH PHASE SEVEN WOULD THEN CAUSE SOMEJOB TO BE RESTARTED AS A FINDVAC WITH PRIORITY 23.
#
#		5.5SPOT		OCT	-23000
#				2CADR	ANYJOB
#
# HERE A RESTART OF GROUP 5 WITH PHASE 7 WOULD CAUSE ANYJOB TO BE RESTARTED AS A NOVAC WITH PRIORITY 23.
# A LONGCALL HAS ITS GENADR OF ITS 2CADR STORED NEGATIVELY AND ITS BBCON STORED POSITIVELY.  IN ITS PRDTTAB IS
# PLACED THE LOCATION OF A DP REGISTER THAT CONTAINS THE DELTA TIME THAT LONGCALL HAD BEEN ORIGINALLY STARTED
# WITH.  EXAMPLE,
#
#		3.6SPOT		GENADR	DELTAT
#				-GENADR	LONGTASK
#				BBCON	LONGTASK

#				OCT	31000
#				2CADR	JOBAGAIN
#
# THIS WOULD START UP LONGTASK AT THE APPROPRIATE TIME, OR IMMEDIATELY IF THE TIME HAD ALREADY PASSED.  IT SHOULD
# BE NOTED THAT IF DELTAT IS IN A SWITCHED E BANK, THIS INFORMATOIN SHOULD BE IN THE BBCON OF THE 2CADR OF THE
# TASK.  FROM ABOVE, WE SEE THAT THE SECOND PART OF THIS PHASE WOULD BE STARTED AS A JOB WITH A PRIORITY OF 31.
#
# WAITLIST CALLS ARE IDENTIFIED BY THE FACT THAT THEIR 2CADR IS STORED NEGATIVELY.  IF PRDTTAB OF THE PHASE SPOT
# IS POSITIVE, THEN IT CONTAINS THE DELTA TIME, IF PRDTTAB IS NEGATIVE THEN IT IS THE -GENADR OF AN ERASABLE
# LOCATION CONTAINING THE DELTA TIME, THAT IS, THE TIME IS STORED INDIRECTLY. IT SHOULD BE NOTED AS ABOVE, THAT
# IF THE TIME IS STORED INDIRECTLY, THE BBCON MUST CONTAIN THE NECESSARY E BANK INFORMATION IF APPLICABLE.  WITH
# WAITLIST WE HAVE ONE FURTHER OPTION, IF -0 IS STORED IN PRDTTAB, IT WILL CAUSE AN IMMEDIATE RESTART OF THE
# TASK.  EXAMPLES,
#
#				OCT	77777		THIS WILL CAUSE AN IMMEDIATE RESTART
#				-2CADR	ATASK		OF THE TASK :ATASK:
#
#				DEC	200		IF THE TIME OF THE 2 SECONDS SINCE DUMMY
#				-2CADR	DUMMY		WAS PUT ON WAITLIST IS UP, IT WILL BEGIN
#							IN 10 MS, OTHERWISE IT WILL BEGIN WHEN
#							IT NORMALLY WOULD HAVE BEGUN.
## Page 212
#				-GENADR	DTIME		WHERE DTIME CONTAINS THE DELTA TIME
#				-2CADR	TASKTASK	OTHERWISE THIS IS AS ABOVE
#
# ***** NOW THE TABLES THEMSELVES *****

		BANK	01
		SETLOC	RESTART
		BANK

		COUNT	01/RSTAB

PRDTTAB		EQUALS	12000			# USED TO FIND THE PRIORITY OR DELTATIME
CADRTAB		EQUALS	12001			# THIS AND THE NEXT RELATIVE LOC CONTAIN
						# RESTART 2CADR

SIZETAB		TC	1.2SPOT -12006
		TC	1.3SPOT -12004
		TC	2.2SPOT -12006
		TC	2.3SPOT	-12004
		TC	3.2SPOT -12006
		TC	3.3SPOT -12004
		TC	4.2SPOT -12006
		TC	4.3SPOT -12004
		TC	5.2SPOT -12006
		TC	5.3SPOT -12004
		TC	6.2SPOT -12006
		TC	6.3SPOT -12004
1.2SPOT		EQUALS	3.2SPOT

# ANY MORE GROUP 1.EVEN RESTART VALUES SHOULD GO HERE

1.3SPOT		DEC	120			# THIS NUMBER MUST EQUAL C(JTAGTIME)
		EBANK=	AOG
		-2CADR	SETJTAG

1.5SPOT		OCT	10000
		EBANK=	DAPDATR1
		2CADR	REDO40.9

1.7SPOT		OCT	10000
		EBANK=	ESTROKER
		2CADR	RELINUS

1.11SPOT	OCT	10000
		EBANK=	ESTROKER
		2CADR	PIKUP20

# ANY MORE GROUP 1.ODD RESTART VALUES SHOULD GO HERE

2.2SPOT		EQUALS	1.2SPOT

# ANY MORE GROUP 2.EVEN RESTART VALUES SHOULD GO HERE
## Page 213

2.3SPOT		GENADR	600SECS
		-GENADR	STATEINT
		EBANK=	RRECTCSM
		BBCON	STATEINT

2.5SPOT		OCT	05000
		EBANK=	RRECTCSM
		2CADR	STATINT1

2.7SPOT		OCT	10000
		EBANK=	MRKBUF2
		2CADR	R22

2.11SPOT	OCT	14000
		EBANK=	LANDMARK
		2CADR	V94ENTER

2.13SPOT	OCT	10000
		EBANK=	MRKBUF2
		2CADR	REDOR22

# ANY MORE GROUP 2.ODD RESTART VALUES SHOULD GO HERE

3.2SPOT		EQUALS	4.2SPOT

# ANY MORE GROUP 3.EVEN RESTART VALUES SHOULD GO HERE

3.3SPOT		OCT	20000
		EBANK=	TGO
		2CADR	S40.13

3.5SPOT		DEC	0
		DEC	0
		DEC	0

3.7SPOT		OCT	22000
## <b>Reconstruction:</b> This change matches the known partial octal listing of Comanche 67.
		EBANK=	OGC
		2CADR	MATRXJOB

3.11SPOT	OCT	22000
		EBANK=	TEPHEM
		2CADR	REP11

3.13SPOT	OCT	22000
		EBANK=	TEPHEM
		2CADR	REP11A

3.15SPOT	-GENADR	TGO	+1
		EBANK=	TGO
		-2CADR	ENGINOFF

## Page 214
# ANY MORE GROUP 3.ODD RESTART VALUES SHOULD GO HERE

4.2SPOT		OCT	77777
		EBANK=	TIG
		-2CADR	PRECHECK

## <b>Reconstruction:</b> This change matches the known partial octal listing of Comanche 67.
		OCT	47777
		EBANK=	DELVIMU
		2CADR	P47BODY

4.4SPOT		OCT	77777
		EBANK=	TIG
		-2CADR	PRECHECK

		DEC	2996
		EBANK=	DAPDATR1
		-2CADR	TTG/0

4.6SPOT		OCT	77777
		EBANK=	TIG
		-2CADR	PRECHECK

		DEC	2496
		EBANK=	TIG
		-2CADR	TIG-5

# ANY MORE GROUP 4.EVEN RESTART VALUES SHOULD GO HERE

4.3SPOT		DEC	40
		EBANK=	PACTOFF
		-2CADR	DOTVCON

4.5SPOT		DEC	160
		EBANK=	PACTOFF
		-2CADR	DOSTRULL

4.7SPOT		DEC	500
		EBANK=	PACTOFF
		-2CADR	TIG-0

4.11SPOT	DEC	250
		EBANK=	DAPDATR1
		-2CADR	V97E40.6

4.13SPOT	DEC	200
		EBANK=	WHOCARES
		-2CADR	R40ENABL

4.15SPOT	OCT	16000			# PRELAUNCH OPTICAL VERIFICATION
		EBANK=	OGC
## Page 215
		2CADR	COMPVER			# CALLS FOR OPTICS DATA AGAIN (STD LEADIN)

4.17SPOT	OCT	16000			#  PRELAUNCH AZIMUTH CHANGE
		EBANK=	XSM
		2CADR	AZMTHCG1

4.21SPOT	GENADR	P40TMP			# DELTA TIME USED IN SETTING UP
		-GENADR	TIGBLNK			# LONG CALL OF TIGBLNK BY P40,P41
		EBANK=	P40TMP
		BBCON	TIGBLNK

4.23SPOT	OCT	12000			# PROTECT P40S/SV BY P40 P41
		EBANK=	TIG
		2CADR	P40S/SV

4.25SPOT	OCT	24000
		EBANK=	BESTI
		2CADR	PROG52

4.27SPOT	DEC	250
		EBANK=	PACTOFF
		-2CADR	DOTVCRCS

4.31SPOT	OCT	13000
		EBANK=	STAR
		2CADR	R51	+1

4.33SPOT	DEC	2100			# PROTECT CONTINUING JOB TO START P63
		EBANK=	AOG
		-2CADR	WAKEP62

4.35SPOT	OCT	12000
		EBANK=	DAPDATR1
		2CADR	POSTBURN

4.37SPOT	DEC	500
		EBANK=	TIG
		-2CADR	TIGAVEG

4.41SPOT	OCT	17000			# PROTECT DISPLAY JOB IN P67
		EBANK=	AOG
		2CADR	P67.1

4.43SPOT	-GENADR	S61DT			# PROTECT TASK TO START PREREAD,ENTRY
		EBANK=	S61DT			# S61.1C WILL CHANGE EBANK=EB7 FOR PREREAD
		-2CADR	S61.1C

4.45SPOT	OCT	13000			# PROTECT CONTINUING JOB S61.1
		EBANK=	AOG			# (ENTRY IMU ALIGNMENT)
## Page 216
		2CADR	S61.1A	-1

4.47SPOT	OCT	17000			# PROTECT HUNTEST ITERATION.
		EBANK=	AOG
		2CADR	PRE-HUNT

4.51SPOT	OCT	77777			# PROTECT FDAI ATTITUDE
		EBANK=	BODY3			# ERROR DISPLAY IN P11
		-2CADR	ATERTASK

4.53SPOT	DEC	-0
		EBANK=	END-E7			# EBANK7 FOR TIG
		-2CADR	V97ETASK

4.55SPOT	OCT	13000			# PROTECT P65 RESPONSIVE DISPLAY.
		EBANK=	RTINIT
		2CADR	P65.1

4.57SPOT	-GENADR	P40TMP
		EBANK=	P40TMP
		-2CADR	TIGON

4.61SPOT	OCT	77777
		EBANK=	PACTOFF
		-2CADR	IGNITION

4.63SPOT	OCT	77777
		EBANK=	PACTOFF
		-2CADR	DOSPSOFF

4.65SPOT	DEC	10
		EBANK=	TIG
		-2CADR	TIG-5

4.67SPOT	DEC	-0
		EBANK=	CSMMASS
		-2CADR	V97TTASK

4.71SPOT	DEC	250
		EBANK=	DAPDATR1		# (FOR RCSDAPON)
		-2CADR	V97TRCS

4.73SPOT	DEC	-0
		EBANK=	V97VCNTR
		-2CADR	V97PTASK

4.75SPOT	DEC	-0
		EBANK=	DAPDATR1
		-2CADR	SPSOFF97

## Page 217
4.77SPOT	DEC	-0
		EBANK=	PACTOFF
		-2CADR	TIG-0

# ANY MORE GROUP 4.ODD RESTART VALUES SHOULD GO HERE

5.2SPOT		OCT	32000
		EBANK=	DVCNTR
		2CADR	NORMLIZE

		DEC	200
		EBANK=	AOG
		-2CADR	REREADAC

5.4SPOT		OCT	20000
		EBANK=	DVCNTR
		2CADR	SERVICER

		DEC	200
		EBANK=	AOG
		-2CADR	REREADAC

# ANY MORE GROUP 5.EVEN RESTART VALUES SHOULD GO HERE

5.3SPOT		DEC	200
		EBANK=	AOG
		-2CADR	REREADAC

5.5SPOT		OCT	77777
		EBANK=	AOG
		-2CADR	REDO5.5

5.7SPOT		OCT	20000			# USED BY PRELAUNCH
		EBANK=	XSM
		2CADR	RSTGTS1

5.11SPOT	OCT	77777
		EBANK=	XSM
		-2CADR	ALLOOP1

5.13SPOT	OCT	20000
		EBANK=	XSM
		2CADR	WTLISTNT

5.15SPOT	OCT	20000
		EBANK=	XSM
		2CADR	RESTEST1

5.17SPOT	OCT	20000
		EBANK=	XSM
## Page 218
		2CADR	GEOSTRT4

5.21SPOT	OCT	22000
		EBANK=	XSM
		2CADR	ALFLT1

5.23SPOT	OCT	77777
		EBANK=	XSM
		-2CADR	SPECSTS

5.25SPOT	OCT	20000
		EBANK=	XSM
		2CADR	RESTEST3

5.27SPOT	OCT	20000
		EBANK=	XSM
		2CADR	RESTAIER

5.31SPOT	DEC	0
		DEC	0
		DEC	0

5.33SPOT	OCT	20000
		EBANK=	XSM
		2CADR	RESCHNG

5.35SPOT	DEC	0
		2DEC	0

5.37SPOT	OCT	77777
		EBANK=	AOG
		-2CADR	CHEKAVEG

5.41SPOT	OCT	77777			# TO PROTECT PREREAD AT TIG-30A
		EBANK=	DVCNTR			#	TIG-15 T+60
		-2CADR	PREREAD

# ANY MORE GROUP 5.ODD RESTART VALUES SHOULD GO HERE

6.2SPOT		OCT	77777			# USED BY P40 AFTER GIMB DR TST TO REPOS'N
		EBANK=	AK			# ENGINE UNTIL TVCDAPON
		-2CADR	PRE40.6

		DEC	100
		EBANK=	TTOGO
		-2CADR	CLOKTASK

# ANY MORE 6.ODD RESTART VALUES SHOULD GO HERE
## Page 219

6.3SPOT		DEC	100
		EBANK=	TIG
		-2CADR	CLOKTASK

6.5SPOT		OCT	30000			# PROTECT INCREMENTING OF TIME2,TIME1 BY
		EBANK=	TEPHEM			# P27NUPDATE PROGRAM)
		2CADR	TIMEDIDR

6.7SPOT		OCT	0
		OCT	0
		OCT	0

6.11SPOT	-GENADR	CM/GYMDT		# PROTECT TASK TO READ CDUS.
		EBANK=	CM/GYMDT		# FOR ENTRY DAP
		-2CADR	READGYMB

6.13SPOT	DEC	0
		DEC	0
		DEC	0

## Page 220
# PROGRAM DESCRIPTION: NEWPHASE						DATE:  11 NOV 1966
# MOD: 1								ASSEMBLY:  SUNBURST REV
# MOD BY: COPPS								LOG SECTION: PHASE TABLE MAINTENANCE
#
# FUNCTIONAL DESCRIPTION:
#
#	NEWPHASE IS THE QUICK WAY TO MAKE A NON VARIABLE PHASE CHANGE.  IT INCLUDES THE OPTION OF SETTING
#	TBASE OF THE GROUP.  IF TBASE IS TO BE SET, -C(TIME1) IS STORED IN THE TBASE TABLE AS FOLLOWS:
#
#		(L-1)	TBASE0
#		(L)	TBASE1	(IF GROUP=1)
#		(L+1)
#		(L+2)	TBASE2	(IF GROUP=2)
#		-----
#		(L+6)	TBASE4	(IF GROUP=4)
#		(L+7)
#		(L+8)	TBASE5	(IF GROUP=5)
#
#	IN ANY CASE, THE NEGATIVE OF THE PHASE, FOLLOWED (IN THE NEXT REGISTER) BY THE PHASE, IS STORED IN THE
#	PHASE TABLE AS FOLLOWS:
#
#		(L)	-PHASE1	(IF GROUP=1)
#		(L+1)	PHASE1
#		(L+2)	-PHASE2	(IF GROUP=2)
#		(L+3)	PHASE2
#		-----
#		(L+7)	PHASE4
#		(L+8)	-PHASE5	(IF GROUP=5)
#		(L+9)	PHASE5
#
# CALLING SEQUENCE:
#
#	EXAMPLE IS FOR PLACING A PHASE OF FIVE INTO GROUP THREE:
#
#	1)	IF TBASE IS NOT TO BE SET:
#			L-1	CA	FIVE
#			L	TC	NEWPHASE
#			L+1	OCT	00003
#
#	2)	IF TBASE IS TO BE SET:
#			L-1	CS	FIVE
#			L	TC	NEWPHASE
#			L+1	OCT	00003
#
# SUBROUTINES CALLED:  NONE
#
# NORMAL EXIT MODE:  AT L+2 OF CALLING SEQUENCE
#
# ALARM OR ABORT EXITS:  NONE
#
# OUTPUT:  PHASE TABLE AND TBASE TABLE UPDATED
#
# ERASABLE INITIALIZATION REQ,D:  NONE
## Page 221
# DEBRIS:  A,L,TEMPG

# *** WARNING *** THIS PROGRAM IS TO BE PLACED IN FIXED-FIXED AND UNSWITCHED ERASABLE.

		BLOCK	02
		SETLOC	FFTAG1
		BANK

		COUNT*	$$/PHASE

NEWPHASE	INHINT

		TS	L			# SAVE FOR FURTHER USE

		NDX	Q			# OBTAIN THE GROUP NUMBER
		CA	0
		INCR	Q			# OBTAIN THE RETURN ADDRESS
		DOUBLE				# SAVE THE GROUP IN A FORM USED FOR
		TS	TEMPG			# INDEXING

		CCS	L			# SEE IF WE ARE TO SET TBASE
		TCF	+7			# NO, THE DELTA T WAS POSITIVE
		TCF	+6

NUFAZ+10	INCR	A			# SET TBASE AND STORE PHASE CORRECTLY
		TS	L

		CS	TIME1			# SET TBASE
		NDX	TEMPG
		TS	TBASE1 -2

		CS	L			# NOW PUT THE PHASE IN THE RIGHT TABLE LOC
		NDX	TEMPG
		DXCH	-PHASE1	-2

		RELINT
		TC	Q			# NOW RETURN TO CALLER


