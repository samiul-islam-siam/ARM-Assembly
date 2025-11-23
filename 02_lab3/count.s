        AREA 	PopCount, CODE, READONLY
        EXPORT 	main

main
        LDR     R0, =value       ; Load address of 'value'
        LDR     R0, [R0]         ; Load 32-bit value from memory into R0

        MOV     R1, #0           ; Initialize count = 0

Loop
        CMP     R0, #0           ; Check if number is zero
        BEQ     Done             ; If zero, done

        ANDS    R2, R0, #1       ; Check LSB of R0
        ADDNE   R1, R1, #1       ; If LSB == 1, increment count

        LSRS    R0, R0, #1       ; Logical shift right R0 by 1 (next bit)

        B       Loop             ; Repeat

Done
        B       Done             ; Infinite loop after done (or replace with BX LR)

; Data section
        AREA 	DataSection, DATA, READONLY
value   DCD     0xF0F0F0F0       ; Example 32-bit number

        END
