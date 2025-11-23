	AREA   	MinMax, CODE, READONLY
    	EXPORT 	main
		
; R1 = loop variable
; R2 = max
; R3 = min
; R4 = current element

main
    	LDR     R0, =array         	; R0 = pointer to the start of the array
    	MOV     R1, #5             	; R1 = number of elements (N = 5)

    	LDR     R2, [R0], #4       	; Load first element into R2 (max)
    	MOV     R3, R2             	; Copy R2 to R3 (min)

next_element
    	SUBS    R1, R1, #1         	; Decrement counter
    	BEQ     done               	; If R1 == 0, we're done

    	LDR     R4, [R0], #4       	; Load next number from array into R4
	; #4: means after loading, add 4 to the base register R0

    	CMP     R4, R2             	; Compare with current max
    	BGT     set_max            	; If R4 > R2, update max
	
    	CMP     R4, R3             	; Compare with current min
    	BLT     set_min            	; If R4 < R3, update min
    	B       next_element       	; Go to next element

set_max
    	MOV     R2, R4             	; Update max
    	B       next_element

set_min
    	MOV     R3, R4             	; Update min
    	B       next_element

done
    ; R2 contains max value
    ; R3 contains min value

    	B       .                 	; Infinite loop to stop

array
    	DCD     0x19, 0x59, 0xC, 0x63, 0x22 	; The array of 5 integers

    	END
