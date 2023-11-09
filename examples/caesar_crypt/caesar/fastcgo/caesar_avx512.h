#ifndef _CAESAR_CRYPT_AVX512_H_
#define _CAESAR_CRYPT_AVX512_H_

#include "caesar.h"
#include <string.h>
#include <sys/time.h>
#include <immintrin.h>
#include <avx2intrin.h>
#include <assert.h>


void caesar_crypt_avx512(SliceHeader* target, const SliceHeader* input, int rotate, const CaesarTable* table){
	rotate %= 26;
    const uint32_t* line = (const uint32_t*)((*table)[rotate]);
    #define batchSize  16
    const uint64_t tailLen = input->len & 0x0f;
    const uint8_t* end = (const uint8_t*)(input->ptr + input->len - tailLen);
    const uint8_t* start = (const uint8_t*)(input->ptr);
	uint8_t* out = (uint8_t*)(target->ptr);
    for (; start<end; start += batchSize, out += batchSize){
        _mm_storeu_epi8(                        // step5: 把 16 个 int8 存储到目的地址
            out, _mm512_cvtepi32_epi8(          // step4: 把  16  个 int32 的查表结果，转换成  16 个  int8
                _mm512_i32gather_epi32(         // step3: 把 16 个 int32 当成偏移量，在 table 开始的地址里面查询. 最后一个参数 4，表示查表中每个元素的偏移量是 4 字节
                    _mm512_cvtepu8_epi32(       // step2: 把 16 个 int8 转换成 16 个  int32
                        _mm_loadu_si128((const __m128i_u *)start)  // step1: 以非对齐的方式，从源地址加载 16 字节
                    ), line, 4))
        );
    }
    end = (const uint8_t*)(input->ptr + input->len);
    for (; start<end; start++, out++){
        *out = (uint8_t)line[*start];
    }
}

#endif
