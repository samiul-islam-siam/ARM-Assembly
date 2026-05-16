			AREA	myCode, CODE, READONLY
			EXPORT 	main
main
			LDR		r0, =string
			LDR		r1, =0			; length
loop
			LDRB	r2, [r0], #1
			CMP		r2, #0
			BEQ		Stop
			ADD		r1, r1, #1
			BAL		loop			
Stop
			B		Stop

			AREA	myData, DATA, READWRITE
string		DCB		"pneumonoultramicroscopicsilicovolcanoconiosis", 0
	
			END