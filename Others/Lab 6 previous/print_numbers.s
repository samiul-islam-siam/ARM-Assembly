		AREA 	myCode, CODE, READONLY
		EXPORT 	__main
__main
		LDR		r0, =0x98 ;starting value of the range
		LDR		r1, =0x20000000 ; address for storing
loop	
		CMP		r0, #0xA5
		BEQ		stop
		
		STR		r0, [r1], #4
		ADD		r0, r0, #1
		BAL		loop
stop
		STR		r0, [r1]
		B		stop
		END