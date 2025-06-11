#include "textflag.h"

TEXT ·CaesarCryptAsm(SB), NOSPLIT | NOFRAME, $0-56
    // 栈帧长度  0
    // 参数 56 字节
	MOVQ outPtr+0(FP), R10
    MOVQ inPtr+24(FP), R8
    MOVQ inLen+32(FP), R9
    MOVQ rot+48(FP), R11
    // 获取查表的位置
	MOVQ ·table(SB), R12
    SHLQ $10, R11  // 左移 10 位
    LEAQ (R12)(R11*1), R12  // 查表的开始位置
    //
	MOVQ R9, BX
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
	MOVQ R9, BX
	MOVQ R9, AX
	ANDQ $7, BX  //  取模  8, tailLen = len % 8
	SUBQ BX, AX  // ax -= tailLen
start:
    CMPQ AX, R9  // if index==len
    JE done
    // 循环体
        MOVBQZX (R8)(AX*1), R13   // R13 = *in
		MOVBQZX (R12)(R13*4), R13;
        MOVB R13, (R10)(AX*1);
		INCQ AX  // index++
    // 循环体结束
    JMP  start
done:
    RET
