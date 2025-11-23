      		AREA 	MyCode, CODE, READONLY
		EXPORT 	main      	
	
main
		MOV   	R0, #5
		MOV   	R1, #10

		AND 	R2, R0, R1		; AND
		ORR	R3, R0, R1		; OR
		EOR	R4, R0, R1		; XOR
		
		MVN	R5, R2			; NAND
		MVN	R6, R3			; NOR
		MVN	R7, R4			; XNOR
		
		
Stop
		B     	Stop         	
		END
