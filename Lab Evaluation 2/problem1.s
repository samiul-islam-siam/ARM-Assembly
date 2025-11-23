        AREA 	myCode, CODE, READONLY
        EXPORT	main

main
        LDR     r0, =arr        	 ; r0 = base address of array
        LDR     r1, =len      		 ; r1 = address of length
        LDR     r1, [r1]             	 ; r1 = length of array
        BL      array_ascending         

stop    
	B       stop                 

array_ascending
        PUSH    {r2-r5, lr} 

        SUB     r1, r1, #1           ; outer loop
        MOV     r4, #0               ; i = 0

outer_loop
        CMP     r4, r1               ; if i == n-1 -> done
        BGE     done

        MOV     r5, #0               ; j = 0

inner_loop
        CMP     r5, r1
        BGE     next_outer           ; if j >= n-1, goto next i

        ADD     r2, r0, r5, LSL #2   ; address of arr[j]
        LDR     r3, [r2]             ; r3 = arr[j]
        LDR     r12, [r2, #4]        ; r12 = arr[j+1]

        CMP     r3, r12              
        BLE     no_swap              ; if arr[j] <= arr[j+1], do not swap

        ; swap arr[j] and arr[j+1]
        STR     r12, [r2]            
        STR     r3, [r2, #4]         

no_swap
        ADD     r5, r5, #1           ; j++
        B       inner_loop

next_outer
        ADD     r4, r4, #1           ; i++
        B       outer_loop

done
        POP     {r2-r5, lr}
        BX      lr                  

        AREA 	myData, DATA, READWRITE
arr     DCD  	0x42, 0x7, 0x15, 0x3, 0x20, 0x10   
len	DCD  	6                     				

        END
