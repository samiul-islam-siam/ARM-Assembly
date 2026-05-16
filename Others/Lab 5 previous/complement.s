        AREA    ONES_COMP, CODE, READONLY
        EXPORT  __main

__main  FUNCTION
        ; Step 1: Load the input number
        LDR     R0, =0x0000C123      ; Input: Number = C123h

        ; Step 2: Find One’s Complement (bitwise NOT)
        MVN     R1, R0               ; R1 = ~R0

        ; Now R1 holds the one’s complement
        ; Expected Output: FFFF3EDC

STOP
        B       STOP
        ENDFUNC
        END
