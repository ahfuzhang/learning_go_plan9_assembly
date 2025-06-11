准备优化函数

```go
// isDeltaConst returns true if a contains counter with constant delta.
func isDeltaConst(a []int64) bool {
	if len(a) < 2 {
		return false
	}
	d1 := a[1] - a[0]
	prev := a[1]
	for _, next := range a[2:] {
		if next-prev != d1 {
			return false
		}
		prev = next
	}
	return true
}
```


# debug 方法

```bash
go test -c -gcflags=all="-N -l" -o testbin is_delta_const

gdb ./testbin

(gdb) break is_delta_const.IsDeltaConst  # 或者在函数上 break
(gdb) run

(gdb) layout asm      # 显示反汇编视图
(gdb) si              # 逐条执行（step instruction）
(gdb) x/16xb $rsp     # 查看栈
(gdb) x/16xb $rdi     # 查看参数
(gdb) info registers $ymm3 # 查看寄存器
(gdb) x/8xb $r8 # 查看寄存器(所指向的内存的值)
(gdb) p $r9  # 可以打印出寄存器的值
(gdb) p ($r11-$r8)/8  # 计算地址偏移量
(gdb) info registers ymm1 # 显示寄存器的内容
```
