### FILE="Main.annotation"
## Copyright:   Public domain.
## Filename:    INTERPRETIVE_CONSTANTS.agc
## Purpose:     A section of Luminary revision 98.
##              It is part of the reconstructed source code for the a
##              development version of the flight software for the Lunar 
##              Module's (LM) Apollo Guidance Computer (AGC) for Apollo 11.
##              The code has been recreated from a copy of Luminary 99
##              revision 001, using asterisks indicating changed lines in
##              the listing and Luminary Memo #85, which lists changes between
##              Luminary 98 and 99.
## Reference:   pp. 1100-1101
## Assembler:   yaYUL
## Contact:     Ron Burkey <info@sandroid.org>.
## Website:     www.ibiblio.org/apollo/index.html
## Mod history: 2019-07-28 MAS  Created from Luminary 99.
##              2021-05-30 ABS  DFC-6 -> DEC-6, DFC-12 -> DEC-12

## Page 1100
		SETLOC	INTPRET1
		BANK

		COUNT*	$$/ICONS
DP1/4TH		2DEC	.25

UNITZ		2DEC	0

UNITY		2DEC	0

UNITX		2DEC	.5

ZEROVECS	2DEC	0

		2DEC	0
		
		2DEC	0

DPHALF		=	UNITX
DPPOSMAX	OCT	37777
		OCT	37777

## Page 1101
# INTERPRETIVE CONSTANTS IN THE OTHER HALF-MEMORY

		SETLOC	INTPRET2
		BANK

		COUNT*	$$/ICONS
ZUNIT		2DEC	0

YUNIT		2DEC	0

XUNIT		2DEC	.5

ZEROVEC		2DEC	0

		2DEC	0
		
		2DEC	0
		
		OCT	77777		# -0, -6, -12 MUST REMAIN IN THIS ORDER
DEC-6		DEC	-6
DEC-12		DEC	-12
LODPMAX		2OCT	3777737777	# THESE TWO CONSTANTS MUST REMAIN

LODPMAX1	2OCT	3777737777	# ADJACENT AND THE SAME FOR INTEGRATION

ZERODP		=	ZEROVEC
HALFDP		=	XUNIT


