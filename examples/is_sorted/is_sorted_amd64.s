#include "textflag.h"

TEXT ·IsSorted(SB), NOSPLIT | NOFRAME, $0-25
    // 栈帧长度  0
    // 参数 24 字节
    // 返回值 1 字节
    MOVQ inPtr+0(FP), R8  // current
    MOVQ inLen+8(FP), R9  // count
    // 参数检查
    //SHLQ $3, R9  // 转换为字节数
    CMPQ R9, $2
    JLT sorted  // if count<2 then goto sorted
    //CMPQ R9, $3
    //JLT end  // if count<3 then goto end
    // 局部变量
    MOVQ R9, AX
    SHLQ $3, AX  // totalBytes = count<<3
    ADDQ R8, AX  // end = current + totalBytes
    //MOVQ (R8), R12  // first_value = *current
    //MOVQ R12, BX
    ADDQ $8, R8  // current += 8
    SUBQ $1, R9  // count -= 1
    //MOVQ (R8), DX  // dx = second_value
    //SUBQ R12, DX  // delta = second_value - first_value
    MOVQ R9, R10
    ANDQ $-4, R10  // 最后 2 bit 清零, align_count = count & -4  // todo: 至少需要多一个 int64
    //CMPQ R10, $0
    //JE align_4_end  // if align_count==0 then goto align_4_end
    //CMPQ R10, R9
    //JNE next_step_1  // if align_count!=count then goto next_step_1  // aka: align_count+1 >= count
    //SUBQ $4, R10    // if align_count==count then align_count -= 4
//next_step_1:
    LEAQ (R8)(R10*8), R11  // align_4_end = current + align_count*8
    //CMPQ R9, $4
    //JLT align_4_end
    //VPBROADCASTQ R12, Y1  // Y1 = [first_value,first_value,first_value,first_value]
    //VPBROADCASTQ DX, Y0  // y0 = [delta,delta,delta,delta]
align_4:
    CMPQ R8, R11  // if current==align_4_end then goto label_align_4_end
    JE align_4_end
    VMOVDQU -8(R8), Y1  // load_u, 256 bit, 4 x int64
    VMOVDQU (R8), Y2  // load_u, 256 bit, 4 x int64
    ADDQ  $32, R8  // current += 32
    //VPSUBQ Y1, Y2, Y3  // y3 = y2 - y1
    VPCMPGTQ Y2, Y1, Y3  // 是否 y1 > y2
    VMOVMSKPD Y3, R13  // move mask
    CMPQ R13, $0  // if mask==0 then goto align_4
    JE align_4
    // not sorted
    MOVB $0, ret+24(FP)  // return 0
    VZEROUPPER
    RET
align_4_end:
    //CMPQ R8, AX
    //JEQ end  // if current==end then goto end
    MOVQ -8(R8), BX  // bx = prev
    //ADDQ $8, R8  // R8 += 8
align_1:
    CMPQ R8, AX
    JEQ sorted  // if current==end then goto end
    MOVQ (R8), R13 // r13 = *current
    //MOVQ R13, CX  // cx = *current
    ADDQ $8, R8  // current += 8
    //SUBQ BX, R13  // delta = *current - prev
    MOVQ BX, R10
    MOVQ R13, BX   // prev = *current
    CMPQ R13, R10
    JGE align_1
not_sorted:
    MOVB $0, ret+24(FP)  // return 0
    VZEROUPPER
    RET
sorted:
    MOVB $1, ret+24(FP)  // return 1
    VZEROUPPER
    RET
