        AREA 	CompareSigned, CODE, READONLY
        EXPORT 	__main

__main
        ; Addresses for input values and result
        LDR     R0, =0x20000000     ; Address of A
        LDR     R1, =0x20000004     ; Address of B
        LDR     R2, =0x20000008     ; Address to store result
		
		MOV		R6,	#-2
		MOV		R7, #2
		
		STR		R6, [R0]
		STR		R7, [R1]

        ; Load signed integers
        LDR     R3, [R0]            ; R3 = A
        LDR     R4, [R1]            ; R4 = B

        ; Compare signed values (sets condition flags)
        CMP     R3, R4              ; Compare A and B (signed)

        ; Branch according to result
        BGT     Greater             ; if A > B
        BLT     Less                ; if A < B

Equal
        MOV     R5, #0              ; result = 0
        B       Store

Greater
        MOV     R5, #1              ; result = 1
        B       Store

Less
        MOV     R5, #-1             ; result = -1 (0xFFFFFFFF)

Store
        STR     R5, [R2]            ; Store result in memory
STOP
        B       STOP                ; Infinite loop to stop execution

        END
