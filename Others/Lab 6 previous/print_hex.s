		AREA 	myCode, CODE, READONLY
		EXPORT 	__main
__main
		LDR		r0, =0 ;counter
		LDR		r1, =0x20000000 ; address for storing
loop	
		CMP		r0, #16
		BEQ		stop
		
		STR		r0, [r1], #4
		ADD		r0, r0, #1
		BAL		loop
stop
		B		stop
		END