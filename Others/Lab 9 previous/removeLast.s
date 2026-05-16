			AREA 	myCode, CODE, READONLY
			EXPORT	main
main		
			LDR		r0, =arr
			LDR		r1, =len
			LDR		r1, [r1]
			
			MOV		r2, #1 ; index i = 0
			
loop		
			CMP		r2, r1
			BEQ		goto
			
			LDR		r3, [r0], #4
			ADD		r2, r2, #1
			BAL		loop
			
goto
			LDR		r3, =0
			STR		r3, [r0]
			
STOP		
			B		STOP
			
			AREA	myData, DATA, READWRITE
arr			DCD		1, 2, 3, 4, 5
len			DCD		5
			END