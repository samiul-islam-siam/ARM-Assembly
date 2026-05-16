        AREA  	EmergencyBrake, CODE, READONLY
        EXPORT 	__main
__main
        ; ----------------------------
        ; Load input values from memory
        ; ----------------------------
        LDR     R0, =0x20000000     ; Address of SPEED
        LDR     R1, [R0]            ; R1 = SPEED

        LDR     R0, =0x20000004     ; Address of DISTANCE
        LDR     R2, [R0]            ; R2 = DISTANCE

        LDR     R0, =0x20000008     ; Address of BRAKE_PRESSURE
        LDR     R3, [R0]            ; R3 = BRAKE_PRESSURE

        ; ----------------------------
        ; Emergency Brake: SPEED > 80 AND DISTANCE < 100
        ; ----------------------------
        MOV     R4, #80
        CMP     R1, R4              ; Compare SPEED and 80
        BLE     CHECK_WARNING        ; If SPEED <= 80, skip to next condition

        MOV     R4, #100
        CMP     R2, R4              ; Compare DISTANCE and 100
        BGE     CHECK_WARNING        ; If DISTANCE >= 100, skip to next condition

        ; SPEED > 80 and DISTANCE < 100 ? MODE = 3
        MOV     R5, #3
        B       STORE_MODE

; ----------------------------
; Warning: DISTANCE < 100
; ----------------------------
CHECK_WARNING
        MOV     R4, #100
        CMP     R2, R4
        BGE     CHECK_NORMAL_BRAKE   ; If DISTANCE >= 100, go check brake

        ; DISTANCE < 100 ? MODE = 2
        MOV     R5, #2
        B       STORE_MODE

; ----------------------------
; Normal Brake: BRAKE_PRESSURE > 80
; ----------------------------
CHECK_NORMAL_BRAKE
        MOV     R4, #80
        CMP     R3, R4
        BLE     CHECK_IDLE           ; If BRAKE_PRESSURE <= 80, go to idle

        ; BRAKE_PRESSURE > 80 ? MODE = 1
        MOV     R5, #1
        B       STORE_MODE

; ----------------------------
; Idle: Default condition
; ----------------------------
CHECK_IDLE
        MOV     R5, #0              ; MODE = 0 (Idle)

; ----------------------------
; Store final MODE result
; ----------------------------
STORE_MODE
        LDR     R0, =0x2000000C     ; MODE output address
        STR     R5, [R0]            ; Store MODE value

STOP    B       STOP                ; Infinite loop (stop program)
        END
