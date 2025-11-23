        AREA    ReverseBit, CODE, READONLY
        ENTRY
		EXPORT 	main
main

        ; Input:  R0 = 16-bit number
        ; Output: R1 = reversed 16-bit number
		
		LDR		R0, =0x1234

        RBIT    R1, R0          ; Reverse all bits of R0 into R1
        
END_LOOP
        B       END_LOOP

        END
