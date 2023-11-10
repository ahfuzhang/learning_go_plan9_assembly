#ifndef _CAESAR_CRYPT_H_
#define _CAESAR_CRYPT_H_

#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>
#include <string.h>

typedef uint32_t CaesarTable[26][256];

typedef struct{
    uint64_t ptr;
    uint64_t len;
    uint64_t cap;
}__attribute__((packed)) SliceHeader;

void caesar_crypt(SliceHeader* out, const SliceHeader* in, int rotate, const CaesarTable* table){
    rotate %= 26;
    const uint8_t* end = (const uint8_t*)(in->ptr + in->len);
    const uint32_t* line = (const uint32_t*)(*table)[rotate];
    const uint8_t* src = (const uint8_t*)(in->ptr);
    uint8_t* target = (uint8_t*)out->ptr;
    for (;src<end; src++, target++){
        *target = (uint8_t)line[*src];  // 直接查表得到结果
        // 使用  O3 优化的时候，编译器会在这里循环展开 8 次
    }
}

#endif
