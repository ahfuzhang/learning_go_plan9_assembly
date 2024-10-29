#include "textflag.h"

TEXT ·_mm_movemask_epi8(SB), NOSPLIT | NOFRAME, $0-10
    // 栈帧长度  0
    // 参数 8 字节
    // 返回值 2 字节
	MOVD ptr+0(FP), R1
    //
    VLD1 (R1), [V1.B16]  // _mm_loadu_si128, 不区分对齐还是不对齐
    VUSHR $7, V1.B16, V1.B16 // 右移七位
    // Vector Unsigned Shift Right and Accumulate
    VUSRA $7, V1.H8, V1.H8  // 按照 16 bit 的单位右移并相加
    VUSRA $14, V1.S4, V1.S4  // 按照 32 bit 的单位右移并相加
    VUSRA $28, V1.D2, V1.D2  // 按照 64 bit 的单位右移并相加
    VMOV V1.B[0], R12  // 8 bit to R12
    VMOV V1.B[8], R13  // 8 bit to R13
    LSL $8, R13, R13  // r13 <<= 8
    ORR R12, R13, R13  // r13 |= R12
    MOVH R13, ret1+8(FP)
    RET
