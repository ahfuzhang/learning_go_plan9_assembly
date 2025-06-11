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
        mov     rax, rcx
        cmp     esi, 32
        jge     .LBB0_2
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
        vpaddb  ymm7, ymm6, ymm0
        vpminub ymm8, ymm7, ymm1
        vpcmpeqb        ymm7, ymm8, ymm7
        vpcmpeqb        ymm8, ymm6, ymm2
        vpor    ymm7, ymm8, ymm7
        vpand   ymm6, ymm6, ymm3
        vpaddb  ymm6, ymm6, ymm4
        vpminub ymm8, ymm6, ymm5
        vpcmpeqb        ymm6, ymm8, ymm6
        vpor    ymm6, ymm6, ymm7
        vpmovmskb       r9d, ymm6
        mov     dword ptr [rdx], r9d
        mov     dword ptr [rax], 0
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
        test    esi, esi
        jle     .LBB0_12
        mov     esi, esi
        xor     ecx, ecx
        jmp     .LBB0_6
.LBB0_7:
        mov     edi, 1
        shl     edi, cl
        mov     r10d, ecx
        shr     r10d, 3
        or      byte ptr [rax + r10], dil
.LBB0_10:
        or      byte ptr [rdx + r10], dil
.LBB0_11:
        inc     rcx
        cmp     rsi, rcx
        je      .LBB0_12
.LBB0_6:
        movsx   rdi, byte ptr [r9 + rcx]
        test    rdi, rdi
        js      .LBB0_7
        cmp     byte ptr [r8 + rdi], 0
        je      .LBB0_11
        mov     edi, 1
        shl     edi, cl
        mov     r10d, ecx
        shr     r10d, 3
        jmp     .LBB0_10
.LBB0_12:
        vzeroupper
        ret
