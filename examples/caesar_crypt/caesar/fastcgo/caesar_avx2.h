#ifndef _CAESAR_CRYPT_AVX2_H_
#define _CAESAR_CRYPT_AVX2_H_

#include "caesar.h"
#include <string.h>
#include <sys/time.h>
#include <immintrin.h>
#include <avx2intrin.h>
#include <assert.h>

/*
注意：如果编译参数中增加了 avx512 的选项，那么以下代码会被编译为尽可能的支持 avx512 指令集。
    clang -o build/c test/main.c -O3 -g \
	    -mavx -mavx2 \
	    -mavx512f -mavx512vl -mavx512bw
因此比较就失去了意义。
需要在编译参数中隔离进行使用才行:
    clang -o build/c test/main.c -O3 -g \
	    -mavx -mavx2
*/
void caesar_crypt_avx2(SliceHeader* target, const SliceHeader* input, int rotate, const CaesarTable* table){
	rotate %= 26;
    const uint32_t* line = (const uint32_t*)((*table)[rotate]);
    #define batchSize  16
    const uint64_t tailLen = input->len & 0x0f;
    const uint8_t* end = (const uint8_t*)(input->ptr + input->len - tailLen);
    const uint8_t* start = (const uint8_t*)(input->ptr);
	uint8_t* out = (uint8_t*)(target->ptr);
    const __m256i index_mask = _mm256_set_epi32(
        7, 6, 3, 2,
        5,4, 1, 0
    );
    for (; start<end;  out += batchSize, start += batchSize){
        __m128i src = _mm_loadu_si128((const __m128i_u *)start);  // 加载 16 个字符，但只处理前面 8 个字符
        _mm_storeu_si128 (
            (__m128i_u *)out,
            _mm256_castsi256_si128(
                _mm256_permutevar8x32_epi32 (
                    _mm256_packus_epi16(
                        _mm256_permutevar8x32_epi32 (
                            _mm256_packus_epi32(
                                _mm256_i32gather_epi32(line, _mm256_cvtepu8_epi32(src), 4),
                                _mm256_i32gather_epi32(line, _mm256_cvtepu8_epi32(_mm_srli_si128(src, 8)), 4)
                            ),
                            index_mask
                        )
                        , _mm256_setzero_si256()
                    )
                    , index_mask
                )
            )
        );
    }
    //
    end = (const uint8_t*)(input->ptr + input->len);
    for (; start<end; start++, out++){
        *out = (uint8_t)line[*start];
    }
}

#endif
