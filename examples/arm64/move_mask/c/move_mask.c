#include <stdio.h>
#include <arm_neon.h>
#include <stdint.h>

static inline uint32_t vmovemask_u8_EasyasPi(uint8x16_t input)
{
    // Shift out everything but the sign bits
    uint16x8_t high_bits = vreinterpretq_u16_u8(vshrq_n_u8(input, 7));
    // Merge the even lanes together
    uint32x4_t paired16 = vreinterpretq_u32_u16(vsraq_n_u16(high_bits, high_bits, 7));
    uint64x2_t paired32 = vreinterpretq_u64_u32(vsraq_n_u32(paired16, paired16, 14));
    uint8x16_t paired64 = vreinterpretq_u8_u64(vsraq_n_u64(paired32, paired32, 28));
    // Extract the low 8 bits from each lane and join
    return vgetq_lane_u8(paired64, 0) | ((uint32_t)vgetq_lane_u8(paired64, 8) << 8);
}

void fill(uint8_t data[16], uint32_t n){
    for (int i = 0; i < 16; i++){
        uint32_t bit = (n>>i) & 1;
        data[i] = bit==0? 0: 0xFF;
    }
}

int main()
{
    uint8_t data[16];
    for (uint32_t i = 0; i < 65536; i++){
        fill(data, i);
        // Load the data into a NEON register
        uint8x16_t input = vld1q_u8(data);
        // Compute the mask
        uint32_t mask = vmovemask_u8_EasyasPi(input);

        if (mask!=i){
            printf("Error: vmovemask_u8_EasyasPi returned %u, but expected %u for input %u\n", mask, i, i);
            return 1;
        }
    }
    printf("All tests passed!\n");
    return 0;
}
