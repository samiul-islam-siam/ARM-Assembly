			AREA 	myCode, CODE, READONLY
			EXPORT	main
main		
			LDR		r0, =arr
			LDR		r1, =len
			LDR		r1, [r1]
			
			MOV		r2, #0	; i = 0
			MOV		r3, #0	; sum = 0
			MOV		r4, #0	; avg = 0
			
loop		
			CMP		r2, r1
			BEQ		done
			
			LDR		r5, [r0], #4
			ADD		r3, r3, r5
			ADD		r2, r2, #1
			B		loop
			
done		
			UDIV	r4, r3, r1
			
STOP		
			B		STOP
			
			AREA	myData, DATA, READWRITE
arr			DCD		1, 2, 3, 4, 5
len			DCD		5
			END