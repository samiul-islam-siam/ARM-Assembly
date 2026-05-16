        AREA 	ParityCheck, CODE, READONLY
        EXPORT 	__main
__main
        LDR     R0, =0x20000000     ; Address of 8-bit input
		LDR		R4, =0x55
		STRB	R4, [R0]
        LDRB    R1, [R0]            ; Load 8-bit value into R1 (R1 = input)
		
        MOV     R2, #0              ; R2 = counter for 1s
        MOV     R3, #8              ; R3 = loop counter (8 bits total)

COUNT_LOOP
        TST     R1, #1              ; Test least significant bit
        ADDNE   R2, R2, #1          ; If bit is 1, increment counter
        LSR     R1, R1, #1          ; Shift right to check next bit
        SUBS    R3, R3, #1          ; Decrement loop counter
        BNE     COUNT_LOOP          ; Repeat until all 8 bits checked

        ; Check if number of 1s is even or odd
        ANDS    R2, R2, #1          ; Keep only LSB (0=even, 1=odd)

        ; Store parity result
        LDR     R0, =0x20000004     ; Address to store parity result
        STRB    R2, [R0]            ; Store 0 (even) or 1 (odd)

STOP    B       STOP                ; Infinite loop to stop program
        END
