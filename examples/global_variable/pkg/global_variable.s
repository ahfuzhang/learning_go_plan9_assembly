#include "textflag.h"

TEXT ·Get(SB), NOSPLIT | RODATA | NOPTR | NOFRAME, $0-8
    // 栈帧长度  0
    // 参数 0 字节
    //  返回值  8 字节
    //
    MOVQ ·globalVariableExample(SB),R8
    MOVQ R8,ret+0(FP)
    RET

TEXT ·Set(SB), NOSPLIT | RODATA | NOPTR | NOFRAME, $0-8
    // 栈帧长度  0
    // 参数 8 字节
    //  返回值  0 字节
    MOVQ a+0(FP), R8  // R8 = a
    MOVQ R8, ·globalVariableExample(SB)
    RET

TEXT ·GetAddress(SB), NOSPLIT | RODATA | NOPTR | NOFRAME, $0-8
    // 栈帧长度  0
    // 参数 0 字节
    //  返回值  8 字节
    //
    LEAQ ·globalVariableExample(SB),R8
    MOVQ R8,ret+0(FP)
    RET

/*
// 汇编中无法引用 golang 中的常量
TEXT ·GetConst(SB), NOSPLIT | RODATA | NOPTR | NOFRAME, $0-8
    // 栈帧长度  0
    // 参数 0 字节
    //  返回值  8 字节
    //
    MOVQ $$(valueOfXX), R8
    MOVQ R8,ret+0(FP)
    RET
*/
