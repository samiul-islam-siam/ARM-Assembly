        AREA 	RotateExample, CODE, READONLY
        EXPORT 	main

main
        ; Example input
        LDR     R0, =ARR         ; base address
		LDR 	R1, =len
		LDR		R1, [R1]		; length = 5
        LDR     R2, =k
		LDR		R2, [R2]		; rotate left by 2
        BL      rotate_k         ; call function

stop    B       stop             ; infinite loop

;--------------------------------------------------
; Function: rotate_k
; Input:  R0 = base, R1 = length, R2 = k
; Output: array rotated left by k (in-place)
;--------------------------------------------------
rotate_k
        PUSH    {R4-R9, LR}

        MOV     R4, R0           ; base pointer
        MOV     R5, R1           ; len
        MOV     R6, R2           ; k

        ; k = k % len
        CMP     R6, R5
        BLT     skip_mod
mod_loop
        SUBS    R6, R6, R5
        CMP     R6, R5
        BGE     mod_loop
skip_mod

        ; if k == 0, no rotation
        CMP     R6, #0
        BEQ     done_rotate

        ; Create a temporary buffer
        LDR     R7, =TEMP

        ; Copy first k elements to TEMP
        MOV     R8, #0
copy_first_k
        CMP     R8, R6
        BGE     shift_left
        LDR     R9, [R4, R8, LSL #2]
        STR     R9, [R7, R8, LSL #2]
        ADD     R8, R8, #1
        B       copy_first_k

;---------------------------------------------
; Shift elements left by k
;---------------------------------------------
shift_left
        MOV     R8, #0
shift_loop
        ADD     R9, R8, R6
        CMP     R9, R5
        BGE     copy_temp_back
        LDR     R10, [R4, R9, LSL #2]
        STR     R10, [R4, R8, LSL #2]
        ADD     R8, R8, #1
        B       shift_loop

;---------------------------------------------
; Copy TEMP elements to the end
;---------------------------------------------
copy_temp_back
        MOV     R8, #0
copy_temp_loop
        CMP     R8, R6
        BGE     done_rotate
        LDR     R9, [R7, R8, LSL #2]
        SUB     R10, R5, R6      ; destination start = len - k
        ADD     R10, R10, R8
        STR     R9, [R4, R10, LSL #2]
        ADD     R8, R8, #1
        B       copy_temp_loop

done_rotate
        POP     {R4-R9, PC}


;--------------------------------------------------
; Data Section
;--------------------------------------------------
        AREA 	RotateExampleData, DATA, READWRITE

ARR     DCD 	1, 2, 3, 4, 5
len		DCD		5
k		DCD		2
TEMP    SPACE 	20        ; temporary buffer (enough for max k=5)

        END
