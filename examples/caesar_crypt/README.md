关于凯撒加密，具体请看：https://en.wikipedia.org/wiki/Caesar_cipher
总而言之就是玩点没什么用的小心眼，把字母的顺序变化一下，让一般人类无法一眼看出来是什么。

本例子中通过这个简单的算法来展示汇编优化的过程。

性能比较：(mb/s)
test data len:67111218
golang.CaesarCrypt                         733.7099
golang.CaesarCryptBySearchTable           1447.5561
fastcgo.CaesarCryptByFastCgo               414.3023
fastcgo.CaesarCryptByFastCgoAvx2           286.3520
fastcgo.CaesarCryptByFastCgoAvx512        1779.3724
plan9asm.CaesarCryptAsm                   1617.1576
plan9asm.CaesarCryptAsmAvx2               1447.2942

O3 优化版本:
golang.CaesarCrypt                         940.0897  7
golang.CaesarCryptBySearchTable           1627.6861  4
fastcgo.CaesarCryptByFastCgo              2857.1155  3
fastcgo.CaesarCryptByFastCgoAvx2          3795.6497  1
fastcgo.CaesarCryptByFastCgoAvx512        3090.8507  2
plan9asm.CaesarCryptAsm                   1623.1454  5 =>
plan9asm.CaesarCryptAsmAvx2               1443.8659  6

O3 优化版本: 减少了指令
fastcgo.CaesarCryptByFastCgoAvx512        1593.0467 5
plan9asm.CaesarCryptAsm                   2038.0284 3
plan9asm.CaesarCryptAsmAvx2               1433.8063 6
golang.CaesarCrypt                         923.4867 7
golang.CaesarCryptBySearchTable           1617.1576 4
fastcgo.CaesarCryptByFastCgo              2917.1488 2
fastcgo.CaesarCryptByFastCgoAvx2          3810.5647 1

O3, 再减少一条指令
golang.CaesarCrypt                         735.9625 7
golang.CaesarCryptBySearchTable           1621.8292 5
fastcgo.CaesarCryptByFastCgo              2873.2770 3
fastcgo.CaesarCryptByFastCgoAvx2          3782.4150 1
fastcgo.CaesarCryptByFastCgoAvx512        3080.2890 2
plan9asm.CaesarCryptAsm                   2586.4718 4
plan9asm.CaesarCryptAsmAvx2               1446.4111 6

// 循环展开
test data len:67111218
golang.CaesarCryptBySearchTable           1101.8911 6
fastcgo.CaesarCryptByFastCgo              2906.5506 4
fastcgo.CaesarCryptByFastCgoAvx2          3782.1915 1
fastcgo.CaesarCryptByFastCgoAvx512        3081.1787 2
plan9asm.CaesarCryptAsm                   2952.8141 3
plan9asm.CaesarCryptAsmAvx2               1446.5746 5
golang.CaesarCrypt                         941.3756 7
