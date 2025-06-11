#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/time.h>
#include <time.h>

#include <immintrin.h>
#include <stddef.h>
#include <stdint.h>

bool is_ascii_faster(const char *str, int len) {
  const char *p = str;
  const char *end = str + len;

  // 每次处理 32 字节
  while (end - p >= 32) {
    __m256i data = _mm256_loadu_si256((const __m256i *)p);
    int bits = _mm256_movemask_epi8(data); // 提取每个字节的 MSB 到 32 位 mask
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

char *get_random_string(int len) {
  if (len <= 0)
    return NULL;

  char *str = (char *)malloc(len + 1); // 分配 len + 1 字节空间
  if (!str)
    return NULL;

  // 初始化随机种子（可根据需要移动到主函数中只调用一次）
  srand((unsigned int)time(NULL));

  for (int i = 0; i < len; ++i) {
    str[i] = (char)(rand() % 128); // 生成 0~127 之间的随机 ASCII 字符
  }

  str[len] = '\0'; // 最后一个字节为 \0
  return str;
}

bool is_ascii(const char *str, int len) {
  for (int i = 0; i < len; i++) {
    if (str[i] > 127) {
      return false;
    }
  }
  return true;
}

int main(int argc, char *argv[]) {
  int run_times = 1000000;
  if (argc > 1) {
    run_times = atoi(argv[1]);
  }
  int len = 1024L * 1024L * 10;
  if (argc > 2) {
    len = atoi(argv[2]);
  }
  char *str = get_random_string(len);
  struct timeval start, end;
  bool ret;
  int total_bytes = 0;
  gettimeofday(&start, NULL);
  for (int i = 0; i < run_times; i++) {
    ret = is_ascii(str, len);
    total_bytes += len;
  }
  gettimeofday(&end, NULL);
  int spend =
      (end.tv_sec - start.tv_sec) * 1000000 + (end.tv_usec - start.tv_usec);
  printf("spend: %ld us, ret=%d\n", spend, ret);
  printf("speed: %.1f mb / s\n",
         ((double)total_bytes / 1024.0 / 1024.0) / ((double)spend / 1000000.0));
  //
  gettimeofday(&start, NULL);
  for (int i = 0; i < run_times; i++) {
    ret = is_ascii_faster(str, len);
    total_bytes += len;
  }
  gettimeofday(&end, NULL);
  spend = (end.tv_sec - start.tv_sec) * 1000000 + (end.tv_usec - start.tv_usec);
  printf("faster spend: %ld us, ret=%d\n", spend, ret);
  printf("faster speed: %.1f mb / s\n",
         ((double)total_bytes / 1024.0 / 1024.0) / ((double)spend / 1000000.0));
  return 0;
}
