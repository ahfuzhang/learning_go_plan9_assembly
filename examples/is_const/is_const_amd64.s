#include "textflag.h"

TEXT ·IsConst(SB), NOSPLIT | NOFRAME, $0-25
    // 栈帧长度  0
    // 参数 24 字节
    // 返回值 1 字节
    MOVQ inPtr+0(FP), R8  // current
    MOVQ inLen+8(FP), R9  // count
    // 局部变量
    MOVQ R9, R10
    ANDQ $-4, R10  // 最后 2 bit 清零, align_len = count & -4
    LEAQ (R8)(R10*8), R11  // align_4_end = in + align_len
    MOVQ (R8), R12  // first_value = *current
    VPBROADCASTQ R12, Y1  // Y1 = [first_value,first_value,first_value,first_value]
align_4:
    CMPQ R8, R11  // if current==align_4_end then goto label_align_4_end
    JE align_4_end
    VMOVDQU (R8), Y0  // load_u, 256 bit, 4 x int64
    ADDQ  $32, R8  // current += 32
    VPCMPEQQ Y0, Y1, Y2  // y2 = y0==y1
    VMOVMSKPD Y2, R13  // move mask
    CMPQ R13, $15  // if mask!=15 then goto not_const
    JE align_4
    // 不等
    MOVB $0, ret+24(FP)  // return 0
    VZEROUPPER
    RET
align_4_end:
    MOVQ R9, R10
    ANDQ $3, R10  // left_count = count & 3
    LEAQ (R8)(R10*8), R11  // end
align_1:
    CMPQ R8, R11
    JEQ end  // if current==end then goto end
    MOVQ (R8), R13 // r13 = *current
    ADDQ $8, R8  // current += 1
    CMPQ R12,R13
    JEQ align_1
    // 不等
    MOVB $0, ret+24(FP)  // return 0
    VZEROUPPER
    RET
end:
    MOVB $1, ret+24(FP)  // return 1
    VZEROUPPER
    RET
