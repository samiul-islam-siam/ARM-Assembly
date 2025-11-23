			AREA    sum, CODE, READONLY
			EXPORT  main

main
			LDR     R0, =arrayA        ; R0 ? address of first array
			LDR     R1, =arrayB        ; R1 ? address of second array
			LDR     R2, =result        ; R2 ? address of result array
			LDR     R3, =length        ; R3 ? address of length
			LDR     R3, [R3]           ; R3 = length (N)

			CMP     R3, #0
			BEQ     done               ; if length == 0, skip

sum_loop
			LDR     R4, [R0], #4       ; R4 = *A; A++
			LDR     R5, [R1], #4       ; R5 = *B; B++
			ADDS    R6, R4, R5         ; R6 = R4 + R5
			STR     R6, [R2], #4       ; *result = R6; result++

			SUBS    R3, R3, #1         ; decrement counter
			BNE     sum_loop

done
			B       done

			AREA    data, DATA, READWRITE

arrayA      DCD     1, 2, 3, 4, 5
arrayB      DCD     10, 20, 30, 40, 50
result      DCD     0, 0, 0, 0, 0
length      DCD     5

			END
