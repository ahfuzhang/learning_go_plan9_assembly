// 在线工具生成的汇编代码
//  https://godbolt.org/
// x86-64 gc 1.24.2
// 汇编格式居然是 plan9 汇编


        TEXT    command-line-arguments.IsSorted2(SB), NOSPLIT|NOFRAME|ABIInternal, $0-24
        MOVQ    AX, command-line-arguments.a+8(FP)  // ax = start ???
        FUNCDATA        $0, gclocals·2NSbawKySWs0upw55xaGlw==(SB)
        FUNCDATA        $1, gclocals·ISb46fRPFoZ9pIfykFK/kQ==(SB)
        FUNCDATA        $5, command-line-arguments.IsSorted2.arginfo1(SB)
        FUNCDATA        $6, command-line-arguments.IsSorted2.argliveinfo(SB)
        PCDATA  $3, $1
        CMPQ    BX, $9  // len(a) >= 9,, bx = len(a)
        JLT     command-line-arguments_IsSorted2_pc23
        LEAQ    -1(BX), DX  // dx = len(a) - 1
        ANDQ    $-8, DX  // alignLen = dx & (-8)
        XORL    SI, SI  // i = 0
        JMP     command-line-arguments_IsSorted2_pc69
command-line-arguments_IsSorted2_pc23:  // 总长度小于 9 的情况
        // 开始逐个元素比较
        XORL    CX, CX  // cx = 0,
        JMP     command-line-arguments_IsSorted2_pc32
command-line-arguments_IsSorted2_pc27:  // 这里是废代码啊，为什么要生成?
        INCQ    CX
        NOP
command-line-arguments_IsSorted2_pc32:
        // 开始逐个元素比较
        CMPQ    BX, CX  // if i>= len then goto
        JLE     command-line-arguments_IsSorted2_pc59
        TESTQ   CX, CX
        JLE     command-line-arguments_IsSorted2_pc27
        MOVQ    (AX)(CX*8), DX
        MOVQ    -8(AX)(CX*8), SI
        CMPQ    SI, DX
        JLE     command-line-arguments_IsSorted2_pc27
        XORL    AX, AX
        RET
command-line-arguments_IsSorted2_pc59:
        MOVL    $1, AX
        RET
command-line-arguments_IsSorted2_pc65:
        ADDQ    $8, SI
command-line-arguments_IsSorted2_pc69:  // 总长度大于 9 的情况
        MOVQ    (AX)(BX*8), DX  //  ax = start, bx=len, dx = alignLen  // 猜测是结束位置的指针
        MOVQ    -8(AX)(BX*8), SI  // 错开 8 字节, si = i
        CMPQ    SI, DX  // if i>= alignLen then goto
        JGE     command-line-arguments_IsSorted2_pc204
        MOVQ    (AX)(SI*8), DI  // a[i]
        MOVQ    8(AX)(SI*8), R8  // a[i+1]
        CMPQ    R8, DI
        JLT     command-line-arguments_IsSorted2_pc201   // 编译器自作聪明，没有生成连续计算的代码
        MOVQ    8(AX)(SI*8), DI
        MOVQ    16(AX)(SI*8), R8
        CMPQ    R8, DI
        JLT     command-line-arguments_IsSorted2_pc201
        MOVQ    16(AX)(SI*8), DI
        MOVQ    24(AX)(SI*8), R8
        CMPQ    R8, DI
        JLT     command-line-arguments_IsSorted2_pc201
        MOVQ    24(AX)(SI*8), DI
        MOVQ    32(AX)(SI*8), R8
        CMPQ    R8, DI
        JLT     command-line-arguments_IsSorted2_pc201
        MOVQ    32(AX)(SI*8), DI
        MOVQ    40(AX)(SI*8), R8
        CMPQ    R8, DI
        JLT     command-line-arguments_IsSorted2_pc201
        MOVQ    40(AX)(SI*8), DI
        MOVQ    48(AX)(SI*8), R8
        CMPQ    R8, DI
        JLT     command-line-arguments_IsSorted2_pc201
        MOVQ    48(AX)(SI*8), DI
        MOVQ    56(AX)(SI*8), R8
        CMPQ    R8, DI
        JLT     command-line-arguments_IsSorted2_pc201
        MOVQ    56(AX)(SI*8), DI
        MOVQ    64(AX)(SI*8), R8
        CMPQ    R8, DI
        JGE     command-line-arguments_IsSorted2_pc65
command-line-arguments_IsSorted2_pc201:
        XORL    AX, AX
        RET
command-line-arguments_IsSorted2_pc204:  // 结束 64 字节对齐
        MOVQ    DX, SI
        SUBQ    CX, DX
        MOVQ    SI, CX
        SHLQ    $3, SI
        SARQ    $63, DX
        ANDQ    SI, DX
        ADDQ    DX, AX
        SUBQ    CX, BX
        JMP     command-line-arguments_IsSorted2_pc23
