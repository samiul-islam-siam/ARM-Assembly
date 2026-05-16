        AREA 	odd_even_prog, CODE, READONLY
        EXPORT	main

main
        LDR     r0, =arr        ; r0 = base address of array
        LDR     r1, =len      ; r1 = address of length variable
        LDR     r1, [r1]             ; r1 = array length
        BL      odd_even             ; call the function

        ; store results into memory (optional)
        LDR     r2, =even
        STR     r3, [r2]             ; store even count
        LDR     r2, =odd
        STR     r4, [r2]             ; store odd count

stop    B       stop                 ; infinite loop to stop program

;--------------------------------------------------------
; Function: odd_even
; Counts number of odd and even numbers in an integer array
; Input : r0 = base address of array
;         r1 = length of array
; Output: r3 = even count
;         r4 = odd count
;--------------------------------------------------------

odd_even
        PUSH    {r2, r5, lr}         ; save registers

        MOV     r3, #0               ; even count = 0
        MOV     r4, #0               ; odd count = 0
        MOV     r2, #0               ; index i = 0

loop
        CMP     r2, r1               ; if i == length, done
        BEQ     done

        ADD     r5, r0, r2, LSL #2   ; address of arr[i]
        LDR     r5, [r5]             ; r5 = arr[i]

        ANDS    r5, r5, #1           ; check LSB
        BEQ     even_num              ; if LSB=0, even
        ADD     r4, r4, #1           ; else odd++
        B       next

even_num
        ADD     r3, r3, #1           ; even++

next
        ADD     r2, r2, #1           ; i++
        B       loop

done
        POP     {r2, r5, lr}
        BX      lr                   ; return

;--------------------------------------------------------
; Data Section
;--------------------------------------------------------
        AREA 	array_data, DATA, READWRITE
arr    	DCD  	10, 21, 32, 43, 54, 65, 76
len  	DCD  	7
even  	DCD  	0
odd   	DCD  	0

        END
