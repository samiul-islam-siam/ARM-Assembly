        AREA    BCD_TO_HEX, CODE, READONLY
        EXPORT  __main

__main  FUNCTION

        ; Input : R1 = BCD number
        ; Output: R0 = Equivalent hex value

        MOV     R1, #0x25          ; Load BCD number (decimal 25)

        ; Extract upper nibble (tens digit) ---
        MOV     R2, R1             
        MOV     R3, #16            
        UDIV    R2, R2, R3         ; R2 = upper nibble = 0x25 / 16 = 0x02 (decimal 2)

        ; Multiply upper nibble by 10 (tens place) ---
        MOV     R4, #10            
        MUL     R2, R2, R4         ; R2 = 2 * 10 = 20

        ; Extract lower nibble (ones digit) ---
        AND     R1, R1, #0x0F      ; Mask lower nibble: R1 = 0x25 & 0x0F = 0x05 (decimal 5)

        ADD     R0, R2, R1         ; R0 = 20 + 5 = 25 (0x19 in hex)

        B       .                  

        ENDFUNC
        END
