        AREA    SEC_TO_HMS, CODE, READONLY
        ENTRY
		EXPORT 	__main
__main

        ; Input:  R0 = total seconds
        ; Output: R1 = hours, R2 = minutes, R3 = seconds
		
		LDR		R0, =86461

        LDR     R4, =3600          ; Number of seconds in 1 hour
        LDR     R5, =60            ; Number of seconds in 1 minute

        ; Calculate hours = total_seconds / 3600
        UDIV    R1, R0, R4         ; R1 = R0 / R4

        ; Calculate remainder_seconds = total_seconds % 3600
        MLS     R6, R1, R4, R0     ; R6 = R0 - (R1 * 3600)

        ; Calculate minutes = remainder_seconds / 60
        UDIV    R2, R6, R5         ; R2 = R6 / 60

        ; Calculate seconds = remainder_seconds % 60
        MLS     R3, R2, R5, R6     ; R3 = R6 - (R2 * 60)

END_LOOP
        B       END_LOOP

        END
