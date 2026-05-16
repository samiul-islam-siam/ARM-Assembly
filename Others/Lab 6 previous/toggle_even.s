        AREA 	myCode, CODE, READONLY
        EXPORT 	__main

__main
        LDR     R0, =0x20000000     ; Load address of input value
		LDR		R4, =0x11115555		; little endian = 55 55 11 11
		STR		R4, [R0]
        LDR     R1, [R0]            ; Load 32-bit value from memory

        ; Mask for even bits: 0x55555555 = binary 01010101010101010101010101010101
        LDR     R2, =0x55555555     

        EOR     R5, R1, R2          ; Toggle all even bits using XOR

        LDR     R3, =0x20000004     ; Address to store the result
        STR     R5, [R3]            ; Store the toggled result

STOP    B       STOP                ; Infinite loop (stop program)

        END
