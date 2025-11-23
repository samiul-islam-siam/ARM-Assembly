        AREA    myCode, CODE, READONLY
        EXPORT  main
main    
        LDR     r0, =arr          
        LDR     r1, =len
        LDR     r1, [r1]          
      
        LDR     r3, [r0], #4      ; r3 = min = first element
        MOV     r4, r3            ; r4 = max = same first element
		
		BL		find_min_max
STOP
		B		STOP
		
find_min_max
		PUSH	{r2, r5, lr}
        MOV     r2, #1            ; counter = i = 1
        
loop    
        CMP     r2, r1            
        BEQ     done
        
        LDR     r5, [r0], #4      
        
        ; Check for max
        CMP     r5, r4
        BGT     update_max
        
        ; Check for min
        CMP     r5, r3
        BLT     update_min
        
        ADD     r2, r2, #1        ; i++
        B       loop
        
update_max
        MOV     r4, r5            ; max = r5
        ADD     r2, r2, #1
        B       loop
        
update_min
        MOV     r3, r5            ; min = r5
        ADD     r2, r2, #1
        B       loop
		
done
		POP		{r2, r5, lr}
		BX		lr

        AREA    myData, DATA, READWRITE
arr     DCD     1, 2, 3, 4, 5
len     DCD     5
        END
