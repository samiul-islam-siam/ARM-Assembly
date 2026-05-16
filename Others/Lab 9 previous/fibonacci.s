        AREA    FIBONACCI, CODE, READONLY
        EXPORT  main

main  	
        MOV     R0, #40           ; n = 10 (find 40th Fibonacci number)
        MOV     R1, #0            ; F(0)
        MOV     R2, #1            ; F(1)

        CMP     R0, #0
        BEQ     STORE0            ; If n == 0 ? result = 0

        CMP     R0, #1
        BEQ     STORE1            ; If n == 1 ? result = 1

        SUB     R0, R0, #1        ; Adjust counter (since F(1) is known)

LOOP
        ADD     R3, R1, R2        ; F(n) = F(n-1) + F(n-2)
        MOV     R1, R2            ; Update F(n-2)
        MOV     R2, R3            ; Update F(n-1)
        SUBS    R0, R0, #1        ; Decrement counter
        BNE     LOOP              ; Repeat until n iterations done

        MOV     R0, R3            ; Result in R0
        BAL     STOP
		
STORE0
		MOV		R0, #0			  ; F(0)

STORE1
        MOV     R0, #1            ; F(1)

STOP
        B       STOP
        END
