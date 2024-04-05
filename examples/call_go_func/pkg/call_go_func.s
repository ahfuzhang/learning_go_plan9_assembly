#include "textflag.h"

// 注意：函数的 frame size 一定要写对，否则会发生 panic
TEXT ·CallFunc(SB), NOSPLIT | RODATA | NOPTR | NOFRAME , $8-0
    // 栈帧长度  0
    // 参数 0 字节
    //  返回值  0 字节
    //
    MOVQ $0x12345678, R8
	// 压栈
	SUBQ $8, SP  // 栈顶指针走向小地址，相当于压栈
	MOVQ R8, (SP)
	CALL ·printHex(SB)
	// 出栈
	ADDQ $8, SP  // 栈顶指针走向大地址，相当于出栈

    RET
