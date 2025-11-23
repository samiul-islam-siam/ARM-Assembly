			AREA 		myCode, CODE, READONLY
			EXPORT		main
				
main

			LDR		r0, =0x00010000			; input = 32-bit unsigned integer
			
			LDR		r1, =32				; loop counter
			LDR		r4, =0				; result
			
			LDR		r2, =1				; value for testing bit

loop
			CMP		r1, #0
			BEQ		stop				; if r1 == 0 -> stop
			
			AND		r3, r0, r2			; check each bit
			LSR		r0, #1
			
			CMP		r3, #0				; if bit == 0 -> update counter
			BEQ		count
			
			CMP		r3, #1
			BEQ		stop				; if bit == 1 -> stop here
			
count
			ADD		r4, r4, #1			; update result
			SUB		r1, r1, #1			; update loop counter
			BAL		loop
			
stop
			B		stop
			END