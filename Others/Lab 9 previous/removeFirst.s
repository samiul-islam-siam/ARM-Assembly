			AREA 	myCode, CODE, READONLY
			EXPORT	main
main		
			LDR		r0, =arr
			LDR		r1, =len
			LDR		r1, [r1]
			
			SUB		r1, r1, #1 ; new len
			MOV		r2, #0 ; index i = 0
			
loop		
			CMP		r2, r1
			BEQ		STOP
			
			LDR		r3, [r0, #4]
			STR		r3, [r0]
			ADD		r0, r0, #4
			ADD		r2, r2, #1
			BAL		loop
			
STOP		
			B		STOP
			
			AREA	myData, DATA, READWRITE
arr			DCD		1, 2, 3, 4, 5
len			DCD		5
			END