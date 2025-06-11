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

void tokenize(const uint8_t* str, int len) {
    const uint8_t* end = str + len;
    const uint8_t* ptr = str;

    while (ptr + 32 <= end) {
        __m256i chunk = _mm256_loadu_si256((const __m256i*)ptr);

        // 创建掩码，标识每个字节是否符合条件
        __m256i is_high = _mm256_cmpgt_epi8(chunk, _mm256_set1_epi8(127)); // ASCII > 127
        __m256i is_digit = _mm256_and_si256(
            _mm256_cmpgt_epi8(chunk, _mm256_set1_epi8('0' - 1)),
            _mm256_cmpgt_epi8(_mm256_set1_epi8('9' + 1), chunk)
        );
        __m256i is_lower = _mm256_and_si256(
            _mm256_cmpgt_epi8(chunk, _mm256_set1_epi8('a' - 1)),
            _mm256_cmpgt_epi8(_mm256_set1_epi8('z' + 1), chunk)
        );
        __m256i is_upper = _mm256_and_si256(
            _mm256_cmpgt_epi8(chunk, _mm256_set1_epi8('A' - 1)),
            _mm256_cmpgt_epi8(_mm256_set1_epi8('Z' + 1), chunk)
        );
        __m256i is_underscore = _mm256_cmpeq_epi8(chunk, _mm256_set1_epi8('_'));

        // 合并所有条件
        __m256i combined = _mm256_or_si256(
            _mm256_or_si256(is_high, is_digit),
            _mm256_or_si256(_mm256_or_si256(is_lower, is_upper), is_underscore)
        );

        // 生成掩码
        uint32_t mask = (uint32_t)_mm256_movemask_epi8(combined);

        // 解析掩码，提取子串
        int i = 0;
        while (i < 32) {
            if ((mask >> i) & 1) {
                int start = i;
                while (i < 32 && ((mask >> i) & 1)) {
                    i++;
                }
                int length = i - start;
                printf("%.*s\n", length, ptr + start);
            } else {
                i++;
            }
        }

        ptr += 32;
    }

    // 处理剩余的字节
    if (ptr < end) {
        uint8_t buffer[32] = {0};
        int remaining = end - ptr;
        memcpy(buffer, ptr, remaining);
        __m256i chunk = _mm256_loadu_si256((const __m256i*)buffer);

        __m256i is_high = _mm256_cmpgt_epi8(chunk, _mm256_set1_epi8(127));
        __m256i is_digit = _mm256_and_si256(
            _mm256_cmpgt_epi8(chunk, _mm256_set1_epi8('0' - 1)),
            _mm256_cmpgt_epi8(_mm256_set1_epi8('9' + 1), chunk)
        );
        __m256i is_lower = _mm256_and_si256(
            _mm256_cmpgt_epi8(chunk, _mm256_set1_epi8('a' - 1)),
            _mm256_cmpgt_epi8(_mm256_set1_epi8('z' + 1), chunk)
        );
        __m256i is_upper = _mm256_and_si256(
            _mm256_cmpgt_epi8(chunk, _mm256_set1_epi8('A' - 1)),
            _mm256_cmpgt_epi8(_mm256_set1_epi8('Z' + 1), chunk)
        );
        __m256i is_underscore = _mm256_cmpeq_epi8(chunk, _mm256_set1_epi8('_'));

        __m256i combined = _mm256_or_si256(
            _mm256_or_si256(is_high, is_digit),
            _mm256_or_si256(_mm256_or_si256(is_lower, is_upper), is_underscore)
        );

        uint32_t mask = (uint32_t)_mm256_movemask_epi8(combined);

        int i = 0;
        while (i < remaining) {
            if ((mask >> i) & 1) {
                int start = i;
                while (i < remaining && ((mask >> i) & 1)) {
                    i++;
                }
                int length = i - start;
                printf("%.*s\n", length, ptr + start);
            } else {
                i++;
            }
        }
    }
}

void find_token(const uint8_t *s, int len) {
  int i = 0;
  int got = 0;
  while (i < len) {
    // 跳过非目标字符
    while (i < len && !(isalnum(s[i]) || s[i] == '_')) {
      i++;
    }

    if (i >= len)
      break;

    int start = i;

    // 继续扫描直到遇到非目标字符
    while (i < len && (isalnum(s[i]) || s[i] == '_')) {
      i++;
    }

    int end = i;

    // 输出这个子串
    printf("%.*s, ", end - start, s + start);
    got++;
  }
  printf("\ngot=%d\n", got);
}

void make_table(uint8_t* table){
  memset(table, 0, 256);
  for (int i='0'; i<='9'; i++){
    table[i] = 0xFF;
  }
  for (int i='a'; i<='z'; i++){
    table[i] = 0xFF;
  }
  for (int i='A'; i<='Z'; i++){
    table[i] = 0xFF;
  }
  table['_'] = 0xFF;
}

const uint8_t input[] = "大家好 foo bar---.!!([baz]!!! %$# TaSte_ 11 Apr 28 13:48:01 localhost kernel: [36020.497806] CPU0: Core temperature above threshold, cpu clock throttled (total events = 22034)中文";

void show_bitmap(const uint8_t* bitmap, int len){
  for (int i=0; i<len; i+=8){
    for (int j=0; j<8 && i+j<len; j++){
      uint8_t v = (bitmap[i/8]>>j) & 1;
      printf("%d", v);
    }
  }
  printf("\n");
}

void test_bitmap(){
  uint8_t table[256];
  make_table((uint8_t*)table);  // 构造查找表
  //
  int len = (int)strlen(input);
  // 分配 bitmap
  //int bytes = (len + 31) / 32;  // 需要的 uint32_t 的数量
  int totalBytes = ((len + 31) / 32)*sizeof(uint32_t)*2;
  uint8_t* bitmap = (uint8_t*)malloc(totalBytes);
  uint8_t* bitmap1 = bitmap;
  uint8_t* bitmap2 = bitmap + totalBytes/2;
  // 下面开始计算
  token_to_bitmap(input, len, bitmap1, bitmap2, (uint8_t*)table);
  // 下面开始遍历 bit map
  // for (int i=0; i<len; i+=8){
  //   for (int j=0; j<8 && i+j<len; j++){
  //     uint8_t v = (bitmap1[i/8]>>j) & 1;
  //     printf("%d", v);
  //   }
  // }
  show_bitmap(bitmap1, len);
  printf("\n%s\n", input);
  show_bitmap(bitmap2, len);
  printf("\n%02X%02X%02X\n", input[len-3], input[len-2], input[len-1]);
  // 输出字符串
  int i = 0;
  for (;;){
    // 找第一个 1
    for (;;){
      if (((bitmap1[i/8]>>(i&7))&1)==0&&i<len){
        i++;
        continue;
      }
      break;
    }
    int start = i;
    // 找第一个 0
    for (;;){
      if (((bitmap1[i/8]>>(i&7))&1)==1&&i<len){
        i++;
        continue;
      }
      break;
    }
    int end = i;
    if (end-start>0){
      printf("%.*s(%d), ", end - start, (uint8_t*)input + start, end-start);
    }
    if (i>=len){
      break;
    }
    //
  }
  printf("\n\n");
  // int i = 0;
  // for (;i<len;){
  //   // 查找第一个 1
  //   while ((bitmap1[i/8] & (1<<(i&7)))==0&&i<len){
  //     i++;
  //   }
  //   int start = i;
  //   // 查找最近的 1
  //   while ((bitmap1[i/8] & (1<<(i&7)))==1&&i<len){
  //     i++;
  //   }
  //   printf("%.*s, ", i - start, (uint8_t*)input + start);
  // }
  // printf("\n\n");
}

// 示例测试
int main() {
  int len = sizeof(input) - 1; // 不包括末尾的 '\0'
  find_token(input, len);
  //
  test_bitmap();
  //
  return 0;
}
