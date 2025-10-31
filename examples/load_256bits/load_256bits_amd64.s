#include "textflag.h"

TEXT ·Load256Bits(SB), NOSPLIT | NOFRAME, $0-25
    // 栈帧长度  0
    // 参数 24 字节
    // 返回值 1 字节
    MOVQ inPtr+0(FP), R8  // current
    MOVQ inLen+8(FP), R9  // count
    // 参数检查
    ADDQ $8, R8  // current += 8
    // 实验 1
    VMOVDQU -8(R8), Y1  // y1 = [a,b,c,d]
    //VMOVDQU Y1, 0(SP)
    VMOVDQU (R8), Y2    // y2 = [b,c,d,e]
    //VMOVDQU Y2, 0(SP)
    //
    MOVQ -8(R8), R12
    MOVQ R12, X0
    //VMOVDQA X0, Y5  // Y5 = [1, ?, ?, ?]
    VPXOR      Y5, Y5, Y5          // 清空 Y5
    VINSERTI128 $0, X0, Y5, Y5     // 插入 X0 到低位  // y5 = [a, 0, 0, 0]
    //VMOVDQU Y5, 0(SP)
    //
    VPERMQ   $0x90, Y2, Y6
    //VMOVDQU Y6, 0(SP)
    VPBLENDD $0x03, Y5, Y6, Y7  // y7 = [1,2,3,4]
    //VMOVDQU Y7, 0(SP)
    //VMOVDQU Y1, 0(SP)
    //
    // VBLENDPD $0x01, Y5, Y2, Y6
    // VMOVDQU Y6, 0(SP)
    // //
    // VMOVDQU Y2, Y7  // y7 = y2
    // VMOVDQU Y7, 0(SP)
    // VPXOR Y9, Y9, Y9
    // VPSRLDQ $8, Y7, Y7  // y7 = [0,b,c,d]
    // VMOVDQU Y7, 0(SP)
    // VPBLENDD $12, Y7, Y9, Y7
    // VMOVDQU Y7, 0(SP)
    // VPBLENDD $3, Y5, Y7, Y8  // y8 = [a,b,c,d]
    // VMOVDQU Y7, 0(SP)
    // //
    VPXOR Y7, Y1, Y8
    VPTEST Y8, Y8
    JZ right_data
    MOVB $0, ret+24(FP)  // return 0
    VZEROUPPER
    RET    
    //
right_data:    
    MOVB $1, ret+24(FP)  // return 1
    VZEROUPPER
    RET

TEXT ·Set256Bits(SB), NOSPLIT | NOFRAME, $0-25
    // 栈帧长度  0
    // 参数 24 字节
    // 返回值 1 字节
    MOVQ inPtr+0(FP), R8  // current
    MOVQ inLen+8(FP), R9  // count
    // 参数检查
    ADDQ $8, R8  // current += 8
    // 实验 1
    VMOVDQU -8(R8), Y1  // y1 = [a,b,c,d]
    //VMOVDQU Y1, 0(SP)
    VMOVDQU (R8), Y2    // y2 = [b,c,d,e]
    //
    // y2 = [b,c,d,e]  →  y3 = [e,0,0,0]
    VPERM2I128 $0x81, Y2, Y2, Y3   // 低128 <- Y2的高128([d,e])；高128 <- 置零
    VPSRLDQ    $8,    Y3,      Y3  // 每个128-bit半寄存器右移8字节: [d,e]→[e,0]；高128保持0
    VMOVDQU Y3, 0(SP)
    MOVB $1, ret+24(FP)  // return 1
    VZEROUPPER
    RET
