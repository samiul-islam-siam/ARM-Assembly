		AREA 	myCode, CODE, READONLY
		EXPORT 	__main
			
__main
		LDR		r0, =0x20000000
		LDR		r1, =0x20000004
		LDR		r2, =0x20000008
		
		MOV		r3, #2
		STR		r3, [r0]
		
		MOV		r4, #7
		STR		r4, [r1]
		
		CMP		r3, r4
		BLT		store
		STR		r3, [r2]
		
store
		STR		r4, [r2]
		
stop	B		stop
		END