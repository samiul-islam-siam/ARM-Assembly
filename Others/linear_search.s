        AREA    array_linear_search, CODE, READONLY
        EXPORT  main

arr     DCD     12, 45, 7, 23, 56
len     EQU     5
key     DCD     23          ; Element to search

result  DCD     0           ; Store result index

;------------------------
main
        LDR     r0, =arr      ; Base address of array
        LDR     r1, =len
        MOV     r1, #len      ; Length
        LDR     r2, =key
        LDR     r2, [r2]      ; Key to search
        BL      linear_search
        LDR     r3, =result
        STR     r0, [r3]      ; Store result index
stop    B       stop

;------------------------
; Function: linear_search
; Inputs: r0 = base addr, r1 = length, r2 = key
; Output: r0 = index (0..n-1) if found, -1 if not
linear_search
        MOV     r3, #0         ; index = 0
loop
        CMP     r3, r1
        BGE     not_found
        LDR     r4, [r0, r3, LSL #2]  ; load arr[index]
        CMP     r4, r2
        BEQ     found
        ADD     r3, r3, #1
        B       loop
found
        MOV     r0, r3
        BX      lr
not_found
        MOV     r0, #-1
        BX      lr
