判断一个 int64 数组是否是升序排列的


# debug 方法

```bash
go test -c -gcflags=all="-N -l" -o testbin is_sorted

gdb ./testbin

(gdb) break is_sorted.IsSorted  # 或者在函数上 break
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
