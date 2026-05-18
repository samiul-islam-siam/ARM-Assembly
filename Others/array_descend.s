        AREA    array_sort_prog_desc, CODE, READONLY
        EXPORT  main

main
        LDR     r0, =arr        ; r0 = base address of array
        LDR     r1, =len        ; r1 = address of length variable
        LDR     r1, [r1]        ; r1 = length of array
        BL      array_descend    ; call the sorting function

stop    B       stop                 ; infinite loop to stop program

;--------------------------------------------------------
; Function: array_descend
; Sorts an integer array in descending order using bubble sort
; Input : r0 = base address of array
;         r1 = length of array
; Output: array sorted in memory (in-place)
;--------------------------------------------------------

array_descend
        PUSH    {r2, r3, r4, r5, lr} ; save registers

        SUB     r1, r1, #1           ; outer loop runs (n-1) times
        MOV     r4, #0               ; i = 0

outer_loop
        CMP     r4, r1               ; if i == n-1 ? done
        BGE     done

        MOV     r5, #0               ; j = 0

inner_loop
        CMP     r5, r1
        BGE     next_outer           ; if j >= n-1, next i

        ADD     r2, r0, r5, LSL #2   ; address of arr[j]
        LDR     r3, [r2]             ; r3 = arr[j]
        LDR     r12, [r2, #4]        ; r12 = arr[j+1]

        CMP     r3, r12              ; compare arr[j] and arr[j+1]
        BGE     no_swap              ; if arr[j] >= arr[j+1], skip (descending)

        ; swap arr[j] and arr[j+1]
        STR     r12, [r2]            ; arr[j] = arr[j+1]
        STR     r3, [r2, #4]         ; arr[j+1] = arr[j]

no_swap
        ADD     r5, r5, #1           ; j++
        B       inner_loop

next_outer
        ADD     r4, r4, #1           ; i++
        B       outer_loop

done
        POP     {r2, r3, r4, r5, lr}
        BX      lr                   ; return

;--------------------------------------------------------
; Data Section
;--------------------------------------------------------
        AREA array_data_desc, DATA, READWRITE
arr     DCD  0x42, 0x7, 0x15, 0x3, 0x20, 0x10   ; unsorted array
len     DCD  6                     ; number of elements

        END
