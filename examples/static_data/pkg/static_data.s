#include "textflag.h"

// DATA 指令里面不允许使用后面这样的 flag: RODATA|NOPTR,
DATA ·var+0(SB)/8, $0x12345678
GLOBL ·var(SB), RODATA|NOPTR, $8  // 只读，没有指针


TEXT ·Get(SB), NOSPLIT | NOFRAME, $0-8
    // 栈帧长度  0
    // 参数  0 字节
    // 返回值 8 字节
	MOVQ ·var(SB), R8
    MOVQ R8,ret+0(FP)
    RET

//--------------------------------------------------------------------------

DATA ·var1+0(SB)/8, $0x87654321
GLOBL ·var1(SB), NOPTR, $8  // 读写，没有指针


TEXT ·SetVar1(SB), NOSPLIT | NOFRAME, $0-8
    // 栈帧长度  0
    // 参数  8 字节
    // 返回值 0 字节
	MOVQ a+0(FP), R8  // R8 = a
	MOVQ R8, ·var1(SB)
    RET

TEXT ·GetVar1(SB), NOSPLIT | NOFRAME, $0-8
    // 栈帧长度  0
    // 参数  0 字节
    // 返回值 8 字节
	MOVQ ·var1(SB), R8
    MOVQ R8,ret+0(FP)
    RET

//--------------------------------------------------------------------------
// 不支持 bss 指令
// BSS ·var2+0(SB)/8

//--------------------------------------------------------------------------
// 文件级别
DATA filePrivateData<>+0(SB)/8, $0x123456789a
GLOBL filePrivateData(SB), NOPTR, $8

TEXT ·SetFilePrivateData(SB), NOSPLIT | NOFRAME, $0-8
    // 栈帧长度  0
    // 参数  8 字节
    // 返回值 0 字节
	MOVQ a+0(FP), R8  // R8 = a
	MOVQ R8, filePrivateData(SB)
    RET

TEXT ·GetFilePrivateData(SB), NOSPLIT | NOFRAME, $0-8
    // 栈帧长度  0
    // 参数  0 字节
    // 返回值 8 字节
	MOVQ filePrivateData(SB), R8
    MOVQ R8,ret+0(FP)
    RET
//--------------------------------------------------------------------------
// 测试字节对齐
DATA avx2Data<>+0(SB)/4, $0
DATA avx2Data<>+4(SB)/4, $2
DATA avx2Data<>+8(SB)/4, $3
DATA avx2Data<>+12(SB)/4, $4
DATA avx2Data<>+16(SB)/4, $5
DATA avx2Data<>+20(SB)/4, $6
DATA avx2Data<>+24(SB)/4, $7
DATA avx2Data<>+28(SB)/4, $8
GLOBL avx2Data(SB), RODATA|NOPTR, $32

TEXT ·GetAvx2DataAddress(SB), NOSPLIT | NOFRAME, $0-8
    // 栈帧长度  0
    // 参数  0 字节
    // 返回值 8 字节
	LEAQ avx2Data(SB), R8
	// test load
	VMOVDQA avx2Data(SB),Y0  // 变量是 32 字节对齐的，因此可以直接使用 _mm256_load_epi32() 来加载
	//
    MOVQ R8,ret+0(FP)
    RET
