			AREA    palin, CODE, READONLY
			EXPORT  main

main
			LDR     R0, =string          ; R0 ? start of string
			MOV     R1, R0               ; R1 = copy for scanning

find_end
			LDRB    R2, [R1]             ; load byte from string
			CMP     R2, #0               ; check for null terminator
			BEQ     got_end
			ADDS    R1, R1, #1           ; advance pointer
			B       find_end

got_end
			SUBS    R1, R1, #1           ; R1 ? last character (before '\0')

pal_check
			CMP     R0, R1               ; done when start >= end
			BHS     palindrome           

			LDRB    R2, [R0]             ; R2 = *start
			LDRB    R3, [R1]             ; R3 = *end
			CMP     R2, R3               ; compare characters
			BNE     not_palindrome       ; mismatch ? not palindrome

			ADDS    R0, R0, #1           ; move start forward
			SUBS    R1, R1, #1           ; move end backward
			B       pal_check

palindrome
			MOVS    R4, #1               ; R4 = 1 means palindrome
			B       done

not_palindrome
			MOVS    R4, #0               ; R4 = 0 means NOT palindrome

done
			B       done 


			AREA    data, DATA, READWRITE

string      DCB     "HELLO", 0        ; "MADAM"

			END
