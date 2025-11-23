		AREA    MaxMin, CODE, READONLY
		EXPORT  main

main

		LDR     R0, =array        ; R0 = address of array
		LDR     R1, =length       ; R1 = address of length
		LDR     R1, [R1]          ; R1 = length (N)
		CMP     R1, #0
		BEQ     done              ; if length == 0, exit

		LDR     R2, [R0]          ; R2 = first element (min)
		MOV     R3, R2            ; R3 = first element (max)
		SUBS    R1, R1, #1        ; R1 = N - 1 (remaining)
		ADD     R0, R0, #4        ; move pointer to next element

find_loop
		CMP     R1, #0
		BEQ     finished          ; exit when done

		LDR     R4, [R0]          ; R4 = current element

		; Compare with min (R2)
		CMP     R4, R2
		BGE     check_max
		MOV     R2, R4            ; R2 = new min

check_max
		; Compare with max (R3)
		CMP     R4, R3
		BLE     next
		MOV     R3, R4            ; R3 = new max

next
		ADD     R0, R0, #4        ; move to next element
		SUBS    R1, R1, #1
		BNE     find_loop

finished
	
		; Results:
		; R2 = smallest element
		; R3 = largest element

done
		B       done        
    
		AREA    data, DATA, READWRITE

array   DCD     12, -4, 56, 23, 7, -9, 45, 0, 100
length  DCD     9

		END
