        AREA 	myCode, CODE, READONLY
        EXPORT 	__main
__main
        LDR     R0, =0x20000000     ; R0 points to input value
		
		LDR		R4, =0xF0F0F0F0
		STR		R4, [R0]
		
		LDR     R1, [R0]            ; Load 32-bit input into R1
		
        MOV     R2, #0              ; R2 = counter (number of set bits)
        MOV     R3, #32             ; R3 = loop counter (32 bits total)

COUNT_LOOP
        TST     R1, #1              ; Test least significant bit
        ADDNE   R2, R2, #1          ; If bit is 1, increment counter
        LSR     R1, R1, #1          ; Logical shift right by 1
        SUBS    R3, R3, #1          ; Decrement bit counter
        BNE     COUNT_LOOP          ; Repeat until all 32 bits processed

        ; Store result
        LDR     R0, =0x20000004     ; Address to store result
        STR     R2, [R0]            ; Store count of 1s

STOP    B       STOP                ; Infinite loop to stop program
        END
