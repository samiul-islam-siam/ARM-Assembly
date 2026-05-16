        AREA    NIBBLE_SPLIT, CODE, READONLY
        EXPORT  __main

__main  FUNCTION
        ; Step 1: Load the 8-bit input value
        LDR     R0, =0x5F        ; Input Value = 0x5F

        ; Step 2: Extract high nibble (bits 7–4)
        MOV     R1, R0
        LSR     R1, R1, #4        ; Shift right by 4 ? get 00000101b
        AND     R1, R1, #0x0F     ; Mask to keep only 4 bits (0x05)

        ; Step 3: Extract low nibble (bits 3–0)
        AND     R2, R0, #0x0F     ; Keep lower 4 bits ? 0x0F

        ; Step 4: Combine into 16-bit result
        LSL     R1, R1, #8        ; Place high nibble in high byte ? 0x0500
        ORR     R0, R1, R2        ; Combine ? 0x050F

        ; Now R0 = Result = 0x050F

STOP
        B       STOP
        ENDFUNC
        END
