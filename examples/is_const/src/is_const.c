#include <immintrin.h>
#include <stdbool.h>
#include <stdint.h>
#include <inttypes.h>
#include <stdio.h>

bool is_const_avx2(int64_t arr[], int count);

bool is_const_avx2(int64_t arr[], int count) {
    if (count <= 1) {
        return true;
    }

    int64_t first = arr[0];
    __m256i first_vec = _mm256_set1_epi64x(first);

    int i = 1;
    // 向下取整到 4 的倍数
    int limit = count & ~3;

    for (; i < limit; i += 4) {
        __m256i data = _mm256_loadu_si256((__m256i*)&arr[i]);
        __m256i cmp = _mm256_cmpeq_epi64(first_vec, data);
        // 生成比较结果掩码（高 4 位对应比较结果）
        int mask = _mm256_movemask_pd((__m256d)cmp);
        if (mask != 0xF) {
            return false;
        }
    }

    // 处理剩余的部分
    for (; i < count; i++) {
        if (arr[i] != first) {
            return false;
        }
    }

    return true;
}

bool is_const(int64_t arr[], int count);

bool is_const(int64_t arr[], int count) {
    if (count <= 1) {
        // 空数组或只有一个元素，视为相等
        return true;
    }
    int64_t first = arr[0];
    for (int i = 1; i < count; i++) {
        if (arr[i] != first) {
            return false;
        }
    }
    return true;
}

int main(){
    int64_t arr[] = {1,1,1,1,1,1,1,1,1,1,1,1};
    bool ret = is_const_avx2(arr, sizeof(arr)/sizeof(arr[0]));
    printf("ret=%d\n", ret);
    return 0;
}
