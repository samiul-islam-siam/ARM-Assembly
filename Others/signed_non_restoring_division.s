        AREA    NON_RESTORING_UNSIGNED_DIVISION_16BITS, CODE, READONLY
        THUMB
        EXPORT  nonrest_div

;---------------------------------------------------------
; TRUE NON-RESTORING DIVISION (Unsigned 16-bit)
;
; Input:
;   r0 = Q = dividend (16-bit)
;   r1 = M = divisor  (16-bit)
;
; Output:
;   r0 = quotient (16-bit)
;   r1 = remainder (16-bit)
;
; Registers:
;   r2 = A  (signed accumulator)
;   r3 = loop counter
;   r4 = temp
;---------------------------------------------------------

nonrest_div
        PUSH    {r2-r4, lr}

        CMP     r1, #0
        BEQ     div_zero

        MOVS    r2, #0              ; A = 0
        MOVS    r3, #16             ; run 16 steps

loop_start
        ; -------- 1) SHIFT LEFT A:Q ----------
        LSRS    r4, r0, #15         ; get Q[15]
        LSLS    r2, r2, #1          ; A <<= 1
        ORR     r2, r2, r4          ; put Q[15] into A[0]
        LSLS    r0, r0, #1          ; Q <<= 1

        ; -------- 2) SELECT ADD OR SUB ----------
        CMP     r2, #0
        BMI     do_add              ; A < 0: perform ADD
        SUB     r2, r2, r1          ; A = A - M
        B       check_sign

do_add
        ADD     r2, r2, r1          ; A = A + M

check_sign
        ; -------- 3) SET QUOTIENT BIT ----------
        CMP     r2, #0
        BMI     qbit_zero
        ORR     r0, r0, #1          ; A >= 0 ? quotient bit = 1
        B       next_iter

qbit_zero
        ; A < 0 ? quotient bit stays 0
        ; next iteration will use ADD

next_iter
        SUBS    r3, r3, #1
        BNE     loop_start

        ; -------- 4) FINAL CORRECTION ----------
        CMP     r2, #0
        BPL     done
        ADD     r2, r2, r1          ; A = A + M

done
        MOV     r1, r2              ; remainder
        UXTH    r0, r0              ; mask to 16-bit
        UXTH    r1, r1

        POP     {r2-r4, pc}

div_zero
        MOVS    r0, #0
        MOV     r1, r0
        POP     {r2-r4, pc}

        END
