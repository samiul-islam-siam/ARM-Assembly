        AREA 	myCode, CODE, READONLY
        EXPORT 	main

main
        LDR     R0, =arr     
		LDR 	R1, =len
		LDR		R1, [R1]	
        LDR     R2, =k
		LDR		R2, [R2]		
        BL      rotate_k       

STOP    
		B       STOP           

rotate_k
        PUSH    {R4-R10, LR}

        MOV     R4, R0	; arr address          
        MOV     R5, R1  ; len         
        MOV     R6, R2  ; k     
        
        CMP     R6, R5	; compare k and len
        BLT     loop1	; if k < len
		
; if k > len		
loop2
        SUBS    R6, R6, R5
        CMP     R6, R5
        BGE     loop2
		
loop1  
        CMP     R6, #0
        BEQ     done_rotate

        LDR     R7, =temp

        MOV     R8, #0
		
copy_first_k
        CMP     R8, R6
        BGE     shift_left
        LDR     R9, [R4, R8, LSL #2]
        STR     R9, [R7, R8, LSL #2]
        ADD     R8, R8, #1
        B       copy_first_k

shift_left
        MOV     R8, #0
shift_loop
        ADD     R9, R8, R6
        CMP     R9, R5
        BGE     copy_temp
        LDR     R10, [R4, R9, LSL #2]
        STR     R10, [R4, R8, LSL #2]
        ADD     R8, R8, #1
        B       shift_loop


copy_temp
        MOV     R8, #0
copy_temp_loop
        CMP     R8, R6
        BGE     done_rotate
        LDR     R9, [R7, R8, LSL #2]
        SUB     R10, R5, R6      
        ADD     R10, R10, R8
        STR     R9, [R4, R10, LSL #2]
        ADD     R8, R8, #1
        B       copy_temp_loop

done_rotate
        POP     {R4-R10, LR}
		BX		LR

        AREA 	myData, DATA, READWRITE

arr     DCD 	1, 2, 3, 4, 5
len		DCD		5
k		DCD		2
temp    SPACE 	20       

        END
