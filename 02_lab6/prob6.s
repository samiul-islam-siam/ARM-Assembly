        AREA 	myCode, CODE, READONLY
        EXPORT	main

main
        LDR     r0, =arr        
        LDR     r1, =len    
        LDR     r1, [r1]            
        BL      odd_even             
        
        LDR     r2, =even
        STR     r3, [r2]             
        LDR     r2, =odd
        STR     r4, [r2]            

STOP    
		B       STOP              

odd_even
        PUSH    {r2, r5, lr}         

        MOV     r3, #0	;even count               
        MOV     r4, #0	;odd count           
        MOV     r2, #0  ;counter            

loop
        CMP     r2, r1               
        BEQ     done

        ADD     r5, r0, r2, LSL #2   
        LDR     r5, [r5]             

        ANDS    r5, r5, #1           
        BEQ     even_num             
        ADD     r4, r4, #1          
        B       next

even_num
        ADD     r3, r3, #1          

next
        ADD     r2, r2, #1          
        B       loop

done
        POP     {r2, r5, lr}
        BX      lr                  

        AREA 	myData, DATA, READWRITE
arr    	DCD  	10, 21, 32, 43, 54, 65, 76
len  	DCD  	7
even  	DCD  	0
odd   	DCD  	0

        END
