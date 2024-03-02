LCC Assemble/Link/Interpret/Debug Ver 6.0  Wed Feb 28 15:01:50 2024
Nikolas Ayala

Header
o
C

Loc          Code                   Source Code
                          ; At each step will be instructions need
                          ; After your program runs succesfully, y
                          ; to that step and move on to the next s
                          ; ./ path
                          ; .\ directory

                          ; Step 1: dout, nl, halt
0000  0001 0000 0010 0001             add r0, r0, 1
0001  1111 0000 0000 0010             dout r0         ; Display 1
0002  1111 0000 0000 0001             nl
0003  0001 0010 0010 0001             add r1, r0, 1
0004  1111 0010 0000 0010             dout r1        ; Display 2
0005  1111 0000 0000 0001             nl

                                     ; halt            STEP 1 HALT

                          ; Step 2: br, ld, st
0006  0010 0100 0000 0001             ld r2, x
0007  0000 1110 0000 0001             br a1
0008  0000 0000 0000 0011 x:          .word 3
0009  1111 0100 0000 0010 a1:         dout r2         ; Display 3
000a  1111 0000 0000 0001             nl
000b  0001 0100 1010 0001             add r2, r2, 1
000c  0011 0101 1111 1011             st r2, x         ; r2 is now
000d  0010 0001 1111 1010             ld r0, x         ; r0 is 3
000e  1111 0000 0000 0010             dout r0         ; Display 4
000f  1111 0000 0000 0001             nl

                                      ; halt             STEP 2 HA

                          ; Step 3: brn, brp, brz
0010  0001 0000 0011 1100             add r0, r0, -4      ; r0 is 
0011  0001 0010 0011 1111             add r1, r0, -1      
0012  0001 0000 0010 0000             add r0, r0, 0       ; r0 is 
0013  0000 0000 0000 0010             brz z               ; this b
0014  1111 0010 0000 0010             dout r1         ; Print -1 *
0015  1111 0000 0000 0000             halt
0016  0001 0000 0010 0001 z:          add r0, r0, 1
0017  0000 0110 0000 0010             brp p
0018  1111 0010 0000 0010             dout r1         ; Print -1 *
0019  1111 0000 0000 0000             halt
001a  0001 0000 0011 1110 p:          add r0, r0, -2
001b  0000 0100 0000 0010             brn n
001c  1111 0010 0000 0010             dout r1         ; Print -1 *
001d  1111 0000 0000 0000             halt
001e  0010 0001 1110 1001 n:          ld r0, x
001f  0001 0000 0010 0001             add r0, r0, 1
0020  1111 0000 0000 0010             dout            ; Display 5
0021  1111 0000 0000 0001             nl
                                      ; halt            STEP 3 HAL

                          ; Step 4: ldr, str
0022  1110 0000 0001 1110             lea r0, var1
0023  0110 0110 0000 0001             ldr r3, r0, 1
0024  0001 0110 1110 0010             add r3, r3, 2
0025  1110 0100 0001 1100             lea r2, var2
0026  0111 0110 1000 0000             str r3, r2, 0
0027  0110 0100 1000 0000             ldr r2, r2, 0
0028  1111 0100 0000 0010             dout r2         ; Display 6
0029  1111 0000 0000 0001             nl
                                     ; halt             STEP 4 HAL

                          ; Step 5: and, bl, blr
002a  0100 1000 0000 1011             bl sub1
002b  1110 0000 0000 1111             lea r0, abovesub2
002c  0100 0000 0000 0001             blr r0, 1
002d  0010 0000 0001 0111             ld r0, c31
002e  0010 0010 0001 0111             ld r1, c9
002f  0101 0100 0000 0001             and r2, r0, r1
0030  1111 0100 0000 0010             dout r2         ; Display 9
0031  1111 0000 0000 0001             nl
0032  0101 0010 0010 1010             and r1, r0, 10
0033  1111 0010 0000 0010             dout r1         ; Display 10
0034  1111 0000 0000 0001             nl
0035  1111 0000 0000 0000             halt             STEP 5 HALT

                          ; At this point, you should now be able 

0036  0010 0000 0000 1100 sub1:       ld r0, c5
0037  0001 0000 0010 0010             add r0, r0, 2
0038  1111 0000 0000 0010             dout            ; Display 7
0039  1111 0000 0000 0001             nl
003a  1100 0001 1100 0000             ret

003b  0000 0000 0000 0000 abovesub2:  .word 0
003c  0010 0000 0000 0111 sub2:       ld r0, c7
003d  0001 0000 0010 0001             add r0, r0, 1
003e  1111 0000 0000 0010             dout            ; Display 8
003f  1111 0000 0000 0001             nl
0040  1100 0001 1100 0000             ret

0041  0000 0000 0000 0110 var1:       .word 6
0042  0000 0000 0000 0100 var2:       .word 4
0043  0000 0000 0000 0101 c5:         .word 5
0044  0000 0000 0000 0111 c7:         .word 7
0045  0000 0000 0001 1111 c31:        .word 31
0046  0000 0000 0000 1001 c9:         .word 9
====================================================== Output
1
2
3
4
5
6
7
8
9
10

========================================== Program statistics
Input file name       =      .\i1_Project\i1aid.a
Instructions executed =   39 (hex)    57 (dec)
Program size          =   47 (hex)    71 (dec)
Max stack size        =    0 (hex)     0 (dec)
Load point            =    0 (hex)     0 (dec)
