### FILE="Main.annotation"
## Copyright:    Public domain.
## Filename:     SINGLE_PRECISION_SUBROUTINES.agc
## Purpose:      Part of the source code for Aurora (revision 12).
## Assembler:    yaYUL
## Contact:      Ron Burkey <info@sandroid.org>.
## Website:      https://www.ibiblio.org/apollo.
## Pages:        123-125
## Mod history:  2016-09-20 JL   Created.
##		 2016-12-08 RSB	 Proofed comments with octopus/ProoferComments
##				 but no errors found.

## This source code has been transcribed or otherwise adapted from
## digitized images of a hardcopy from the private collection of
## Don Eyles.  The digitization was performed by archive.org.

## Notations on the hardcopy document read, in part:

##       473423A YUL SYSTEM FOR BLK2: REVISION 12 of PROGRAM AURORA BY DAP GROUP
##       NOV 10, 1966

##       [Note that this is the date the hardcopy was made, not the
##       date of the program revision or the assembly.]

## The scan images (with suitable reduction in storage size and consequent
## reduction in image quality) are available online at
##       https://www.ibiblio.org/apollo.
## The original high-quality digital images are available at archive.org:
##       https://archive.org/details/aurora00dapg

## Page 123
                SETLOC          ENDIBNKF

# SINGLE PRECISION SINE AND COSINE

SPCOS           AD              HALF                    # ARGUMENTS SCALED AT PI
SPSIN           TS              TEMK
                TCF             SPT
                CS              TEMK
SPT             DOUBLE
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
POLLEY          EXTEND
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
ARG90           INDEX           A
                CS              LIMITS
                TC              Q                       # RESULT SCALED AT 1
C1/2            DEC             .7853134
C3/2            DEC             -.3216146
C5/2            DEC             .0363551
## Page 124
# ENTER WITH ARGUMENT IN A, EXIT WITH ROOT IN A.  IF GIVEN A NEGATIVE ARGUMENT, THE RETURN SKIPS WITH CCS RESULT.
# MINUS ZERO RETURNS LIKE PLUS ZERO.
# MAXIMUM ERROR IN ANSWER IS NO GREATER THAN 2 BITS.
# INTERRUPT PROGRAMS USING SPROOT MUST SAVE AND RESTORE SR.



SPROOT          TS              SQRARG                  # ENTER WITH C(A) = Y
                CCS             A
                TCF             POSARG                  # IF PNZ, CONTINUE
                TC              Q                       # RETURN WITH 0 FOR +0
                INCR            Q
                TC              Q                       # RETURN WITH 0 FOR -0

POSARG          EXTEND
                QXCH            ROOTRET                 # WILL BE CALLING SPROOT1
                AD              63/64+1                 # B(A) = Y - 1
                OVSK
                TCF             SPROOT2
                XCH             SQRARG                  # ARG JUGGLING

SPROOT3         TS              SQRARG
                TS              SR                      # C(A) = Y
                XCH             SR                      # (LOSE 1 BIT)
                TS              HALFY                   # HALFY = Y/2
                AD              -1/8                    # FORM Y/2 - 1/8
                CCS             A                       # TEST FOR FIRST GUESS
                AD              5/8+1                   # Y .G. 1/4, X = Y/2 + 1/2
                TC              HIGUESS                 # +0 IMPOSSIBLE FROM ADDITION
                NOOP                                    # Y .LE. 1/4, X/2 = Y + 1/16
                CAF             BIT11                   # 1/16
                AD              SQRARG                  # SQRARG = Y
                DOUBLE                                  # X FROM X/2
HIGUESS         TC              SPROOT1
                TC              SPROOT1                 # ITERATE TWICE
                XCH             ROOTRET                 # SAVE ANSWER AND GET Q
                CCS             A
                XCH             ROOTRET                 # NO SHIFT NEEDED
                TC              ROOTBCK
                XCH             ROOTRET                 # Q NEG, SHIFT RIGHT THREE
                EXTEND
                MP              BIT12                   # EXP -3
ROOTBCK         INDEX           ROOTRET                 # ROOTRET = Q - 1
                TC              1                       # RETURN, C(A) = SQRT(Y)

SPROOT1         XCH             SR                      # SR = X/2
                CS              HALFY                   # NEWTON ITER  X = X/2 + (Y/2 / X/2) / 2
                ZL
                EXTEND
                DV              SR                      # C(SR) = X/2 DV DOES NOT EDIT
## Page 125
                XCH             SR
                EXTEND
                SU              SR
                TC              Q                       # C(A) = X (NEXT)

SPROOT2         CS              ROOTRET                 # SET RETURN Q NEG, AS FLAG
                TS              ROOTRET
                CAF             BIT7                    # SHIFT FOR SIGNIFCANCE
                EXTEND
                MP              SQRARG
                CA              L                       # B(A) = 0
                TC              SPROOT3

-1/8            OCTAL           73777
5/8+1           OCTAL           24001
63/64+1         OCTAL           37401



ENDSUBSF        EQUALS
