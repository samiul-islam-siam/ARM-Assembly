		AREA 	NEW, CODE, READONLY
		EXPORT 	__main
			
__main	FUNCTION
	
		LDR		R0, =0x00 	; speed
		LDR		R1, =0x5A	; distance
		LDR		R2, =0x00	; break_pressure
		
		LDR		R3, =0x00	; default mode = 0 (idle)
		
		CMP		R0, #80		; (speed > 80) ?
		BGT		speed1
		
		CMP		R1, #100	; (distance < 100) ?
		BLT		distance
		
		CMP		R2, #80		; (break_pressure > 80) ?
		BGT		break_pressure
		
		B		STOP
		
speed1
		CMP		R1, #100	; (distance < 100) ?
		BLT		speed2
		
speed2
		LDR		R3, =0x3	; mode = 3 (emergency brake)
		B		STOP
		
distance
		LDR		R3, =0x2	; mode = 2 (warning)
		B		STOP
		
break_pressure
		LDR		R3, =0x1	; mode = 1 (normal brake)
		B		STOP
	
STOP
		B		STOP
		ENDFUNC
		END