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
       // R11 不再使用
    // 每次处理  16  字节
    MOVQ R9, R13  // 备份  len
    ANDQ $0x0f, R13  // 取模 16  // tailLen = len & 0x0f
    LEAQ (R8)(R9*1), R14  // end = in + len
    MOVQ R14, R9  // R9 = real_end
    SUBQ R13, R14  // end -= tailLen
    // 准备一个用来做掩码的寄存器
    // VMOVDQU indexMask(SB),Y6
    VMOVDQA indexMask(SB),Y6  // 对齐加载
    //VPXOR Y5, Y5, Y5
    VPXOR X5, X5, X5  // 低 128 bit 置  0  就够了
    VPCMPEQD Y7, Y7, Y7  // 全部为 1
    //VPCMPEQD Y4, Y4, Y4  // 全部为 1
    // 开始  16 字节的处理
start:
    CMPQ R8, R14  // if cur==end
    JE tail
    // 循环体
        MOVOU (R8), X3  // 非对齐的加载 8 bit * 16 数据  // _mm_loadu_si128
        VPMOVZXBD X3, Y0  //  8 个 8bit, 变成 8 个  32 bit  // _mm256_cvtepu8_epi32
        //VPCMPEQD Y4, Y4, Y4  // 全部为 1
        VMOVDQA Y7, Y4  // 看下赋值会不会比比较指令更快
        BYTE $0xc4; BYTE $0xc2; BYTE $0x5d; BYTE $0x90; BYTE $0x0c; BYTE $0x84;  // VPGATHERDD %ymm4, (%r12,%ymm0,4), %ymm1;
        // 处理后面 8 字节
        //VPSRLDQ $8, X3, X3  // X0 >>= 64  // src = _mm_srli_si128(src, 8);
        MOVHLPS X3, X3
        //
        VPMOVZXBD X3, Y0  // 8 个 8bit, 变成 8 个  32 bit  // _mm256_cvtepu8_epi32
        //VPCMPEQD Y4, Y4, Y4  // 全部为 1, 神奇，计算完成后，这个寄存器全部变 0
        VMOVDQA Y7, Y4  // 看下赋值会不会比比较指令更快
        BYTE $0xc4; BYTE $0xc2; BYTE $0x5d; BYTE $0x90; BYTE $0x14; BYTE $0x84;  // VPGATHERDD %ymm4, (%r12,%ymm0,4), %ymm2;
        // 进行压缩
        // __m256i found16 = _mm256_packus_epi32(foundHead, foundTail);  // 16 个  16 位的值
        VPACKUSDW Y1, Y2, Y0  // Y1 = pack(Y1, Y2)
        // found16 =  _mm256_permutevar8x32_epi32 (found16, index_mask)  // 交换位置
        VPERMD Y0, Y6, Y3   // Y1 = change_index(Y1, Mask)
        // found16 =  _mm256_packus_epi16(found16, _mm256_setzero_si256());
        VPACKUSWB Y3, Y5, Y0
        // found16 =  _mm256_permutevar8x32_epi32 (found16, index_mask);
        VPERMD Y0, Y6, Y1   // Y1 = change_index(Y1, Mask)
        // __m128i result = _mm256_castsi256_si128(found16);
        // X1 = Y1
        //_mm_storeu_si128 (out, result);
        VMOVDQU X1, (R10)
        ADDQ $16, R8  // start += 16
        ADDQ $16, R10  // out += 16
    // 循环体结束
    JMP  start
    // 下面开始处理剩下的字节数
tail:
    // cur = R8
    // end = R9
    // table = R12
    CMPQ R8, R9  // if cur==end
    JE done
    // 循环体
        MOVBQZX (R8), R13   // R13 = *in  // MOVB 也可以
        INCQ R8  // in++
        LEAQ (R12)(R13*4), R11;
        MOVBQZX (R11), R13;
        MOVB R13, (R10);
        INCQ R10;
    // 循环体结束
    JMP  tail
done:
    RET
