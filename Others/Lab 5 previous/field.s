        AREA    BITFIELD_OP, CODE, READONLY
        EXPORT  __main

__main  FUNCTION

        ; Step 1: Load the 16-bit words
        LDR     R1, =0x20F2      ; P = 0010000011110010b
        LDR     R2, =0x30F0      ; Q = 0011000011110000b
        LDR     R3, =0xC4F8      ; R = 1100010011111000b

        ; Extract 6-bit fields
        ; P field = bits [14:9]
        MOV     R4, R1
        LSR     R4, R4, #9        ; shift right 9
        AND     R4, R4, #0x3F     ; mask 6 bits (00111111b)

        ; Q field = bits [6:1]
        MOV     R5, R2
        LSR     R5, R5, #1
        AND     R5, R5, #0x3F

        ; R field = bits [10:5]
        MOV     R6, R3
        LSR     R6, R6, #5
        AND     R6, R6, #0x3F
		
		; P = R4, Q = R5, R = R6

        ; Step 2: Compute (Q XOR R)
        EOR     R7, R5, R6

        ; Step 3: P OR (Q XOR R)
        ORR     R8, R4, R7

        ; Step 4: AND with 111110b (0x3E)
        AND     R0, R8, #0x3E     
		
		; Final result F in R0

STOP
        B       STOP
        ENDFUNC
        END
