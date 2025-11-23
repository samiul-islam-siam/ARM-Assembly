        AREA    CHECKSUM, CODE, READONLY
        EXPORT  main

main
        ; Load data bytes
        MOV     R4, #0x12       
        MOV     R5, #0x34       
        MOV     R6, #0x56       
        MOV     R7, #0x78      

        ; sum of bytes including carry
        ADDS    R0, R4, R5       ; R0 = R4 + R5
        ADC     R0, R0, R6       ; R0 = R0 + R6 + carry
        ADC     R0, R0, R7       ; R0 = R0 + R7 + carry

        ; Handle final carry (if any)
        ADCS    R0, R0, #0       

        ; 1's complement of the sum
        MVN     R0, R0           

        ; Decrement checksum by 1
        SUB     R0, R0, #1       

STOP    B       STOP          

        END
