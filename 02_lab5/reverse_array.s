		AREA    reverse, CODE, READONLY
		EXPORT  main

main
		LDR     R0, =array        ; R0 = pointer to start of array
		LDR     R1, =length       ; R1 = address of length variable
		LDR     R1, [R1]          ; R1 = length (N)
		SUBS    R1, R1, #1        ; R1 = N - 1 (index of last element)
		LSL     R2, R1, #2        ; R2 = (N-1)*4 = byte offset of last element
		ADD     R2, R0, R2        ; R2 = pointer to end of array

reverse_loop
		CMP     R0, R2            ; compare start and end pointers
		BHS     done              ; if start >= end, stop

		; Swap *R0 and *R2
		LDR     R3, [R0]          ; R3 = *R0
		LDR     R4, [R2]          ; R4 = *R2
		STR     R4, [R0]          ; *R0 = R4
		STR     R3, [R2]          ; *R2 = R3

		ADDS    R0, R0, #4        ; R0 += 4  (next element)
		SUBS    R2, R2, #4        ; R2 -= 4  (previous element)
		B       reverse_loop

done
		B       done              

		AREA    data, DATA, READWRITE

array   DCD     1, 2, 3, 4, 5    ; Array
length  DCD     5                ; Number of elements

		END
