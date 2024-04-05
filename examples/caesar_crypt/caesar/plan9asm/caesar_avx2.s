#include "textflag.h"

// 定义用来交换位置的索引信息
DATA indexMask+0(SB)/4, $2
DATA indexMask+4(SB)/4, $3
DATA indexMask+8(SB)/4, $6
DATA indexMask+12(SB)/4, $7
DATA indexMask+16(SB)/4, $0
DATA indexMask+20(SB)/4, $1
DATA indexMask+24(SB)/4, $4
DATA indexMask+28(SB)/4, $5
GLOBL indexMask(SB), RODATA|NOPTR, $32

TEXT ·CaesarCryptAsmAvx2(SB), NOSPLIT | NOFRAME, $0-56
    // 栈帧长度  0
    // 参数 56 字节
	MOVQ outPtr+0(FP), R10
    MOVQ inPtr+24(FP), R8
    MOVQ inLen+32(FP), R9
    MOVQ rot+48(FP), R11
    // 获取查表的位置
	MOVQ ·table(SB), R12
    SHLQ $10, R11  // 左移 10 位, 乘以 256 * 4 字节
    LEAQ (R12)(R11*1), R12  // 查表的开始位置
    // 每次处理  16  字节
    MOVQ R9, R13  // 备份  len
    ANDQ $0x0f, R13  // 取模 16  // tailLen = len & 0x0f
	MOVQ R13, R15  // r15 = tailLen
    LEAQ (R8)(R9*1), R14  // end = in + len
    //MOVQ R14, R9  // R9 = real_end
    SUBQ R13, R14  // end -= tailLen
    // 准备一个用来做掩码的寄存器
    VMOVDQA indexMask(SB),Y6  // 对齐加载
    VPXOR X5, X5, X5  // 低 128 bit 置  0  就够了
    VPCMPEQD Y7, Y7, Y7  // 全部为 1
    // 开始  16 字节的处理
align16:
    CMPQ R8, R14  // if cur==end
    JE align16_end
    // 循环体
        MOVOU (R8), X3  // 非对齐的加载 8 bit * 16 数据  // _mm_loadu_si128
        VPMOVZXBD X3, Y0  //  8 个 8bit, 变成 8 个  32 bit  // _mm256_cvtepu8_epi32
        VMOVDQA Y7, Y4  // Y4 = Y7 = 0
        BYTE $0xc4; BYTE $0xc2; BYTE $0x5d; BYTE $0x90; BYTE $0x0c; BYTE $0x84;  // VPGATHERDD %ymm4, (%r12,%ymm0,4), %ymm1;
        /*
            todo: 尝试别的写法
            	"VGATHERDPD",   // double
                "VGATHERDPS",   // float32  // 32 位索引
                "VGATHERPF0DPD",
                "VGATHERPF0DPS",
                "VGATHERPF0QPD",
                "VGATHERPF0QPS",
                "VGATHERPF1DPD",
                "VGATHERPF1DPS",
                "VGATHERPF1QPD",
                "VGATHERPF1QPS",
                "VGATHERQPD",  // 程序会根据向量寄存器中的索引值，从内存中的非连续地址加载双精度浮点数。
                "VGATHERQPS",  // 64 位索引
        */
        // 处理后面 8 字节
        MOVHLPS X3, X3
        VPMOVZXBD X3, Y0  // 8 个 8bit, 变成 8 个  32 bit  // _mm256_cvtepu8_epi32
        VMOVDQA Y7, Y4  // Y4 = Y7 = 0
        BYTE $0xc4; BYTE $0xc2; BYTE $0x5d; BYTE $0x90; BYTE $0x14; BYTE $0x84;  // VPGATHERDD %ymm4, (%r12,%ymm0,4), %ymm2;
        // 进行压缩
        VPACKUSDW Y1, Y2, Y0  // Y1 = pack(Y1, Y2)   _mm256_packus_epi32
        VPERMD Y0, Y6, Y3   // Y1 = change_index(Y1, Mask)  // _mm256_permutevar8x32_epi32  // 交换位置
        VPACKUSWB Y3, Y5, Y0  // _mm256_packus_epi16
        VPERMD Y0, Y6, Y1   // Y1 = change_index(Y1, Mask)  // _mm256_permutevar8x32_epi32
        VMOVDQU X1, (R10)   // _mm_storeu_si128
        ADDQ $16, R8  // start += 16
        ADDQ $16, R10  // out += 16
    // 循环体结束
    JMP  align16
    // 下面开始处理剩下的字节数
align16_end:

#ifdef _ALIGN8
	MOVQ R15, BX  // BX = tailLen
	ANDQ $-8, BX  // 按照 8 字节对齐
	XORQ AX, AX  // index = 0
align8:
    CMPQ AX, BX  // if index==len
    JE align1
    // 循环体
	    // 展开 0
        MOVBQZX (R8)(AX*1), R13   // R13 = *in
		MOVBQZX (R12)(R13*4), R13;
        MOVB R13, (R10)(AX*1);
	    // 展开 1
        MOVBQZX 1(R8)(AX*1), R13   // R13 = *in
		MOVBQZX (R12)(R13*4), R13;
        MOVB R13, 1(R10)(AX*1);
	    // 展开 2
        MOVBQZX 2(R8)(AX*1), R13   // R13 = *in
		MOVBQZX (R12)(R13*4), R13;
        MOVB R13, 2(R10)(AX*1);
	    // 展开 3
        MOVBQZX 3(R8)(AX*1), R13   // R13 = *in
		MOVBQZX (R12)(R13*4), R13;
        MOVB R13, 3(R10)(AX*1);
	    // 展开 4
        MOVBQZX 4(R8)(AX*1), R13   // R13 = *in
		MOVBQZX (R12)(R13*4), R13;
        MOVB R13, 4(R10)(AX*1);
	    // 展开 5
        MOVBQZX 5(R8)(AX*1), R13   // R13 = *in
		MOVBQZX (R12)(R13*4), R13;
        MOVB R13, 5(R10)(AX*1);
	    // 展开 6
        MOVBQZX 6(R8)(AX*1), R13   // R13 = *in
		MOVBQZX (R12)(R13*4), R13;
        MOVB R13, 6(R10)(AX*1);
	    // 展开 7
        MOVBQZX 7(R8)(AX*1), R13   // R13 = *in
		MOVBQZX (R12)(R13*4), R13;
        MOVB R13, 7(R10)(AX*1);

		ADDQ $8, AX  // index += 8
    // 循环体结束
    JMP  align8
align1:
	//MOVQ R15, BX  // bx = tailLen
	//SUBQ AX, BX   // bx -= ax
start:
    CMPQ AX, R15  // if index==len
    JE done
    // 循环体
        MOVBQZX (R8)(AX*1), R13   // R13 = *in
		MOVBQZX (R12)(R13*4), R13;
        MOVB R13, (R10)(AX*1);
		INCQ AX  // index++
    // 循环体结束
    JMP  start
#else

	XORQ AX,AX
start:
    CMPQ AX, R15  // if index==len
    JE done
    // 循环体
        MOVBQZX (R8)(AX*1), R13   // R13 = *in
		MOVBQZX (R12)(R13*4), R13;
        MOVB R13, (R10)(AX*1);
		INCQ AX  // index++
    // 循环体结束
    JMP  start

#endif
done:
    RET
