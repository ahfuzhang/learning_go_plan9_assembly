#include "textflag.h"

TEXT ·IsASCII(SB), NOSPLIT | NOFRAME, $0-17
    // 栈帧长度  0
    // 参数 16 字节
    // 返回值 1 字节
    MOVQ inPtr+0(FP), R8  // start
    MOVQ inLen+8(FP), R9
    // 局部变量
    LEAQ (R8)(R9*1), R10  // end = in + len
    XORQ R11, R11  // offset = 0
    MOVQ R9, R12  // left_len = len
align_32:
    CMPQ R12, $31
    JLE align_32_end
    VMOVDQU (R8)(R11*1), Y0  // load_u, 256 bit
    VPMOVMSKB Y0, R13  // move mask
    ADDQ $32, R11  // offset += 32
    ADDQ $-32, R12  // left_len -= 32
    TESTQ R13, R13  // mask!= 0
    JE align_32
    MOVB $0, ret+16(FP)  // return 0
    VZEROUPPER
    RET
align_32_end:
    LEAQ (R8)(R11*1), R12  // current
next_char:
    CMPQ R12, R10
    JEQ end  // if current==end then goto end
    MOVQ $0, R13 // 寄存器先清零
    MOVB (R12), R13  // r13 = str[i]
    CMPQ R13,$127
    JA not_ascii_end
    ADDQ $1, R12  // cur += 1
    JMP next_char
end:
    MOVB $1, ret+16(FP)  // return 1
    VZEROUPPER
    RET
not_ascii_end:
    MOVB $0, ret+16(FP)  // return 1
    VZEROUPPER
    RET
