		AREA 	myCode, CODE, READONLY
		EXPORT 	__main
			
__main
		LDR		r0, =0x20000000
		LDR		r1, =0x20000004
		LDR		r2, =0x20000008
		LDR		r3, =0x2000000A
		LDR		r4,	=0x2000000E
		
		MOV		r5, #2
		STR		r5, [r0]
		
		MOV		r6, #7
		STR		r6, [r1]
		
		MOV		r7, #7
		STR		r7, [r2]
		
		MOV		r8, #7
		STR		r8, [r3]
		
		MOV		r9, #7
		STR		r9, [r4]
		
		ADD		r10, r5, r6
		ADD		r10, r10, r7
		ADD		r10, r10, r8
		ADD		r10, r10, r9
		
		LDR		r11, =0x20000012
		STR		r10, [r11]
		
stop	B		stop
		END