
* 汇编器的源码路径：
  - github.com/golang/go/src/cmd/asm/main.go
* arm64 汇编的解析代码：
  - github.com/golang/go/src/cmd/asm/internal/arch/arm64.go
* arm64 的汇编指令列表
  - github.com/golang/go/src/cmd/internal/obj/arm64/a.out.go
* arm64 汇编的介绍文档：
  - github.com/golang/go/src/cmd/internal/obj/arm64/doc.go

# 寄存器
* arm64 没有 256 bit 寄存器
## 64 bit 寄存器
R0~R16

## 128 bit 寄存器
V0~V12

ARM64 向量寄存器可以根据需要表示为不同大小的元素，比如：

	•	V2.16B：16 个 8 位字节。
	•	V2.8H：8 个 16 位半字。
	•	V2.4S：4 个 32 位字。
	•	V2.2D：2 个 64 位双字。

# 指令
* move  src, dst  // 拷贝指令
  - MOVB
  - MOVH
  - MOVS
  - MOVD
  - VMOV V2.B[0], R12  // 128 bit 上的数据传输
* VDUP R3, V1.B16  // 复制指令，相当于 _mm_set1_epi8(0x80)
* AND a,b, dst  // 做 and 运算
* VLD1 (R9), [V1.B16]  // load 执行，不区分对齐不对齐，相当于 _mm_loadu_si128


# 调试方法
macos 下：

```shell
# 启动 dlv 来运行测试用例
dlv test -- -test.v -test.timeout 30s -test.run ^Test_mm_movemask_epi8$
  b Test_mm_movemask_epi8  # 在测试函数上设置断点
  c # continue，开始执行
  n # next 下一行
  p buf  # 打印某个变量
  s # step 进入函数内调试
  regs # 显示所有寄存器
```
