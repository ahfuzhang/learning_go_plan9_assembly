尝试通过 SIMD 来优化 VictoriaLogs 中的函数：

```go
package string_utils

import (
	"unicode/utf8"
)

func isASCII(s string) bool {
	for i := range s {
		if s[i] >= utf8.RuneSelf {
			return false
		}
	}
	return true
}
```

* 在线编译网站：https://godbolt.org/

## C 代码

```c
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>
#include <sys/time.h>
#include <stdbool.h>

#include <immintrin.h>
#include <stddef.h>
#include <stdint.h>

bool is_ascii_faster(const char* str, int len) {
    const char* p = str;
    const char* end = str + len;

    // 每次处理 32 字节
    while (end - p >= 32) {
        __m256i data = _mm256_loadu_si256((const __m256i*)p);
        int bits = _mm256_movemask_epi8(data);  // 提取每个字节的 MSB 到 32 位 mask
        if (bits != 0) {
            return false;
        }
        p += 32;
    }

    // 处理剩余的字节
    while (p < end) {
        if ((unsigned char)(*p) > 127) {
            return false;
        }
        p++;
    }

    return true;
}
```

## 汇编代码

```asm
is_ascii_faster(char const*, int):
        movsxd  rcx, esi   ; len 变成 64 位
        lea     rsi, [rdi + rcx]  ; end = str + len
        xor     edx, edx  ; offset = 0
        mov     rax, rcx  ; rax = len
.LBB0_1:
        cmp     rax, 31   ; len<=31
        jle     .LBB0_2
        vmovdqu ymm0, ymmword ptr [rdi + rdx]  ; load_u, 256 bit
        vpmovmskb       r8d, ymm0   ; move mask
        add     rdx, 32  ; offset += 32
        add     rax, -32 ; len -= 32
        test    r8d, r8d ; mask != 0
        je      .LBB0_1   # goto start
        xor     eax, eax  # return 0
        vzeroupper  # 清理寄存器
        ret  # 函数结束
.LBB0_2:  ; 不足 32 字节时候的处理
        lea     r8, [rdi + rdx]  ; r8 = str + offset
        mov     al, 1  # 默认返回 1
        cmp     r8, rsi  ;  str + offset == end
        jae     .LBB0_8
        dec     rcx  ; len--
.LBB0_4:
        cmp     byte ptr [rdi + rdx], 0
        setns   al  ; 检查是不是负数
        js      .LBB0_8
        lea     rsi, [rdx + 1]
        cmp     rcx, rdx
        mov     rdx, rsi
        jne     .LBB0_4
.LBB0_8:
        vzeroupper
        ret
```

# debug 方法

```bash
go test -c -gcflags=all="-N -l" -o testbin is_ascii

gdb ./testbin

(gdb) break is_ascii_test.go:14     # 按源码行设置断点
(gdb) break is_ascii.IsASCII  # 或者在函数上 break
(gdb) run

(gdb) layout asm      # 显示反汇编视图
(gdb) si              # 逐条执行（step instruction）
(gdb) x/16xb $rsp     # 查看栈
(gdb) x/16xb $rdi     # 查看参数
(gdb) info registers  # 查看寄存器
```
