尝试使用 avx2 对以下函数进行优化：

```go
// lib/encoding/encoding.go

// isConst returns true if a contains only equal values.
func isConst(a []int64) bool {
	if len(a) == 0 {
		return false
	}
	if fastnum.IsInt64Zeros(a) {
		// Fast path for array containing only zeros.
		return true
	}
	if fastnum.IsInt64Ones(a) {
		// Fast path for array containing only ones.
		return true
	}
	v1 := a[0]
	for _, v := range a {
		if v != v1 {
			return false
		}
	}
	return true
}
```

汇编代码:

```asm
is_const_avx2(long*, int):
        mov     al, 1
        cmp     esi, 2
        jl      .LBB0_7
        mov     rcx, qword ptr [rdi]
        mov     edx, esi
        and     edx, 2147483644
        je      .LBB0_2
        vmovq   xmm0, rcx
        vpbroadcastq    ymm0, xmm0
        mov     r8d, edx
        mov     edx, 1
.LBB0_9:
        vpxor   ymm1, ymm0, ymmword ptr [rdi + 8*rdx]
        vptest  ymm1, ymm1
        jne     .LBB0_10
        add     rdx, 4
        cmp     rdx, r8
        jb      .LBB0_9
        cmp     edx, esi
        jl      .LBB0_4
        jmp     .LBB0_7
.LBB0_2:
        mov     edx, 1
        cmp     edx, esi
        jge     .LBB0_7
.LBB0_4:
        mov     edx, edx
        mov     esi, esi
        dec     rsi
.LBB0_5:
        cmp     qword ptr [rdi + 8*rdx], rcx
        sete    al
        jne     .LBB0_7
        lea     r8, [rdx + 1]
        cmp     rsi, rdx
        mov     rdx, r8
        jne     .LBB0_5
.LBB0_7:
        vzeroupper
        ret
.LBB0_10:
        xor     eax, eax
        vzeroupper
        ret
```

# debug 方法

```bash
go test -c -gcflags=all="-N -l" -o testbin is_const

gdb ./testbin

(gdb) break is_const.IsConst  # 或者在函数上 break
(gdb) run

(gdb) layout asm      # 显示反汇编视图
(gdb) si              # 逐条执行（step instruction）
(gdb) x/16xb $rsp     # 查看栈
(gdb) x/16xb $rdi     # 查看参数
(gdb) info registers  # 查看寄存器
(gdb) x/8xb $r8 # 查看寄存器(所指向的内存的值)
(gdb) p $r9  # 可以打印出寄存器的值
(gdb) p ($r11-$r8)/8  # 计算地址偏移量
(gdb) info registers ymm1 # 显示寄存器的内容
```
