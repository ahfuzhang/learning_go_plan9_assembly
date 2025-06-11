#include "textflag.h"

// ?? 当使用了局部变量后，是不是不应该使用 NOFRAME 这个声明
TEXT ·StackAlloc(SB), NOSPLIT | RODATA | NOPTR | NOFRAME, $0-8
    // 栈帧长度  0
    // 参数  8 字节
    // 返回值 0 字节
    MOVQ  size+0(FP), R8  // R8 = a
    //
    SUBQ R8, SP  // 栈顶指针走向小地址，相当于压栈
    MOVQ $0x12345678, (SP)  // 在局部变量里写入数据
    MOVQ R8, 8(SP)
    //
    ADDQ R8, SP  // 栈顶指针走向大地址，相当于出栈
    RET

TEXT ·GetStackPointerAddress(SB), NOSPLIT | RODATA | NOPTR | NOFRAME, $0-8
    // 栈帧长度  0
    // 参数  0 字节
    // 返回值 8 字节
    MOVQ SP,ret+0(FP)
    RET
