
# 例子1

本例子展示了：
y1 = [a,0,0,0]
y2 = [b,c,d,e]
如何得到 y3 = [a,b,c,d]

```asm
// 提取位置 0,0,1,2
// 得到： y6 = [b,b,c,d]
VPERMQ   $0x90, Y2, Y6

// 混合 y1 和 y6， 把 y1[0] 写到 y6[0]
// 得到： y3 = [a,b,c,d]
VPBLENDD $0x03, Y1, Y6, Y3
```

# 例子2
本例子展示了：
y1 = [b,c,d,e]
如何得到：y2 = [e, 0, 0, 0]

```asm
VPERM2I128 $0x81, Y1, Y1, Y2
VPSRLDQ    $8,    Y2,      Y2
```

# 例子3

如何做到：

```go
  if y1==y2{
    return true
  } else {
    return false
  }
```

```asm
    VPXOR Y1, Y2, Y3
    VPTEST Y3, Y3
    JZ right_data
    MOVB $0, ret+24(FP)  // return 0
    VZEROUPPER
    RET    
    //
right_data:    
    MOVB $1, ret+24(FP)  // return 1
    VZEROUPPER
    RET
```


---------------------------------
~/go/bin/dlv test -- -test.run ^Test_Load256Bits_1$
break Test_Load256Bits_1
b Load256Bits
c
n
s

// VMOVDQU Y7, 0(SP)  // 寄存器的数据写入堆栈

regs 查看寄存器
Rsp = 0x000000c000126e20
x -count 4 -fmt hex 0x000000c000192e20  查看 rsp
x -count 32 -fmt hex 0x000000c00010ee20

====================
~/go/bin/dlv test -- -test.run ^Test_Set256Bits_1$
break Test_Set256Bits_1
b Set256Bits


x -count 32 -fmt hex 0x000000c00010ae20


~/go/bin/dlv test --init .dlvinit -- -test.run ^Test_Set256Bits_1$

