    AREA 	ShiftOps, CODE, READONLY
    EXPORT 	main

main

	LDR 	R0, =0xF0000010
	
    ; Logical Shift Right
    	LSR   	R1, R0, #2 ; R2 = R0 >> 2

    ; Arithmetic Shift Right
    	ASR   	R2, R0, #2 ; R3 = R0 >> 2, preserves the sign bit

    ; Logical Shift Left
    	LSL   	R3, R0, #2 ; R4 = R0 << 2

Stop
	B		Stop
    	END
