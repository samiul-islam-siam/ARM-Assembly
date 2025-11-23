		AREA 	NEW, CODE, READONLY
		ENTRY
		EXPORT 	__main
			
__main
	
		LDR		R0, =0x12345678	; value
		LDR		R1, =24			; rotation
		ROR		R2, R0, R1		; rotate
	
STOP
		B		STOP
		END
			
;		AREA 	NEW, CODE, READONLY
;		EXPORT 	__main
			
;__main	FUNCTION
	
;		LDR		R0, =0x20000000	; value address = R0
;		LDR		R1, =0x12345678	; value = R1
;		STR		R1, [R0]		; store the value at R0
		
;		LDR		R2, =0x20000004	; rotation address = R2
;		LDR		R3, =24			; rotation = R3
;		STR		R3, [R2]		; store the rotation at R2
		
;		LDR		R4, =0x20000008	; result address = R4
		
;		ROR		R5, R1, R3		; rotate
		
;		STR		R5, [R4]		; store the result at R4
	
;STOP
;		B		STOP
;		ENDFUNC
;		END