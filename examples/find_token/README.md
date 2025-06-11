从一个长字符串中，获取由 0-9 a-z A-Z 和 _ 组成的 token

尝试优化 VictoriaLogs 中的 tokenizer 函数.

例如：

```go

	f([]string{""}, nil)
	f([]string{"foo"}, []string{"foo"})
	f([]string{"foo bar---.!!([baz]!!! %$# TaSte"}, []string{"foo", "bar", "baz", "TaSte"})
	f([]string{"теСТ 1234 f12.34", "34 f12 AS"}, []string{"теСТ", "1234", "f12", "34", "AS"})
	f(strings.Split(`
Apr 28 13:43:38 localhost whoopsie[2812]: [13:43:38] online
Apr 28 13:45:01 localhost CRON[12181]: (root) CMD (command -v debian-sa1 > /dev/null && debian-sa1 1 1)
Apr 28 13:48:01 localhost kernel: [36020.497806] CPU0: Core temperature above threshold, cpu clock throttled (total events = 22034)
`, "\n"), []string{"Apr", "28", "13", "43", "38", "localhost", "whoopsie", "2812", "online", "45", "01", "CRON", "12181",
		"root", "CMD", "command", "v", "debian", "sa1", "dev", "null", "1", "48", "kernel", "36020", "497806", "CPU0", "Core",
		"temperature", "above", "threshold", "cpu", "clock", "throttled", "total", "events", "22034"})

```

```go
func (t *hashTokenizer) tokenizeString(dst []uint64, s string) []uint64 {
	if !isASCII(s) {
		// Slow path - s contains unicode chars
		return t.tokenizeStringUnicode(dst, s)
	}

	// Fast path for ASCII s
	i := 0
	for i < len(s) {
		// Search for the next token.
		start := len(s)
		for i < len(s) {
			if !isTokenChar(s[i]) {
				i++
				continue
			}
			start = i
			i++
			break
		}
		// Search for the end of the token.
		end := len(s)
		for i < len(s) {
			if isTokenChar(s[i]) {
				i++
				continue
			}
			end = i
			i++
			break
		}
		if end <= start {
			break
		}

		// Register the token.
		token := s[start:end]               // 由 0-9, A-Z, a-z, _ 构成的传，用于分词
		if h, ok := t.addToken(token); ok { // 这里通过 xxhash 来计算子串的 hash值，并写入 bloom filter 中
			dst = append(dst, h)
		}
	}
	return dst
}
```

```c
#include <immintrin.h>
#include <inttypes.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdlib.h>
#include <string.h>
#include <sys/time.h>
#include <time.h>

#include <ctype.h>
#include <stdint.h>
#include <stdio.h>

/*
在长字符串中找子串，然后把匹配的信息写入 bitmap 中
bitmap1: 存放 unicode, 0-9, a-z, A-Z, _
bitmap2: 存放 unicode
*/
void token_to_bitmap(const uint8_t* str, int len, uint8_t* bitmap1, uint8_t* bitmap2, uint8_t* table){
    const uint8_t* end = str + len;
    const uint8_t* ptr = str;
    //__m256i c127 = _mm256_set1_epi8(0x80);
    __m256i c0 = _mm256_set1_epi8('0' - 1);
    __m256i c9 = _mm256_set1_epi8('9' + 1);
    __m256i ca = _mm256_set1_epi8('a' - 1);
    __m256i cz = _mm256_set1_epi8('z' + 1);
    __m256i cA = _mm256_set1_epi8('A' - 1);
    __m256i cZ = _mm256_set1_epi8('Z' + 1);
    __m256i c_ = _mm256_set1_epi8('_');

    while (ptr + 32 <= end) {
        __m256i chunk = _mm256_loadu_si256((const __m256i*)ptr);

        // 创建掩码，标识每个字节是否符合条件
        //__m256i is_high = _mm256_cmpgt_epi8(_mm256_and_si256(chunk, c127), _mm256_set1_epi8(0)); // ASCII & 0x80
        uint32_t unicode_mask = _mm256_movemask_epi8(chunk);
        __m256i is_digit = _mm256_and_si256(
            _mm256_cmpgt_epi8(chunk, c0),  // chunk>='0'
            _mm256_cmpgt_epi8(c9, chunk)  // '9'>=chunk
        );
        __m256i is_lower = _mm256_and_si256(
            _mm256_cmpgt_epi8(chunk, ca),  // chunk >= 'a'
            _mm256_cmpgt_epi8(cz, chunk)
        );
        __m256i is_upper = _mm256_and_si256(
            _mm256_cmpgt_epi8(chunk, cA),
            _mm256_cmpgt_epi8(cZ, chunk)
        );
        __m256i is_underscore = _mm256_cmpeq_epi8(chunk, c_);

        // 合并所有条件
        __m256i combined = _mm256_or_si256(
            is_digit,
            _mm256_or_si256(_mm256_or_si256(is_lower, is_upper), is_underscore)
        );
        // 生成掩码
        uint32_t mask = (uint32_t)_mm256_movemask_epi8(combined);
        //uint32_t maskUnicode = (uint32_t)_mm256_movemask_epi8(is_high);
        *((uint32_t*)bitmap1) = mask | unicode_mask;
        *((uint32_t*)bitmap2) = unicode_mask;
        bitmap1 += 4;
        bitmap2 += 4;
        ptr += 32;
    }
    // 处理不足 32 字节的部分
    *((uint32_t*)bitmap1) = 0;
    *((uint32_t*)bitmap2) = 0;
    //printf("readed len:%d, left len=%d\n", ptr - str, len&31);
    for (int i=0; i<(len&31); i++){
      uint8_t c = ptr[i];
      //printf("%02X(%d), ", c, i);
      if ((c & 0x80)!=0){
        bitmap2[i/8] |= (1<<(i&7));
        bitmap1[i/8] |= (1<<(i&7));
      //} else if (c>='0' && c<='9' || c>='a'&&c<='z'|| c>='A'&&c<='Z' || c=='_'){
      } else if (table[c]!=0){
        bitmap1[i/8] |= (1<<(i&7));
      }
    }
    //printf("\nend\n");
}

```

```asm
.LCPI0_6:
        .byte   208
.LCPI0_7:
        .byte   9
.LCPI0_8:
        .byte   95
.LCPI0_9:
        .byte   223
.LCPI0_10:
        .byte   191
.LCPI0_11:
        .byte   25
token_to_bitmap(unsigned char const*, int, unsigned char*, unsigned char*, unsigned char*):
        mov     rax, rcx  // rcx = start
        cmp     esi, 32
        jge     .LBB0_2  // leftLen > 32
        mov     r9, rdi
        jmp     .LBB0_4
.LBB0_2:
        movsxd  rcx, esi
        add     rcx, rdi
        vpbroadcastb    ymm0, byte ptr [rip + .LCPI0_6]
        vpbroadcastb    ymm1, byte ptr [rip + .LCPI0_7]
        vpbroadcastb    ymm2, byte ptr [rip + .LCPI0_8]
        vpbroadcastb    ymm3, byte ptr [rip + .LCPI0_9]
        vpbroadcastb    ymm4, byte ptr [rip + .LCPI0_10]
        vpbroadcastb    ymm5, byte ptr [rip + .LCPI0_11]
.LBB0_3:
        vmovdqu ymm6, ymmword ptr [rdi]
        vpmovmskb       r9d, ymm6
        vpaddb  ymm7, ymm6, ymm0
        vpminub ymm8, ymm7, ymm1
        vpcmpeqb        ymm7, ymm8, ymm7
        vpcmpeqb        ymm8, ymm6, ymm2
        vpor    ymm7, ymm8, ymm7
        vpand   ymm8, ymm6, ymm3
        vpaddb  ymm8, ymm8, ymm4
        vpminub ymm9, ymm8, ymm5
        vpcmpeqb        ymm8, ymm8, ymm9
        vpor    ymm7, ymm8, ymm7
        vpor    ymm6, ymm6, ymm7
        vpmovmskb       r10d, ymm6
        mov     dword ptr [rdx], r10d
        mov     dword ptr [rax], r9d
        add     rdx, 4
        add     rax, 4
        lea     r9, [rdi + 32]
        add     rdi, 64
        cmp     rdi, rcx
        mov     rdi, r9
        jbe     .LBB0_3
.LBB0_4:
        mov     dword ptr [rdx], 0
        mov     dword ptr [rax], 0
        and     esi, 31
        je      .LBB0_12
        mov     esi, esi
        xor     edi, edi
        jmp     .LBB0_6
.LBB0_7:
        mov     ecx, edi
        and     cl, 7
        mov     r10b, 1
        shl     r10b, cl
        mov     ecx, edi
        shr     ecx, 3
        or      byte ptr [rax + rcx], r10b
.LBB0_10:
        or      byte ptr [rdx + rcx], r10b
.LBB0_11:
        inc     rdi
        cmp     rsi, rdi
        je      .LBB0_12
.LBB0_6:
        movsx   rcx, byte ptr [r9 + rdi]
        test    rcx, rcx
        js      .LBB0_7
        cmp     byte ptr [r8 + rcx], 0
        je      .LBB0_11
        mov     ecx, edi
        and     cl, 7
        mov     r10b, 1
        shl     r10b, cl
        mov     ecx, edi
        shr     ecx, 3
        jmp     .LBB0_10
.LBB0_12:
        vzeroupper
        ret
```
