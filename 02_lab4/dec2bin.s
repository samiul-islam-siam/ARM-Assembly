        AREA    DEC_TO_BIN, CODE, READONLY
        EXPORT  __main

__main
        MOV     R0, #157          ; Decimal number (0–255)

        ; --- Extract each bit ---
        AND     R1, R0, #0x80     ; Mask for bit7 (128)
        LSR     R1, R1, #7        ; Shift to LSB position
                                  ; R1 = bit7

        AND     R2, R0, #0x40     ; Mask for bit6 (64)
        LSR     R2, R2, #6
                                  ; R2 = bit6

        AND     R3, R0, #0x20     ; Mask for bit5 (32)
        LSR     R3, R3, #5
                                  ; R3 = bit5

        AND     R4, R0, #0x10     ; Mask for bit4 (16)
        LSR     R4, R4, #4
                                  ; R4 = bit4

        AND     R5, R0, #0x08     ; Mask for bit3 (8)
        LSR     R5, R5, #3
                                  ; R5 = bit3

        AND     R6, R0, #0x04     ; Mask for bit2 (4)
        LSR     R6, R6, #2
                                  ; R6 = bit2

        AND     R7, R0, #0x02     ; Mask for bit1 (2)
        LSR     R7, R7, #1
                                  ; R7 = bit1

        AND     R8, R0, #0x01     ; Mask for bit0 (1)
                                  ; R8 = bit0 (no shift)

        ; R1–R8 contains bits 7–0 respectively.

STOP    
		B       STOP               

        END
