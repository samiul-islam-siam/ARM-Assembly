        AREA 	myCode, CODE, READONLY
        EXPORT 	__main
__main
        ; Load inputs
        LDR     R0, =0x20000000     ; Address of input value
		LDR		R4, =0x12345678
		STR		R4, [R0]
        LDR     R1, [R0]            ; R1 = input value (0x12345678)

        LDR     R0, =0x20000004     ; Address of rotation amount
		LDR		R4, =0x8
		STR		R4,	[R0] 
        LDR     R2, [R0]            ; R2 = n (number of bits to rotate)

        ; Perform circular left rotation
		RSB		R4, R2, #32
        ROR     R3, R1, R4  		 ; Rotate right by (32 - n) bits
                                     ; Equivalent to rotate left by n bits

        ; Store result
        LDR     R0, =0x20000008     ; Address to store result
        STR     R3, [R0]            ; Store rotated value

STOP    B       STOP                ; Infinite loop to stop program
        END
