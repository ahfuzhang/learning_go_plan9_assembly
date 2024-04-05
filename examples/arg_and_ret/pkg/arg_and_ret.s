#include "textflag.h"

TEXT ·Add(SB), NOSPLIT | RODATA | NOPTR | NOFRAME, $0-48
    // 栈帧长度  0
    // 参数+返回值长度  48 字节
    MOVQ a+0(FP), R8  // R8 = a
    ADDQ b+8(FP), R8  // R8 += b
    MOVQ c+16(FP), R9 // R9 = c
    ADDQ d+24(FP), R9 // R9 += d
    //
    MOVQ R8,ret1+32(FP)
    MOVQ R9,ret2+40(FP)
    RET
