关于凯撒加密，具体请看：https://en.wikipedia.org/wiki/Caesar_cipher
总而言之就是玩点没什么用的小心眼，把字母的顺序变化一下，让一般人类无法一眼看出来是什么。

本例子中通过这个简单的算法来展示汇编优化的过程。

各个实现方法的性能比较：(单位 mb/s， 越大越好)

* cpu 类型：Intel(R) Xeon(R) Platinum 8369B CPU @ 2.70GHz

| 名称 | 说明 | 性能(mb/s) |
| ---- | ---- | ---- |
| plan9asm.CaesarCryptAsm | go plan9 汇编实现 | 2976.7102 |
| fastcgo.CaesarCryptByFastCgo | c 实现，使用 fastcgo 调用，O3 编译优化 | 2931.4453 |
| fastcgo.CaesarCryptByFastCgoAvx512 | c 实现，使用 avx512 指令集 | 1725.3604 |
| golang.CaesarCryptBySearchTable | golang 实现，使用查表的方法 | 1595.8272 |
| fastcgo.CaesarCryptByFastCgoAvx2 | c 实现，使用 avx2 指令集<br/> **注意**: 编译器可能把某些只支持 avx2 的某些函数编译成 avx512 的指令 | 805.2319 |
| golang.CaesarCrypt | golang 实现， 未使用查表的方法 | 735.1510 |
| plan9asm.CaesarCryptAsmAvx2 | go plan9 汇编实现，使用  avx2 指令集<br/>(因为优化的意义不大，这里未深入优化) | 650.8129 |
