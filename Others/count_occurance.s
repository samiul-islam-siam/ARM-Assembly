        AREA    myCode, CODE, READONLY
        EXPORT  main

;---------------------------------
arr     DCD     12, 45, 7, 23, 45, 56, 45
len     EQU     7
key     DCD     45            ; Number to count

result  DCD     0             ; Store occurrence count, if not found then zero

;---------------------------------
main
        LDR     r0, =arr       ; Base address of array
        MOV     r1, #len       ; Length of array
        LDR     r2, =key
        LDR     r2, [r2]       ; Key to search/count
        BL      count_occurrences
        LDR     r3, =result
        STR     r0, [r3]       ; Store the count
stop    B       stop

;---------------------------------
; Function: count_occurrences
; Inputs: r0 = base addr, r1 = length, r2 = key
; Output: r0 = count of occurrences
count_occurrences
        MOV     r3, #0          ; index = 0
        MOV     r4, #0          ; count = 0
loop
        CMP     r3, r1
        BGE     done
        LDR     r5, [r0, r3, LSL #2]  ; Load arr[index]
        CMP     r5, r2
        ADDNE   r4, r4, #0
        ADDEQ   r4, r4, #1
        ADD     r3, r3, #1
        B       loop
done
        MOV     r0, r4          ; return count in r0
        BX      lr
