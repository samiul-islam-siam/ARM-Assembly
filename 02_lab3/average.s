	AREA 	SumAvg, CODE, READONLY
	EXPORT 	main
		
main
    	LDR 	R0, =array      ; Pointer to array
    	MOV 	R1, #5          ; N = 5
    	MOV 	R2, #0          ; R2 = sum

loop
    	LDR 	R3, [R0], #4    ; Load number
    	ADD 	R2, R2, R3      ; Add to sum
	MOV 	R5, R2   	; Move sum to R5
    	SUBS 	R1, R1, #1
    	BNE 	loop		; (R1 == 0)?

    	; Compute average: R2 = sum, R1 = 5 again
    	MOV 	R1, #5
    	UDIV 	R4, R2, R1     	; R4 = average (integer division)

    	B 	.

array
    	DCD 	10, 20, 30, 40, 50

    	END
		
; sum = R2 = 150 (0x96)
; avg = R4 = 30 (0x1E)