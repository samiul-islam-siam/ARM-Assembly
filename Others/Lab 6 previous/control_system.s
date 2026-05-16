        AREA    myCode, CODE, READONLY
        EXPORT  __main
__main
        ; --------------------------------------
        ; Simulate memory inputs (for testing)
        ; --------------------------------------
        LDR     R0, =0x20000000
        LDR     R1, =30              ; Battery = 30%
        STR     R1, [R0]

        LDR     R2, =0x20000004
        LDR     R3, =1               ; Load = Heavy
        STR     R3, [R2]

        ; --------------------------------------
        ; Load inputs from memory
        ; --------------------------------------
        LDR     R1, [R0]             ; R1 = BATTERY_LEVEL
        LDR     R3, [R2]             ; R3 = LOAD_STATUS

        ; --------------------------------------
        ; Check for LOW-POWER mode
        ; Condition: Battery < 20 AND Load = Heavy
        ; --------------------------------------
        CMP     R1, #20
        BGE     CHECK_HIGH_PERF      ; If Battery >= 20, skip low-power check

        CMP     R3, #1
        BNE     CHECK_HIGH_PERF      ; If Load != Heavy, skip low-power

        ; Low-power condition met
        LDR     R4, =0x20000008
        MOV     R5, #1               ; MODE = 1 (Low-power)
        STR     R5, [R4]
        B       STOP                 ; Done

; --------------------------------------
; Check for HIGH-PERFORMANCE mode
; Condition: Battery > 80
; --------------------------------------
CHECK_HIGH_PERF
        CMP     R1, #80
        BLE     NORMAL_MODE          ; If Battery <= 80, go to normal

        LDR     R4, =0x20000008
        MOV     R5, #3               ; MODE = 3 (High-performance)
        STR     R5, [R4]
        B       STOP                 ; Done

; --------------------------------------
; Normal mode (default)
; --------------------------------------
NORMAL_MODE
        LDR     R4, =0x20000008
        MOV     R5, #2               ; MODE = 2 (Normal)
        STR     R5, [R4]

STOP    B       STOP
        END
