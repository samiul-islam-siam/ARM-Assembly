		AREA 	myCode, CODE, READONLY
		EXPORT 	main
main
		LDR		r0, =arr
		LDR		r1, =len
		LDR		r1, [r1]
		LDR		r3, =0	;sum
		LDR		r4, =0	;avg
		BL		sum_avg
STOP		
		B		STOP
			
sum_avg
		PUSH	{r2, r5, lr}
		MOV		r2, #0 	;counter
loop
		CMP		r2, r1
		BEQ		done
			
		LDR		r5, [r0], #4
		ADD		r3, r3, r5
		ADD		r2, r2, #1
		BAL		loop
			
done
		UDIV	r4, r3, r1
		POP		{r2, r5, lr}
		BX		lr
			
		AREA 	myData, DATA, READWRITE
arr		DCD		1, 2, 3, 4, 5
len		DCD		5
		END