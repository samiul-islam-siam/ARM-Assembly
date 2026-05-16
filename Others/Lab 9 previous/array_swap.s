        AREA 	swap_array_prog, CODE, READONLY
        EXPORT 	main

main
        LDR     r0, =arr        ; r0 = base address of array
        LDR     r1, =len      ; r1 = address of length variable
        LDR     r1, [r1]             ; r1 = length of array
        BL      swap_array           ; call the function

stop    B       stop                 ; infinite loop to stop program

;--------------------------------------------------------
; Function: swap_array
; Reverses an array using two pointers: start and end
; Input : r0 = base address of array
;         r1 = length of array
; Output: array reversed in memory
;--------------------------------------------------------

swap_array
        PUSH    {r2, r3, r4, lr}     ; save registers

        CMP     r1, #1               ; check if length <= 1
        BLE     done                 ; nothing to swap

        MOV     r2, #0               ; start index = 0
        SUB     r3, r1, #1           ; end index = length - 1

loop
        CMP     r2, r3               ; if start >= end, done
        BGE     done

        ; compute addresses of start and end elements
        ADD     r4, r0, r2, LSL #2   ; address of arr[start]
        LDR     r4, [r4]             ; load arr[start] into r4

        ADD     r5, r0, r3, LSL #2   ; address of arr[end]
        LDR     r5, [r5]             ; load arr[end] into r5

        ; swap arr[start] and arr[end]
        ADD     r6, r0, r2, LSL #2
        STR     r5, [r6]             ; arr[start] = arr[end]
        ADD     r6, r0, r3, LSL #2
        STR     r4, [r6]             ; arr[end] = arr[start]

        ADD     r2, r2, #1           ; start++
        SUB     r3, r3, #1           ; end--
        B       loop

done
        POP     {r2, r3, r4, lr}
        BX      lr                   ; return

;--------------------------------------------------------
; Data Section
;--------------------------------------------------------
        AREA 	array_data, DATA, READWRITE
arr    	DCD  	0x10, 0x20, 0x30, 0x40, 0x50, 0x60 ; initial array
len  	DCD  	6                      ; number of elements

        END
