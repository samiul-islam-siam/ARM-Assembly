			AREA 	myCode, CODE, READONLY
			EXPORT 	main

main
			LDR		R0, = array
			LDR		R1, = length
			LDR		R1, [R1]
			
			LDR		R2, =1
			LDR		R3, =0x20002028
loop
			CMP		R1, #0
			BEQ		Stop
			
			LDR		R4, [R0], #4
			MUL		R2, R2, R4
			STR		R2, [R3]
			SUBS	R1, R1, #1
			BAL		loop
			
Stop
			B		Stop
			
			AREA	myData, DATA, READWRITE
array		DCD		1, 2, 3, 4, 5
length		DCD		5
	
			END