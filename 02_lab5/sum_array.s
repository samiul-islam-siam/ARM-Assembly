        AREA 	MyCode, CODE, READONLY
        EXPORT 	main
main

        LDR     R0, =array        	; R0 ? pointer to array start
        MOV     R1, #0            	; R1 ? accumulator (sum = 0)
        MOV     R2, #5            	; R2 ? number of elements

LOOP
        LDR     R3, [R0], #4      	; Load next element, post-increment pointer by 4
        ADD     R1, R1, R3        	; Add element to sum
        SUBS    R2, R2, #1        	; Decrement counter
        BNE     LOOP              	; Repeat until all elements processed

        ; R1 now holds the sum of array elements

STOP
        B       STOP       

        ENDP

        AREA 	MyData, DATA, READWRITE
array   DCD     10, 20, 30, 40, 50  

        END
