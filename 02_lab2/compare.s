  		AREA 	MyCode, CODE, READONLY              		
		EXPORT 	main      	
	
main
		MOV   	R0, #5			; X = 5
		MOV   	R1, #10			; Y = 10

		CMP   	R0, R1        	; compares X and Y
        	MOVLE 	R2, R0        	; if (X <= Y) -> R2 = X
        	MOVGT 	R2, R1        	; if (X > Y)  -> R2 = Y
		
		
Stop
		B     	Stop         	
		END
