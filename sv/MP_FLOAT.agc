# Special registers.
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
SIGN                            ERASE                           # For buffering sign+digits in conversion of integer to decimal string.
DIGIT1                          ERASE
DIGIT2                          ERASE
DIGIT3                          ERASE
DIGIT4                          ERASE
DIGIT5                          ERASE
SIGNA                           ERASE                           # For buffering sign+digits in conversion of integer to decimal string.
DIGIT1A                         ERASE
DIGIT2A                         ERASE
DIGIT3A                         ERASE
DIGIT4A                         ERASE
DIGIT5A                         ERASE
DSPR                            ERASE                           # Return address for DSPxxxx functions.
DIGIT25                         ERASE
DIGIT31                         ERASE
DIVISOR                         ERASE                           # A dummy variable used to store divisors.
DSPMODE                         ERASE                           # display-mode: 0 time, 1 acceleration, 2 magnetometer, etc.
LLLOW                           ERASE                           # LS word of lat or lon
LLHIGH                          ERASE                           # MS word of lat or lon.
LLRET                           ERASE                           # Return address for LL2.
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


# So octal 23653 is equivalent to 10155/(2^14) = 0.619812
# The answer should be around (10155/(2^14))^2*3 = 1.525
#
# Simulation:
# (agc) info registers
# A               0x0001  1
# L               0x09c2  2498
# Q               0x0000  0
# EB              0x0000  0
# FB              0x0000  0
# Z               0x0832  2098
# BB              0x0000  0
# ARUPT           0x0000  0
# LRUPT           0x0000  0
# QRUPT           0x0000  0
# ZRUPT           0x0000  0
# BBRUPT          0x0000  0
# BRUPT           0x0000  0
# CHAN07          0x0000  0
# CYR             0x0000  0
# SR              0x0000  0
# CYL             0x0000  0
# EDOP            0x0000  0
# INDEX           0x0000  0
# EXTEND          0x0001  1
# IRQMSK          0x0000  0
# ISR             0x0000  0
#
# 2498/(2^14) + 2^0 = 1.15246 so close enough this makes sense
#
#
# Our AGC:
#
# PC = 4064 STALL = 0
# NEXT PC = 4065
# A = 00000
# L = 22341
# Q = 00000
# BB = 00xxx
# CYR = 00000
# SR = 00000
# SL = 00000
# TIME1 = 00000
# TIME2 = 00000
# $finish called from file "top.sv", line 71.
# $finish at simulation time                  155
#            V C S   S i m u l a t i o n   R e p o r t
#
# 9441/(2^14) = 0.5762 which is not correct
#


STARTUP                         CA                 POS111
                                EXTEND
                                MP                 POS111
                                EXTEND
                                MP                 THREE
                                EXTEND
                                DCA  50

#stored constants
ZERO                            OCT  0
ONE                             OCT  1
TWO                             OCT  2
FOUR                            OCT  4
EIGHT                           DEC  8
THREE                           DEC  3
POS111                          OCT  23653

