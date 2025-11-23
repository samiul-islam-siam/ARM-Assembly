			AREA 	myCode, CODE, READONLY
			EXPORT	main
main		
			LDR		r0, =arr
			LDR		r1, =len
			LDR		r1, [r1]
			BL		remove_first
STOP		
			B		STOP
			
			
remove_first
			PUSH	{r2-r5, lr}
			 
			MOV		r2, #0 
			
loop		
			CMP		r2, r1
			BEQ		done
			
			LDR		r3, [r0, #4]
			STR		r3, [r0]
			ADD		r0, r0, #4
			ADD		r2, r2, #1
			BAL		loop
done
			LDR		r3, [r0]
			MOV		r3, #0
			STR		r3, [r0]
			POP		{r2-r5, lr}
			BX		lr
			
			
			AREA	myData, DATA, READWRITE
arr			DCD		1, 2, 3, 4, 5, 6
len			DCD		6
			END