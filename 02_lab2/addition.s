		AREA 	MyCode, CODE, READONLY             		
		EXPORT 	main      	
main
		LDR   	R0, =0x1234		; X
		LDR   	R1, =0x0ABC		; Y
		ADD   	R2, R0, R1   	; R2 = R0 + R1 = 0x1CF0
Stop
		B     	Stop         	
		END
