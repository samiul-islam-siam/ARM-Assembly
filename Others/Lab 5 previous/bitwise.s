        AREA    BOOLEAN_OP, CODE, READONLY
        EXPORT  __main

__main  FUNCTION
        ; Load test values
        MOV     R1, #0x55      ; W = 01010101b
        MOV     R2, #0x0F      ; X = 00001111b
        MOV     R3, #0xF0      ; Y = 11110000b
        MOV     R4, #0x33      ; Z = 00110011b

        ; Step 1: Compute W & X
        AND     R5, R1, R2     ; R5 = W & X

        ; Step 2: Compute Y & Z
        AND     R6, R3, R4     ; R6 = Y & Z

        ; Step 3: Take NOT (bitwise complement) of (Y & Z)
        MVN     R6, R6         ; R6 = ~(Y & Z)

        ; Step 4: Compute (W & X) | ~(Y & Z)
        ORR     R0, R5, R6     ; R0 = F = (W & X) | ~(Y & Z)

        ; R0 now contains the final result F

STOP    
        B       STOP            ; Endless loop to stop program
        ENDFUNC
        END
