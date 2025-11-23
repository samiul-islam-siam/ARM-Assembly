        AREA Division, CODE, READONLY
        ENTRY
		EXPORT 	__main
__main
        ; -------- 8-bit Division --------
        LDR     R0, =0x64        
        LDR     R1, =0x0A        
        UDIV    R2, R0, R1       ; R2 = R0 / R1

        ; -------- 16-bit Division --------
        LDR     R3, =0x1234      
        LDR     R4, =0x0010      
        UDIV    R5, R3, R4       ; R5 = R3 / R4

        ; -------- 32-bit Division --------
        LDR     R6, =0x12345678  
        LDR     R7, =0x00001000  
        UDIV    R8, R6, R7       ; R8 = R6 / R7

loop
        B       loop

        END
