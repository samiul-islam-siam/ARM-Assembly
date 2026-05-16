        AREA    unsigned_non_restoring_division, CODE, READONLY
        THUMB
        EXPORT  udiv16_nonrestoring

; ---------------------------------------------------------
; 16-bit unsigned non-restoring division
;
; Input:
;   R0 = dividend: Q  (0..65535)
;   R1 = divisor: M   (0..65535)
;
; Output:
;   R0 = quotient  (16-bit)
;   R1 = remainder (16-bit)
;
; Registers:
;   R2 = accumulator: A
;   R3 = loop counter
;   R4 = temp for MSB of Q
; ---------------------------------------------------------

udiv16_nonrestoring

        CMP     R1, #0           ; division by zero?
        BEQ     div_by_zero16

        MOVS    R2, #0           ; initially A = 0
        MOVS    R3, #16          ; 16 iterations only

loop16
        ; shift A left once
        LSLS    R2, R2, #1
		SXTH	R2, R2

        ; get MSB of Q (bit 15)
		UXTH	R0, R0
        LSRS    R4, R0, #15      ; R4 = Q >> 15
        ORRS    R2, R2, R4       ; A |= MSB(Q)
		SXTH	R2, R2

        ; shift Q left
        LSLS    R0, R0, #1
		UXTH	R0, R0

        ; if A >= 0 ? A = A - M
        ; else      ? A = A + M
        TST     R2, R2
        BMI     Aneg16

Apos16
        SUBS    R2, R2, R1
		SXTH	R2, R2
        B       updateQ16

Aneg16
        ADDS    R2, R2, R1
		SXTH	R2, R2

updateQ16
        TST     R2, R2
        BMI     skipQset16
        ORR     R0, R0, #1        ; set Q bit (LSB)
		UXTH	R0, R0

skipQset16
        SUBS    R3, R3, #1
        BNE     loop16

        ; Correction step
        TST     R2, R2
        BPL     finish16
        ADDS    R2, R2, R1
		SXTH	R2, R2

finish16
        UXTH    R0, R0           ; force 16-bit mask
        UXTH    R1, R2           ; remainder
        BX      LR


; -------- division by zero handler -----------------------
; quotient  = 0xFFFF
; remainder = dividend
div_by_zero16
        MOVS    R0, #0xFF
        MOV     R1, R0
        LSLS    R0, R0, #8
        ORR     R0, R0, #0xFF    ; R0 = 0xFFFF
        BX      LR

        END
