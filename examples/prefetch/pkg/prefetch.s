
#include "textflag.h"

TEXT ·PrefetchT1(SB), NOSPLIT | RODATA , $0-16
    // 栈帧长度  0
    // 参数 16 字节
    //  返回值  0 字节
    //
    MOVQ ptr+0(FP), R1
    MOVQ len+8(FP), R2
    //
    ADDQ R2, R1, R3  // r3 = end
start:
    CMPQ R3, R1  // if ptr==end
    JGE done
    // 循环体
        PREFETCHT0 (R1)
        ADDQ $64, R1
    // 循环体结束
    JMP  start
done:
    RET

TEXT ·PrefetchT2(SB), NOSPLIT | RODATA , $0-16
    // 栈帧长度  0
    // 参数 16 字节
    //  返回值  0 字节
    //
    MOVQ ptr+0(FP), R1
    MOVQ len+8(FP), R2
    //
    ADDQ R2, R1, R3  // r3 = end
start:
    CMPQ R3, R1  // if ptr==end
    JGE done
    // 循环体
        PREFETCHT1 (R1)
        ADDQ $64, R1
    // 循环体结束
    JMP  start
done:
    RET


TEXT ·PrefetchT3(SB), NOSPLIT | RODATA , $0-16
    // 栈帧长度  0
    // 参数 16 字节
    //  返回值  0 字节
    //
    MOVQ ptr+0(FP), R1
    MOVQ len+8(FP), R2
    //
    ADDQ R2, R1, R3  // r3 = end
start:
    CMPQ R3, R1  // if ptr==end
    JGE done
    // 循环体
        PREFETCHT2 (R1)
        ADDQ $64, R1
    // 循环体结束
    JMP  start
done:
    RET
