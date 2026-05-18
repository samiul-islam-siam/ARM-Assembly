        AREA    array_binary_search, CODE, READONLY
        EXPORT  main

arr     DCD     7, 12, 23, 45, 56   ; Sorted array
len     EQU     5
key     DCD     23                   ; Element to search

result  DCD     0

;------------------------
main
        LDR     r0, =arr
        MOV     r1, #len
        LDR     r2, =key
        LDR     r2, [r2]
        BL      binary_search
        LDR     r3, =result
        STR     r0, [r3]
stop    B       stop

;------------------------
; Function: binary_search
; Inputs: r0 = base addr, r1 = length, r2 = key
; Output: r0 = index if found, -1 if not
binary_search
        MOV     r3, #0          ; low = 0
        SUB     r4, r1, #1      ; high = n-1
loop
        CMP     r3, r4
        BGT     not_found
        ADD     r5, r3, r4
        MOV     r5, r5, LSR #1  ; mid = (low + high)/2
        LDR     r6, [r0, r5, LSL #2]  ; arr[mid]
        CMP     r6, r2
        BEQ     found
        BLT     move_high
        ; arr[mid] > key
        SUB     r4, r5, #1
        B       loop
move_high
        ADD     r3, r5, #1
        B       loop
found
        MOV     r0, r5
        BX      lr
not_found
        MOV     r0, #-1
        BX      lr
