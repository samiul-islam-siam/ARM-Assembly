			AREA 	myCode, CODE, READONLY
			EXPORT	main
main		
			LDR		r0, =arr
			LDR		r1, =len
			LDR		r2, [r1]
			LDR		r3, =new_arr
			BL		remove_last
STOP		
			B		STOP

remove_last
			PUSH	{r4, r5, lr}
			SUB		r2, r2, #1
			STR		r2, [r1]
			MOV		r4, #0 
			
loop		
			CMP		r4, r2
			BEQ		done
			
			LDR		r5, [r0], #4
			STR		r5, [r3], #4
			ADD		r4, r4, #1
			BAL		loop
			
done
			POP		{r4, r5, lr}
			BX		lr
			
			AREA	myData, DATA, READWRITE
arr			DCD		1, 2, 3, 4, 5
new_arr		DCD		0, 0, 0, 0
len			DCD		5
			END