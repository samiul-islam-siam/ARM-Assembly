       		AREA 	MyCode, CODE, READONLY
		EXPORT 	main      	

main
		MOV   	R0, #10
		MOV   	R1, #5
		
; Addition
		ADD   	R2, R0, R1   	; R2 = R0 + R1 = 15
		
; Subtraction
		SUB	R3, R0, R1	; R3 = R0 - R1 = -5
		
; Multiplication
		MUL	R4, R0, R1	; R4 = R0 * R1 = 50
		
Stop
		B     	Stop         	
		END
