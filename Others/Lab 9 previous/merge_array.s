        AREA 	MergeExample, CODE, READONLY
        EXPORT 	main

main
        ; Example arrays (in data section)
        LDR     R0, =arr_A          ; base of A
        MOV     R1, #3          ; len(A)
        LDR     R2, =arr_B          ; base of B
        MOV     R3, #4          ; len(B)
        LDR     R4, =RESULT     ; base of result array
        BL      merge_array     ; call function

        B       stop            ; done

;--------------------------------------------
; Function: merge_array
; Input:  R0 = base A, R1 = len A
;         R2 = base B, R3 = len B
;         R4 = base result
; Output: R0 = total merged length
;--------------------------------------------
merge_array
        PUSH    {R5-R9, LR}     ; save registers

        MOV     R5, R0          ; ptrA
        MOV     R6, R2          ; ptrB
        MOV     R7, R4          ; ptrResult

        MOV     R8, #0          ; i = 0 (index A)
        MOV     R9, #0          ; j = 0 (index B)

merge_loop
        CMP     R8, R1          ; end of A?
        BGE     copy_B_remaining
        CMP     R9, R3          ; end of B?
        BGE     copy_A_remaining

        LDR     R10, [R5, R8, LSL #2]  ; A[i]
        LDR     R11, [R6, R9, LSL #2]  ; B[j]
        CMP     R10, R11
        BLE     use_A
        ; use B
        STR     R11, [R7], #4
        ADD     R9, R9, #1
        B       merge_loop

use_A
        STR     R10, [R7], #4
        ADD     R8, R8, #1
        B       merge_loop

;--------------------------------------------
; Copy remaining A elements (if any)
copy_A_remaining
        CMP     R8, R1
        BGE     done_merge
copy_A_loop
        LDR     R10, [R5, R8, LSL #2]
        STR     R10, [R7], #4
        ADD     R8, R8, #1
        CMP     R8, R1
        BLT     copy_A_loop
        B       done_merge

;--------------------------------------------
; Copy remaining B elements (if any)
copy_B_remaining
        CMP     R9, R3
        BGE     done_merge
copy_B_loop
        LDR     R11, [R6, R9, LSL #2]
        STR     R11, [R7], #4
        ADD     R9, R9, #1
        CMP     R9, R3
        BLT     copy_B_loop

;--------------------------------------------
done_merge
        ADD     R0, R1, R3      ; total merged length in R0
        POP     {R5-R9, PC}     ; return

stop    B stop

;--------------------------------------------
; Data Section
;--------------------------------------------
        AREA 	MergeExampleData, DATA, READWRITE

arr_A   DCD 	1, 4, 7
arr_B   DCD 	2, 3, 5, 6
RESULT  SPACE 	28       ; enough space for 7 elements

        END
