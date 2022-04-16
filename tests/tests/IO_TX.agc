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
# OUT
DSKY_REG_1                      EQUALS     0
DSKY_REG_2                      EQUALS     1
DSKY_REG_3                      EQUALS     2
DSKY_PROGN                      EQUALS     3
DSKY_LAMPS                      EQUALS     4
AXI_DVA                         EQUALS     5
AXI_DVATX                       EQUALS     6
AXI_DVB                         EQUALS     7
AXI_DVBTX                       EQUALS     10
# IN
DSKY_VERB                       EQUALS     11
DSKY_NOUN                       EQUALS     12
AXI_G                           EQUALS     13
AXI_RA                          EQUALS     14
AXI_RB                          EQUALS     15
AXI_ATX                         EQUALS     16
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


STARTUP                         EXTEND
                                READ            DSKY_VERB
                                EXTEND
                                READ            DSKY_NOUN
                                EXTEND
                                READ            AXI_G
                                EXTEND
                                READ            AXI_RA
                                EXTEND
                                READ            AXI_RB
                                EXTEND
                                READ            AXI_ATX

                                EXTEND
                                READ            DSKY_REG_1
                                EXTEND
                                READ            DSKY_REG_2
                                EXTEND
                                READ            DSKY_REG_3
                                EXTEND
                                READ            DSKY_LAMPS
                                EXTEND
                                READ            AXI_DVA
                                EXTEND
                                READ            AXI_DVATX
                                EXTEND
                                READ            AXI_DVB
                                EXTEND
                                READ            AXI_DVBTX

                                CA              ONE
                                EXTEND
                                WRITE           DSKY_REG_1
                                CA              TWO
                                EXTEND
                                WRITE           DSKY_REG_2
                                CA              FOUR
                                EXTEND
                                WRITE           DSKY_REG_3
                                CA              EIGHT
                                EXTEND
                                WRITE           DSKY_LAMPS
                                CA              MINUS1
                                EXTEND
                                WRITE           AXI_DVA
                                CA              ONE
                                EXTEND
                                WRITE           AXI_DVATX
                                CA              TWO
                                EXTEND
                                WRITE           AXI_DVB
                                CA              FOUR
                                EXTEND
                                WRITE           AXI_DVBTX


                                EXTEND
                                READ            DSKY_REG_1
                                EXTEND
                                READ            DSKY_REG_2
                                EXTEND
                                READ            DSKY_REG_3
                                EXTEND
                                READ            DSKY_LAMPS
                                EXTEND
                                READ            AXI_DVA
                                EXTEND
                                READ            AXI_DVATX
                                EXTEND
                                READ            AXI_DVB
                                EXTEND
                                READ            AXI_DVBTX

LOOP                            NOOP
                                TCF 		LOOP


#stored constants
ZERO                            OCT  0
ONE                             OCT  1
TWO                             OCT  2
FOUR                            OCT  4
EIGHT                           DEC  8
MINUS1                          DEC  -1