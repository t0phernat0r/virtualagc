# Special registers.
A                               EQUALS          0
L                               EQUALS          1               # L AND Q ARE BOTH CHANNELS AND REGISTERS.
Q                               EQUALS          2
EBANK                           EQUALS          3
FBANK                           EQUALS          4
BBANK                           EQUALS          5
Z                               EQUALS          6                                   # (DTCB) AND DXCH FBANK (DTCF).
CYR                             EQUALS          7
SR                              EQUALS          8
CYL                             EQUALS          9
SL                              EQUALS          10
TIME1                           EQUALS          11
TIME2                           EQUALS          12
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

STARTUP                         CA   ONE
                                LXCH A
                                CA   ONE
                                DDOUBL #2,2
                                CA   MINUS0
                                LXCH A
                                CA   MINUS0
                                DDOUBL #ffff,ffff
                                CA   ZERO
                                LXCH A
                                CA   INTMAX
                                DDOUBL #3fff, 0000
                                CA   INTMAX
                                LXCH A
                                CA   ZERO
                                DDOUBL #0000, 3fff
                                CA   INTMAX
                                LXCH A
                                CA   INTMAX #3ffe, 3fff
                                DDOUBL #3fff, 3fff
                                CA   ZERO
                                LXCH A
                                CA   INTMIN
                                DDOUBL #c000,0000
                                CA   INTMIN
                                LXCH A
                                CA   ZERO
                                DDOUBL #0000, c000
                                CA   INTMIN
                                LXCH A
                                CA   INTMIN
                                DDOUBL #c000, c000
                                EXTEND
                                DCA  50

#this is affected by overflow stuff so it's hard to say what we will do about this

#stored constants
ZERO                            OCT  0
ONE                             OCT  1
MINUS0                          OCT  77777
INTMAX                          OCT  37777
INTMIN                          OCT  40000
MINUS1                          DEC  -1
