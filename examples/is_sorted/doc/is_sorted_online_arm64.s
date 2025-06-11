        TEXT    command-line-arguments.IsSorted2(SB), LEAF|NOFRAME|ABIInternal, $0-24
        MOVD    R0, command-line-arguments.a(FP)
        FUNCDATA        $0, gclocals·2NSbawKySWs0upw55xaGlw==(SB)
        FUNCDATA        $1, gclocals·ISb46fRPFoZ9pIfykFK/kQ==(SB)
        FUNCDATA        $5, command-line-arguments.IsSorted2.arginfo1(SB)
        FUNCDATA        $6, command-line-arguments.IsSorted2.argliveinfo(SB)
        PCDATA  $3, $1
        CMP     $9, R1
        BLT     command-line-arguments_IsSorted2_pc28
        SUB     $1, R1, R3
        AND     $-8, R3, R3
        MOVD    ZR, R4
        JMP     command-line-arguments_IsSorted2_pc96
command-line-arguments_IsSorted2_pc28:
        MOVD    ZR, R2
        JMP     command-line-arguments_IsSorted2_pc40
command-line-arguments_IsSorted2_pc36:
        ADD     $1, R2, R2
command-line-arguments_IsSorted2_pc40:
        CMP     R2, R1
        BLE     command-line-arguments_IsSorted2_pc84
        CMP     $0, R2
        BLE     command-line-arguments_IsSorted2_pc36
        MOVD    (R0)(R2<<3), R3
        SUB     $1, R2, R4
        MOVD    (R0)(R4<<3), R4
        CMP     R3, R4
        BLE     command-line-arguments_IsSorted2_pc36
        MOVD    ZR, R0
        RET     (R30)
command-line-arguments_IsSorted2_pc84:
        MOVD    $1, R0
        RET     (R30)
command-line-arguments_IsSorted2_pc92:
        ADD     $8, R4, R4
command-line-arguments_IsSorted2_pc96:
        CMP     R3, R4
        BGE     command-line-arguments_IsSorted2_pc256
        LSL     $3, R4, R5
        ADD     $8, R5, R5
        MOVD    (R0)(R4<<3), R6
        MOVD    (R0)(R5), R7
        ADD     R4<<3, R0, R8
        ADD     R5, R0, R5
        CMP     R7, R6
        BGT     command-line-arguments_IsSorted2_pc248
        MOVD    8(R8), R6
        MOVD    8(R5), R7
        CMP     R6, R7
        BLT     command-line-arguments_IsSorted2_pc248
        MOVD    16(R8), R6
        MOVD    16(R5), R7
        CMP     R6, R7
        BLT     command-line-arguments_IsSorted2_pc248
        MOVD    24(R8), R6
        MOVD    24(R5), R7
        CMP     R6, R7
        BLT     command-line-arguments_IsSorted2_pc248
        MOVD    32(R8), R6
        MOVD    32(R5), R7
        CMP     R6, R7
        BLT     command-line-arguments_IsSorted2_pc248
        MOVD    40(R8), R6
        MOVD    40(R5), R7
        CMP     R6, R7
        BLT     command-line-arguments_IsSorted2_pc248
        MOVD    48(R8), R6
        MOVD    48(R5), R7
        CMP     R6, R7
        BLT     command-line-arguments_IsSorted2_pc248
        MOVD    56(R8), R6
        MOVD    56(R5), R5
        CMP     R6, R5
        BGE     command-line-arguments_IsSorted2_pc92
command-line-arguments_IsSorted2_pc248:
        MOVD    ZR, R0
        RET     (R30)
command-line-arguments_IsSorted2_pc256:
        SUB     R3, R2, R2
        NEG     R2, R2
        ASR     $63, R2, R2
        AND     R3<<3, R2, R2
        ADD     R2, R0, R0
        SUB     R3, R1, R1
        JMP     command-line-arguments_IsSorted2_pc28
