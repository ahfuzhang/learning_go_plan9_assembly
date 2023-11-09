测试使用  DATA 指令来构造全局静态数据

总结：
* `DATA`指令必须和`GLOBL`指令成对使用
  - 先用`DATA`定义数据的偏移量，字节数，初始值
  - 紧接着用`GLOBL`定义以上的 DATA 定义的数据
    - 可以声明是否只读，是否有指针
	- 需要声明变量的总字节数
* 可以分为包级别和文件级别来声明：
  - 包级别，在标识符前面加上 `·`
  - 文件级别，无需加 `·`

一个奇怪的问题：
以下方法，加载的内容全是 0
```asm
// 定义用来交换位置的索引信息
DATA indexMask<>+0(SB)/4, $2
DATA indexMask<>+4(SB)/4, $3
DATA indexMask<>+8(SB)/4, $6
DATA indexMask<>+12(SB)/4, $7
DATA indexMask<>+16(SB)/4, $0
DATA indexMask<>+20(SB)/4, $1
DATA indexMask<>+24(SB)/4, $4
DATA indexMask<>+28(SB)/4, $5
GLOBL indexMask(SB), RODATA|NOPTR, $32

TEXT ·GetIndexMask(SB), NOSPLIT | NOFRAME, $0-32
	VMOVDQU indexMask(SB),Y5
	VMOVDQU Y5,ret1+0(FP)
	RET


```

但是，只要去掉尖括号，就是对的了:
```asm
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

TEXT ·GetIndexMask(SB), NOSPLIT | NOFRAME, $0-32
	VMOVDQU indexMask(SB),Y5
	VMOVDQU Y5,ret1+0(FP)
	RET


```
