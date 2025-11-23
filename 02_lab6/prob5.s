		AREA    reverse, CODE, READONLY
		EXPORT  main

main
		LDR     R0, =arr        
		LDR     R1, =len       
		LDR     R1, [R1] 
		BL		reverse_array
STOP
		B		STOP
		
reverse_array
		PUSH	{R2-R5, LR}
		SUBS    R2, R1, #1               
		ADD     R2, R0, R2, LSL #2        

loop
		CMP     R0, R2  ;compare addresses          
		BHS     done              

		LDR     R3, [R0]         
		LDR     R4, [R2]          
		STR     R4, [R0]          
		STR     R3, [R2]          

		ADDS    R0, R0, #4        
		SUBS    R2, R2, #4        
		B       loop
done
		POP		{R2-R5, LR}
		BX		LR

		AREA    data, DATA, READWRITE
arr   	DCD     1, 2, 3, 4    	
len  	DCD     4              

		END
