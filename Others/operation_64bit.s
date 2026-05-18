        AREA    myCode, CODE, READONLY
        EXPORT  main

; ============================================================
; FUNCTION PROTOTYPES
; ============================================================
        EXPORT  add64
        EXPORT  sub64
        EXPORT  mul64


; ============================================================
; MAIN
; ============================================================
main
        ; Load address of input A
        LDR     r0, =A_low

        ; Pass pointers to functions
        MOV     r1, r0           ; r1 = &A_low
        ADD     r2, r0, #8       ; r2 = &B_low (located after A)

        ; Call add64(A_ptr, B_ptr, ADD_result_ptr)
        LDR     r3, =ADD_low
        BL      add64

        ; Call sub64(A_ptr, B_ptr, SUB_result_ptr)
        LDR     r3, =SUB_low
        BL      sub64

        ; Call mul64(A_ptr, B_ptr, MUL_result_ptr)
        LDR     r3, =MUL_low
        BL      mul64

stop
        B       stop



; ============================================================
; FUNCTION: add64
; IN:  r1 ? pointer to A (low, high)
;      r2 ? pointer to B (low, high)
;      r3 ? pointer to result memory
; OUT: result[0] = low32, result[4] = high32
; ============================================================
add64
        LDR     r4, [r1]         ; A_low
        LDR     r5, [r1, #4]     ; A_high

        LDR     r6, [r2]         ; B_low
        LDR     r7, [r2, #4]     ; B_high

        ADDS    r8, r4, r6       ; low32
        ADC     r9, r5, r7       ; high32

        STR     r8, [r3]
        STR     r9, [r3, #4]

        BX      lr



; ============================================================
; FUNCTION: sub64
; ============================================================
sub64
        LDR     r4, [r1]         ; A_low
        LDR     r5, [r1, #4]     ; A_high

        LDR     r6, [r2]         ; B_low
        LDR     r7, [r2, #4]     ; B_high

        SUBS    r8, r4, r6       ; low32
        SBC     r9, r5, r7       ; high32

        STR     r8, [r3]
        STR     r9, [r3, #4]

        BX      lr



; ============================================================
; FUNCTION: mul64  (lower 64 bits only)
; ============================================================
mul64
        LDR     r4, [r1]         ; A_low
        LDR     r5, [r1, #4]     ; A_high

        LDR     r6, [r2]         ; B_low
        LDR     r7, [r2, #4]     ; B_high

        ; --------------- A_low * B_low -----------------
        UMULL   r8, r9, r4, r6       ; r9:r8 = low64

        ; --------------- A_low * B_high ----------------
        UMULL   r10, r11, r4, r7     ; r11:r10 = middle1
        ADDS    r9, r9, r10
        ADC     r11, r11, #0

        ; --------------- A_high * B_low ----------------
        UMULL   r12, r14, r5, r6     ; r14:r12 = middle2
        ADDS    r9, r9, r12
        ADC     r11, r11, r14

        ; Store only low 64 bits => (r8 low, r9 high)
        STR     r8, [r3]
        STR     r9, [r3, #4]

        BX      lr



; ============================================================
; DATA SECTION
; ============================================================
        AREA    myData, DATA, READWRITE

; 64-bit A
A_low   DCD     0xFFFFFFFF
A_high  DCD     0x00000002

; 64-bit B
B_low   DCD     0x00000010
B_high  DCD     0x00000003

; 64-bit result buffers
ADD_low DCD     0,0
SUB_low DCD     0,0
MUL_low DCD     0,0

        END
