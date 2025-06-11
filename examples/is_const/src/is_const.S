	.file	"is_const.c"
	.text
.Ltext0:
	.p2align 4,,15
	.globl	is_const_avx2
	.type	is_const_avx2, @function
is_const_avx2:
.LVL0:
.LFB5183:
	.file 1 "is_const.c"
	.loc 1 9 46 view -0
	.cfi_startproc
	.loc 1 10 5 view .LVU1
	.loc 1 11 16 is_stmt 0 view .LVU2
	movl	$1, %eax
	.loc 1 10 8 view .LVU3
	cmpl	$1, %esi
	jle	.L17
	.loc 1 14 5 is_stmt 1 view .LVU4
	.loc 1 9 46 is_stmt 0 view .LVU5
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	.loc 1 19 9 view .LVU6
	movl	%esi, %ecx
	andl	$-4, %ecx
	.loc 1 9 46 view .LVU7
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	andq	$-32, %rsp
	.loc 1 14 13 view .LVU8
	movq	(%rdi), %r8
.LVL1:
	.loc 1 15 5 is_stmt 1 view .LVU9
.LBB11:
.LBI11:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/8/include/avxintrin.h"
	.loc 2 1341 1 view .LVU10
.LBB12:
	.loc 2 1343 3 view .LVU11
	.loc 2 1343 24 is_stmt 0 view .LVU12
	movq	%r8, -8(%rsp)
	vpbroadcastq	-8(%rsp), %ymm1
.LVL2:
	.loc 2 1343 24 view .LVU13
.LBE12:
.LBE11:
	.loc 1 17 5 is_stmt 1 view .LVU14
	.loc 1 19 5 view .LVU15
	.loc 1 21 5 view .LVU16
	.loc 1 21 5 is_stmt 0 view .LVU17
	cmpl	$1, %ecx
	jle	.L9
.LBB13:
	.loc 1 22 9 is_stmt 1 view .LVU18
.LVL3:
.LBB14:
.LBI14:
	.loc 2 919 1 view .LVU19
.LBB15:
	.loc 2 921 3 view .LVU20
	.loc 2 921 3 is_stmt 0 view .LVU21
.LBE15:
.LBE14:
	.loc 1 23 9 is_stmt 1 view .LVU22
.LBB19:
.LBI19:
	.file 3 "/usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h"
	.loc 3 252 1 view .LVU23
.LBB20:
	.loc 3 254 3 view .LVU24
	.loc 3 254 3 is_stmt 0 view .LVU25
.LBE20:
.LBE19:
	.loc 1 25 9 is_stmt 1 view .LVU26
.LBB22:
.LBI22:
	.loc 2 1188 1 view .LVU27
.LBB23:
	.loc 2 1190 3 view .LVU28
.LBE23:
.LBE22:
.LBB27:
.LBB16:
	.loc 2 921 10 is_stmt 0 view .LVU29
	vmovdqu	8(%rdi), %xmm3
	vinserti128	$0x1, 24(%rdi), %ymm3, %ymm0
.LBE16:
.LBE27:
.LBB28:
.LBB24:
	.loc 2 1190 10 view .LVU30
	vpcmpeqq	%ymm0, %ymm1, %ymm0
	vmovmskpd	%ymm0, %eax
.LVL4:
	.loc 2 1190 10 view .LVU31
.LBE24:
.LBE28:
	.loc 1 26 9 is_stmt 1 view .LVU32
	.loc 1 26 12 is_stmt 0 view .LVU33
	cmpl	$15, %eax
	jne	.L14
	movl	$5, %edx
	jmp	.L4
.LVL5:
	.p2align 4,,10
	.p2align 3
.L5:
	.loc 1 22 9 is_stmt 1 view .LVU34
.LBB29:
	.loc 2 919 1 view .LVU35
.LBB17:
	.loc 2 921 3 view .LVU36
	.loc 2 921 3 is_stmt 0 view .LVU37
.LBE17:
.LBE29:
	.loc 1 23 9 is_stmt 1 view .LVU38
.LBB30:
	.loc 3 252 1 view .LVU39
.LBB21:
	.loc 3 254 3 view .LVU40
	.loc 3 254 3 is_stmt 0 view .LVU41
.LBE21:
.LBE30:
	.loc 1 25 9 is_stmt 1 view .LVU42
.LBB31:
	.loc 2 1188 1 view .LVU43
.LBB25:
	.loc 2 1190 3 view .LVU44
.LBE25:
.LBE31:
.LBB32:
.LBB18:
	.loc 2 921 10 is_stmt 0 view .LVU45
	vmovdqu	(%rdi,%rdx,8), %xmm2
	vinserti128	$0x1, 16(%rdi,%rdx,8), %ymm2, %ymm0
	addq	$4, %rdx
.LVL6:
	.loc 2 921 10 view .LVU46
.LBE18:
.LBE32:
.LBB33:
.LBB26:
	.loc 2 1190 10 view .LVU47
	vpcmpeqq	%ymm0, %ymm1, %ymm0
	vmovmskpd	%ymm0, %eax
.LVL7:
	.loc 2 1190 10 view .LVU48
.LBE26:
.LBE33:
	.loc 1 26 9 is_stmt 1 view .LVU49
	.loc 1 26 12 is_stmt 0 view .LVU50
	cmpl	$15, %eax
	jne	.L14
.LVL8:
.L4:
	.loc 1 26 12 view .LVU51
.LBE13:
	.loc 1 21 25 view .LVU52
	movl	%edx, %eax
.LVL9:
	.loc 1 21 5 view .LVU53
	cmpl	%edx, %ecx
	jg	.L5
	.loc 1 32 5 view .LVU54
	cmpl	%edx, %esi
	jle	.L12
	movslq	%edx, %rdx
.LVL10:
	.loc 1 32 5 view .LVU55
	salq	$3, %rdx
.LVL11:
.L3:
	.loc 1 33 9 is_stmt 1 view .LVU56
	.loc 1 33 12 is_stmt 0 view .LVU57
	cmpq	(%rdi,%rdx), %r8
	jne	.L14
	addl	$1, %eax
.LVL12:
	.loc 1 33 12 view .LVU58
	cltq
	.loc 1 33 12 view .LVU59
	jmp	.L6
.LVL13:
	.p2align 4,,10
	.p2align 3
.L7:
	.loc 1 33 9 is_stmt 1 view .LVU60
	addq	$1, %rax
.LVL14:
	.loc 1 33 12 is_stmt 0 view .LVU61
	cmpq	%r8, -8(%rdi,%rax,8)
	jne	.L14
.L6:
.LVL15:
	.loc 1 32 5 view .LVU62
	cmpl	%eax, %esi
	jg	.L7
.LVL16:
.L12:
	.loc 1 11 16 view .LVU63
	movl	$1, %eax
	vzeroupper
	.loc 1 39 1 view .LVU64
	leave
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L14:
	.cfi_restore_state
.LBB34:
	.loc 1 27 20 view .LVU65
	xorl	%eax, %eax
	vzeroupper
.LBE34:
	.loc 1 39 1 view .LVU66
	leave
	.cfi_def_cfa 7, 8
	ret
.LVL17:
	.p2align 4,,10
	.p2align 3
.L17:
	.cfi_restore 6
	.loc 1 39 1 view .LVU67
	ret
.LVL18:
.L9:
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
	.loc 1 21 5 view .LVU68
	movl	$8, %edx
	.loc 1 17 9 view .LVU69
	movl	$1, %eax
	jmp	.L3
	.cfi_endproc
.LFE5183:
	.size	is_const_avx2, .-is_const_avx2
	.p2align 4,,15
	.globl	is_const
	.type	is_const, @function
is_const:
.LVL19:
.LFB5184:
	.loc 1 43 41 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 44 5 view .LVU71
	.loc 1 46 16 is_stmt 0 view .LVU72
	movl	$1, %eax
	.loc 1 44 8 view .LVU73
	cmpl	$1, %esi
	jle	.L27
	.loc 1 48 5 is_stmt 1 view .LVU74
	leal	-2(%rsi), %ecx
	.loc 1 48 13 is_stmt 0 view .LVU75
	movq	(%rdi), %rdx
.LVL20:
	.loc 1 49 5 is_stmt 1 view .LVU76
.LBB35:
	.loc 1 49 10 view .LVU77
	.loc 1 49 10 is_stmt 0 view .LVU78
	leaq	8(%rdi), %rax
	leaq	16(%rdi,%rcx,8), %rcx
.LVL21:
	.p2align 4,,10
	.p2align 3
.L23:
	.loc 1 50 9 is_stmt 1 view .LVU79
	.loc 1 50 12 is_stmt 0 view .LVU80
	cmpq	%rdx, (%rax)
	jne	.L25
	.loc 1 50 12 view .LVU81
	addq	$8, %rax
	.loc 1 49 5 discriminator 2 view .LVU82
	cmpq	%rcx, %rax
	jne	.L23
.LBE35:
	.loc 1 46 16 view .LVU83
	movl	$1, %eax
.LBB36:
	ret
	.p2align 4,,10
	.p2align 3
.L25:
	.loc 1 51 20 view .LVU84
	xorl	%eax, %eax
.LVL22:
.L27:
	.loc 1 51 20 view .LVU85
.LBE36:
	.loc 1 55 1 view .LVU86
	ret
	.cfi_endproc
.LFE5184:
	.size	is_const, .-is_const
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"ret=%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB5185:
	.loc 1 57 11 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 58 5 view .LVU88
	.loc 1 57 11 is_stmt 0 view .LVU89
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	.loc 1 59 16 view .LVU90
	movl	$12, %esi
	.loc 1 57 11 view .LVU91
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	andq	$-32, %rsp
	subq	$96, %rsp
	.loc 1 58 13 view .LVU92
	vmovdqa	.LC0(%rip), %ymm0
	.loc 1 59 16 view .LVU93
	movq	%rsp, %rdi
	.loc 1 58 13 view .LVU94
	vmovdqa	%ymm0, (%rsp)
	vmovdqa	%ymm0, 32(%rsp)
	vmovdqa	%ymm0, 64(%rsp)
	.loc 1 59 5 is_stmt 1 view .LVU95
	.loc 1 59 16 is_stmt 0 view .LVU96
	vzeroupper
	call	is_const_avx2
.LVL23:
	.loc 1 60 5 is_stmt 1 view .LVU97
	leaq	.LC1(%rip), %rdi
	movzbl	%al, %esi
	xorl	%eax, %eax
.LVL24:
	.loc 1 60 5 is_stmt 0 view .LVU98
	call	printf@PLT
.LVL25:
	.loc 1 61 5 is_stmt 1 view .LVU99
	.loc 1 62 1 is_stmt 0 view .LVU100
	xorl	%eax, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5185:
	.size	main, .-main
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC0:
	.quad	1
	.quad	1
	.quad	1
	.quad	1
	.text
.Letext0:
	.file 4 "/usr/lib/gcc/x86_64-linux-gnu/8/include/stddef.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 6 "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h"
	.file 7 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.file 8 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 9 "/usr/include/stdio.h"
	.file 10 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x695
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF72
	.byte	0xc
	.long	.LASF73
	.long	.LASF74
	.long	.Ldebug_ranges0+0x130
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF0
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF1
	.uleb128 0x4
	.long	0x37
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF2
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.long	.LASF3
	.uleb128 0x5
	.long	.LASF10
	.byte	0x4
	.byte	0xd8
	.byte	0x17
	.long	0x5d
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF4
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF5
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF7
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF8
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF9
	.uleb128 0x5
	.long	.LASF11
	.byte	0x5
	.byte	0x2b
	.byte	0x19
	.long	0x6b
	.uleb128 0x5
	.long	.LASF12
	.byte	0x5
	.byte	0x96
	.byte	0x19
	.long	0x6b
	.uleb128 0x5
	.long	.LASF13
	.byte	0x5
	.byte	0x97
	.byte	0x1b
	.long	0x6b
	.uleb128 0x6
	.byte	0x8
	.uleb128 0x7
	.byte	0x8
	.long	0x37
	.uleb128 0x5
	.long	.LASF14
	.byte	0x6
	.byte	0x1b
	.byte	0x13
	.long	0x87
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF15
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.long	.LASF16
	.uleb128 0x5
	.long	.LASF17
	.byte	0x2
	.byte	0x29
	.byte	0x10
	.long	0xd9
	.uleb128 0x8
	.long	0xc6
	.long	0xe5
	.uleb128 0x9
	.byte	0x3
	.byte	0
	.uleb128 0x5
	.long	.LASF18
	.byte	0x2
	.byte	0x2b
	.byte	0x13
	.long	0xf1
	.uleb128 0x8
	.long	0x43
	.long	0xfd
	.uleb128 0x9
	.byte	0x3
	.byte	0
	.uleb128 0x5
	.long	.LASF19
	.byte	0x2
	.byte	0x38
	.byte	0x13
	.long	0x109
	.uleb128 0x8
	.long	0x43
	.long	0x115
	.uleb128 0x9
	.byte	0x3
	.byte	0
	.uleb128 0x5
	.long	.LASF20
	.byte	0x2
	.byte	0x3a
	.byte	0x10
	.long	0x121
	.uleb128 0x8
	.long	0xc6
	.long	0x12d
	.uleb128 0x9
	.byte	0x3
	.byte	0
	.uleb128 0xa
	.long	.LASF75
	.byte	0x2
	.byte	0x41
	.byte	0x13
	.long	0x109
	.byte	0x1
	.uleb128 0x4
	.long	0x12d
	.uleb128 0xb
	.long	.LASF76
	.byte	0xd8
	.byte	0x7
	.byte	0x31
	.byte	0x8
	.long	0x2c6
	.uleb128 0xc
	.long	.LASF21
	.byte	0x7
	.byte	0x33
	.byte	0x7
	.long	0x29
	.byte	0
	.uleb128 0xc
	.long	.LASF22
	.byte	0x7
	.byte	0x36
	.byte	0x9
	.long	0xad
	.byte	0x8
	.uleb128 0xc
	.long	.LASF23
	.byte	0x7
	.byte	0x37
	.byte	0x9
	.long	0xad
	.byte	0x10
	.uleb128 0xc
	.long	.LASF24
	.byte	0x7
	.byte	0x38
	.byte	0x9
	.long	0xad
	.byte	0x18
	.uleb128 0xc
	.long	.LASF25
	.byte	0x7
	.byte	0x39
	.byte	0x9
	.long	0xad
	.byte	0x20
	.uleb128 0xc
	.long	.LASF26
	.byte	0x7
	.byte	0x3a
	.byte	0x9
	.long	0xad
	.byte	0x28
	.uleb128 0xc
	.long	.LASF27
	.byte	0x7
	.byte	0x3b
	.byte	0x9
	.long	0xad
	.byte	0x30
	.uleb128 0xc
	.long	.LASF28
	.byte	0x7
	.byte	0x3c
	.byte	0x9
	.long	0xad
	.byte	0x38
	.uleb128 0xc
	.long	.LASF29
	.byte	0x7
	.byte	0x3d
	.byte	0x9
	.long	0xad
	.byte	0x40
	.uleb128 0xc
	.long	.LASF30
	.byte	0x7
	.byte	0x40
	.byte	0x9
	.long	0xad
	.byte	0x48
	.uleb128 0xc
	.long	.LASF31
	.byte	0x7
	.byte	0x41
	.byte	0x9
	.long	0xad
	.byte	0x50
	.uleb128 0xc
	.long	.LASF32
	.byte	0x7
	.byte	0x42
	.byte	0x9
	.long	0xad
	.byte	0x58
	.uleb128 0xc
	.long	.LASF33
	.byte	0x7
	.byte	0x44
	.byte	0x16
	.long	0x2df
	.byte	0x60
	.uleb128 0xc
	.long	.LASF34
	.byte	0x7
	.byte	0x46
	.byte	0x14
	.long	0x2e5
	.byte	0x68
	.uleb128 0xc
	.long	.LASF35
	.byte	0x7
	.byte	0x48
	.byte	0x7
	.long	0x29
	.byte	0x70
	.uleb128 0xc
	.long	.LASF36
	.byte	0x7
	.byte	0x49
	.byte	0x7
	.long	0x29
	.byte	0x74
	.uleb128 0xc
	.long	.LASF37
	.byte	0x7
	.byte	0x4a
	.byte	0xb
	.long	0x93
	.byte	0x78
	.uleb128 0xc
	.long	.LASF38
	.byte	0x7
	.byte	0x4d
	.byte	0x12
	.long	0x79
	.byte	0x80
	.uleb128 0xc
	.long	.LASF39
	.byte	0x7
	.byte	0x4e
	.byte	0xf
	.long	0x80
	.byte	0x82
	.uleb128 0xc
	.long	.LASF40
	.byte	0x7
	.byte	0x4f
	.byte	0x8
	.long	0x2eb
	.byte	0x83
	.uleb128 0xc
	.long	.LASF41
	.byte	0x7
	.byte	0x51
	.byte	0xf
	.long	0x2fb
	.byte	0x88
	.uleb128 0xc
	.long	.LASF42
	.byte	0x7
	.byte	0x59
	.byte	0xd
	.long	0x9f
	.byte	0x90
	.uleb128 0xc
	.long	.LASF43
	.byte	0x7
	.byte	0x5b
	.byte	0x17
	.long	0x306
	.byte	0x98
	.uleb128 0xc
	.long	.LASF44
	.byte	0x7
	.byte	0x5c
	.byte	0x19
	.long	0x311
	.byte	0xa0
	.uleb128 0xc
	.long	.LASF45
	.byte	0x7
	.byte	0x5d
	.byte	0x14
	.long	0x2e5
	.byte	0xa8
	.uleb128 0xc
	.long	.LASF46
	.byte	0x7
	.byte	0x5e
	.byte	0x9
	.long	0xab
	.byte	0xb0
	.uleb128 0xc
	.long	.LASF47
	.byte	0x7
	.byte	0x5f
	.byte	0xa
	.long	0x51
	.byte	0xb8
	.uleb128 0xc
	.long	.LASF48
	.byte	0x7
	.byte	0x60
	.byte	0x7
	.long	0x29
	.byte	0xc0
	.uleb128 0xc
	.long	.LASF49
	.byte	0x7
	.byte	0x62
	.byte	0x8
	.long	0x317
	.byte	0xc4
	.byte	0
	.uleb128 0x5
	.long	.LASF50
	.byte	0x8
	.byte	0x7
	.byte	0x19
	.long	0x13f
	.uleb128 0xd
	.long	.LASF77
	.byte	0x7
	.byte	0x2b
	.byte	0xe
	.uleb128 0xe
	.long	.LASF51
	.uleb128 0x7
	.byte	0x8
	.long	0x2da
	.uleb128 0x7
	.byte	0x8
	.long	0x13f
	.uleb128 0xf
	.long	0x37
	.long	0x2fb
	.uleb128 0x10
	.long	0x5d
	.byte	0
	.byte	0
	.uleb128 0x7
	.byte	0x8
	.long	0x2d2
	.uleb128 0xe
	.long	.LASF52
	.uleb128 0x7
	.byte	0x8
	.long	0x301
	.uleb128 0xe
	.long	.LASF53
	.uleb128 0x7
	.byte	0x8
	.long	0x30c
	.uleb128 0xf
	.long	0x37
	.long	0x327
	.uleb128 0x10
	.long	0x5d
	.byte	0x13
	.byte	0
	.uleb128 0x11
	.long	.LASF54
	.byte	0x9
	.byte	0x89
	.byte	0xe
	.long	0x333
	.uleb128 0x7
	.byte	0x8
	.long	0x2c6
	.uleb128 0x11
	.long	.LASF55
	.byte	0x9
	.byte	0x8a
	.byte	0xe
	.long	0x333
	.uleb128 0x11
	.long	.LASF56
	.byte	0x9
	.byte	0x8b
	.byte	0xe
	.long	0x333
	.uleb128 0x11
	.long	.LASF57
	.byte	0xa
	.byte	0x1a
	.byte	0xc
	.long	0x29
	.uleb128 0xf
	.long	0x373
	.long	0x368
	.uleb128 0x12
	.byte	0
	.uleb128 0x4
	.long	0x35d
	.uleb128 0x7
	.byte	0x8
	.long	0x3e
	.uleb128 0x4
	.long	0x36d
	.uleb128 0x11
	.long	.LASF58
	.byte	0xa
	.byte	0x1b
	.byte	0x1a
	.long	0x368
	.uleb128 0x13
	.long	.LASF78
	.byte	0x1
	.byte	0x39
	.byte	0x5
	.long	0x29
	.quad	.LFB5185
	.quad	.LFE5185-.LFB5185
	.uleb128 0x1
	.byte	0x9c
	.long	0x403
	.uleb128 0x14
	.string	"arr"
	.byte	0x1
	.byte	0x3a
	.byte	0xd
	.long	0x403
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.uleb128 0x15
	.string	"ret"
	.byte	0x1
	.byte	0x3b
	.byte	0xa
	.long	0x413
	.long	.LLST12
	.long	.LVUS12
	.uleb128 0x16
	.quad	.LVL23
	.long	0x48b
	.long	0x3e7
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x18
	.quad	.LVL25
	.long	0x68b
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC1
	.byte	0
	.byte	0
	.uleb128 0xf
	.long	0xb3
	.long	0x413
	.uleb128 0x10
	.long	0x5d
	.byte	0xb
	.byte	0
	.uleb128 0x3
	.byte	0x1
	.byte	0x2
	.long	.LASF59
	.uleb128 0x19
	.long	.LASF62
	.byte	0x1
	.byte	0x2b
	.byte	0x6
	.long	0x413
	.quad	.LFB5184
	.quad	.LFE5184-.LFB5184
	.uleb128 0x1
	.byte	0x9c
	.long	0x485
	.uleb128 0x1a
	.string	"arr"
	.byte	0x1
	.byte	0x2b
	.byte	0x17
	.long	0x485
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1b
	.long	.LASF60
	.byte	0x1
	.byte	0x2b
	.byte	0x22
	.long	0x29
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1c
	.long	.LASF61
	.byte	0x1
	.byte	0x30
	.byte	0xd
	.long	0xb3
	.long	.LLST10
	.long	.LVUS10
	.uleb128 0x1d
	.long	.Ldebug_ranges0+0x100
	.uleb128 0x15
	.string	"i"
	.byte	0x1
	.byte	0x31
	.byte	0xe
	.long	0x29
	.long	.LLST11
	.long	.LVUS11
	.byte	0
	.byte	0
	.uleb128 0x7
	.byte	0x8
	.long	0xb3
	.uleb128 0x19
	.long	.LASF63
	.byte	0x1
	.byte	0x9
	.byte	0x6
	.long	0x413
	.quad	.LFB5183
	.quad	.LFE5183-.LFB5183
	.uleb128 0x1
	.byte	0x9c
	.long	0x5fb
	.uleb128 0x1a
	.string	"arr"
	.byte	0x1
	.byte	0x9
	.byte	0x1c
	.long	0x485
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1b
	.long	.LASF60
	.byte	0x1
	.byte	0x9
	.byte	0x27
	.long	0x29
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1c
	.long	.LASF61
	.byte	0x1
	.byte	0xe
	.byte	0xd
	.long	0xb3
	.long	.LLST0
	.long	.LVUS0
	.uleb128 0x1c
	.long	.LASF64
	.byte	0x1
	.byte	0xf
	.byte	0xd
	.long	0xfd
	.long	.LLST1
	.long	.LVUS1
	.uleb128 0x15
	.string	"i"
	.byte	0x1
	.byte	0x11
	.byte	0x9
	.long	0x29
	.long	.LLST2
	.long	.LVUS2
	.uleb128 0x1c
	.long	.LASF65
	.byte	0x1
	.byte	0x13
	.byte	0x9
	.long	0x29
	.long	.LLST3
	.long	.LVUS3
	.uleb128 0x1e
	.long	.Ldebug_ranges0+0
	.long	0x5cb
	.uleb128 0x1c
	.long	.LASF66
	.byte	0x1
	.byte	0x16
	.byte	0x11
	.long	0xfd
	.long	.LLST5
	.long	.LVUS5
	.uleb128 0x1f
	.string	"cmp"
	.byte	0x1
	.byte	0x17
	.byte	0x11
	.long	0xfd
	.uleb128 0x1c
	.long	.LASF67
	.byte	0x1
	.byte	0x19
	.byte	0xd
	.long	0x29
	.long	.LLST6
	.long	.LVUS6
	.uleb128 0x20
	.long	0x665
	.quad	.LBI14
	.byte	.LVU19
	.long	.Ldebug_ranges0+0x30
	.byte	0x1
	.byte	0x16
	.byte	0x18
	.long	0x57b
	.uleb128 0x21
	.long	0x677
	.long	.LLST7
	.long	.LVUS7
	.byte	0
	.uleb128 0x20
	.long	0x5fb
	.quad	.LBI19
	.byte	.LVU23
	.long	.Ldebug_ranges0+0x80
	.byte	0x1
	.byte	0x17
	.byte	0x17
	.long	0x5af
	.uleb128 0x21
	.long	0x618
	.long	.LLST8
	.long	.LVUS8
	.uleb128 0x21
	.long	0x60c
	.long	.LLST9
	.long	.LVUS9
	.byte	0
	.uleb128 0x22
	.long	0x645
	.quad	.LBI22
	.byte	.LVU27
	.long	.Ldebug_ranges0+0xb0
	.byte	0x1
	.byte	0x19
	.byte	0x14
	.uleb128 0x23
	.long	0x657
	.byte	0
	.byte	0
	.uleb128 0x24
	.long	0x625
	.quad	.LBI11
	.byte	.LVU10
	.quad	.LBB11
	.quad	.LBE11-.LBB11
	.byte	0x1
	.byte	0xf
	.byte	0x19
	.uleb128 0x21
	.long	0x637
	.long	.LLST4
	.long	.LVUS4
	.byte	0
	.byte	0
	.uleb128 0x25
	.long	.LASF68
	.byte	0x3
	.byte	0xfc
	.byte	0x1
	.long	0xfd
	.byte	0x3
	.long	0x625
	.uleb128 0x26
	.string	"__A"
	.byte	0x3
	.byte	0xfc
	.byte	0x1d
	.long	0xfd
	.uleb128 0x26
	.string	"__B"
	.byte	0x3
	.byte	0xfc
	.byte	0x2a
	.long	0xfd
	.byte	0
	.uleb128 0x27
	.long	.LASF69
	.byte	0x2
	.value	0x53d
	.byte	0x1
	.long	0xfd
	.byte	0x3
	.long	0x645
	.uleb128 0x28
	.string	"__A"
	.byte	0x2
	.value	0x53d
	.byte	0x1f
	.long	0x43
	.byte	0
	.uleb128 0x27
	.long	.LASF70
	.byte	0x2
	.value	0x4a4
	.byte	0x1
	.long	0x29
	.byte	0x3
	.long	0x665
	.uleb128 0x28
	.string	"__A"
	.byte	0x2
	.value	0x4a4
	.byte	0x1d
	.long	0x115
	.byte	0
	.uleb128 0x27
	.long	.LASF71
	.byte	0x2
	.value	0x397
	.byte	0x1
	.long	0xfd
	.byte	0x3
	.long	0x685
	.uleb128 0x28
	.string	"__P"
	.byte	0x2
	.value	0x397
	.byte	0x26
	.long	0x685
	.byte	0
	.uleb128 0x7
	.byte	0x8
	.long	0x13a
	.uleb128 0x29
	.long	.LASF79
	.long	.LASF79
	.byte	0x9
	.value	0x14c
	.byte	0xc
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x2107
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x21
	.byte	0
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x88
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x2138
	.uleb128 0xb
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x2138
	.uleb128 0xb
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x2138
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LVUS12:
	.uleb128 .LVU97
	.uleb128 .LVU98
	.uleb128 .LVU98
	.uleb128 .LVU99
.LLST12:
	.quad	.LVL23
	.quad	.LVL24
	.value	0x1
	.byte	0x50
	.quad	.LVL24
	.quad	.LVL25-1
	.value	0x1
	.byte	0x54
	.quad	0
	.quad	0
.LVUS10:
	.uleb128 .LVU76
	.uleb128 .LVU85
.LLST10:
	.quad	.LVL20
	.quad	.LVL22
	.value	0x1
	.byte	0x51
	.quad	0
	.quad	0
.LVUS11:
	.uleb128 .LVU78
	.uleb128 .LVU79
.LLST11:
	.quad	.LVL20
	.quad	.LVL21
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS0:
	.uleb128 .LVU9
	.uleb128 .LVU67
	.uleb128 .LVU68
	.uleb128 0
.LLST0:
	.quad	.LVL1
	.quad	.LVL17
	.value	0x1
	.byte	0x58
	.quad	.LVL18
	.quad	.LFE5183
	.value	0x1
	.byte	0x58
	.quad	0
	.quad	0
.LVUS1:
	.uleb128 .LVU13
	.uleb128 .LVU67
	.uleb128 .LVU68
	.uleb128 0
.LLST1:
	.quad	.LVL2
	.quad	.LVL17
	.value	0x1
	.byte	0x62
	.quad	.LVL18
	.quad	.LFE5183
	.value	0x1
	.byte	0x62
	.quad	0
	.quad	0
.LVUS2:
	.uleb128 .LVU15
	.uleb128 .LVU34
	.uleb128 .LVU34
	.uleb128 .LVU48
	.uleb128 .LVU51
	.uleb128 .LVU53
	.uleb128 .LVU53
	.uleb128 .LVU55
	.uleb128 .LVU55
	.uleb128 .LVU58
	.uleb128 .LVU58
	.uleb128 .LVU60
	.uleb128 .LVU60
	.uleb128 .LVU61
	.uleb128 .LVU62
	.uleb128 .LVU63
	.uleb128 .LVU68
	.uleb128 0
.LLST2:
	.quad	.LVL2
	.quad	.LVL5
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL5
	.quad	.LVL7
	.value	0x1
	.byte	0x50
	.quad	.LVL8
	.quad	.LVL9
	.value	0x3
	.byte	0x71
	.sleb128 -4
	.byte	0x9f
	.quad	.LVL9
	.quad	.LVL10
	.value	0x1
	.byte	0x51
	.quad	.LVL10
	.quad	.LVL12
	.value	0x1
	.byte	0x50
	.quad	.LVL12
	.quad	.LVL13
	.value	0x3
	.byte	0x70
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL13
	.quad	.LVL14
	.value	0x1
	.byte	0x50
	.quad	.LVL15
	.quad	.LVL16
	.value	0x1
	.byte	0x50
	.quad	.LVL18
	.quad	.LFE5183
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS3:
	.uleb128 .LVU16
	.uleb128 .LVU67
	.uleb128 .LVU68
	.uleb128 0
.LLST3:
	.quad	.LVL2
	.quad	.LVL17
	.value	0x1
	.byte	0x52
	.quad	.LVL18
	.quad	.LFE5183
	.value	0x1
	.byte	0x52
	.quad	0
	.quad	0
.LVUS5:
	.uleb128 .LVU21
	.uleb128 .LVU37
	.uleb128 .LVU37
	.uleb128 .LVU46
	.uleb128 .LVU46
	.uleb128 .LVU51
	.uleb128 .LVU51
	.uleb128 .LVU56
.LLST5:
	.quad	.LVL3
	.quad	.LVL5
	.value	0x2
	.byte	0x75
	.sleb128 8
	.quad	.LVL5
	.quad	.LVL6
	.value	0x7
	.byte	0x71
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x75
	.sleb128 0
	.byte	0x22
	.quad	.LVL6
	.quad	.LVL8
	.value	0x7
	.byte	0x71
	.sleb128 -4
	.byte	0x33
	.byte	0x24
	.byte	0x75
	.sleb128 0
	.byte	0x22
	.quad	.LVL8
	.quad	.LVL11
	.value	0x2
	.byte	0x75
	.sleb128 8
	.quad	0
	.quad	0
.LVUS6:
	.uleb128 .LVU31
	.uleb128 .LVU34
	.uleb128 .LVU34
	.uleb128 .LVU48
	.uleb128 .LVU48
	.uleb128 .LVU51
	.uleb128 .LVU51
	.uleb128 .LVU56
.LLST6:
	.quad	.LVL4
	.quad	.LVL5
	.value	0x1
	.byte	0x50
	.quad	.LVL5
	.quad	.LVL7
	.value	0x2
	.byte	0x3f
	.byte	0x9f
	.quad	.LVL7
	.quad	.LVL8
	.value	0x1
	.byte	0x50
	.quad	.LVL8
	.quad	.LVL11
	.value	0x2
	.byte	0x3f
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS7:
	.uleb128 .LVU19
	.uleb128 .LVU21
	.uleb128 .LVU35
	.uleb128 .LVU37
.LLST7:
	.quad	.LVL3
	.quad	.LVL3
	.value	0x3
	.byte	0x75
	.sleb128 8
	.byte	0x9f
	.quad	.LVL5
	.quad	.LVL5
	.value	0x8
	.byte	0x71
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x75
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS8:
	.uleb128 .LVU23
	.uleb128 .LVU25
	.uleb128 .LVU39
	.uleb128 .LVU41
.LLST8:
	.quad	.LVL3
	.quad	.LVL3
	.value	0x2
	.byte	0x75
	.sleb128 8
	.quad	.LVL5
	.quad	.LVL5
	.value	0x7
	.byte	0x71
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x75
	.sleb128 0
	.byte	0x22
	.quad	0
	.quad	0
.LVUS9:
	.uleb128 .LVU23
	.uleb128 .LVU25
	.uleb128 .LVU39
	.uleb128 .LVU41
.LLST9:
	.quad	.LVL3
	.quad	.LVL3
	.value	0x1
	.byte	0x62
	.quad	.LVL5
	.quad	.LVL5
	.value	0x1
	.byte	0x62
	.quad	0
	.quad	0
.LVUS4:
	.uleb128 .LVU10
	.uleb128 .LVU13
.LLST4:
	.quad	.LVL1
	.quad	.LVL2
	.value	0x1
	.byte	0x58
	.quad	0
	.quad	0
	.section	.debug_aranges,"",@progbits
	.long	0x3c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	.LFB5185
	.quad	.LFE5185-.LFB5185
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LBB13
	.quad	.LBE13
	.quad	.LBB34
	.quad	.LBE34
	.quad	0
	.quad	0
	.quad	.LBB14
	.quad	.LBE14
	.quad	.LBB27
	.quad	.LBE27
	.quad	.LBB29
	.quad	.LBE29
	.quad	.LBB32
	.quad	.LBE32
	.quad	0
	.quad	0
	.quad	.LBB19
	.quad	.LBE19
	.quad	.LBB30
	.quad	.LBE30
	.quad	0
	.quad	0
	.quad	.LBB22
	.quad	.LBE22
	.quad	.LBB28
	.quad	.LBE28
	.quad	.LBB31
	.quad	.LBE31
	.quad	.LBB33
	.quad	.LBE33
	.quad	0
	.quad	0
	.quad	.LBB35
	.quad	.LBE35
	.quad	.LBB36
	.quad	.LBE36
	.quad	0
	.quad	0
	.quad	.Ltext0
	.quad	.Letext0
	.quad	.LFB5185
	.quad	.LFE5185
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF65:
	.string	"limit"
.LASF74:
	.string	"/home/fuchun.zhang/code/github.com/ahfuzhang/learning_go_plan9_assembly/examples/is_const/src"
.LASF16:
	.string	"double"
.LASF76:
	.string	"_IO_FILE"
.LASF57:
	.string	"sys_nerr"
.LASF32:
	.string	"_IO_save_end"
.LASF63:
	.string	"is_const_avx2"
.LASF0:
	.string	"short int"
.LASF10:
	.string	"size_t"
.LASF72:
	.string	"GNU C17 8.3.0 -mavx2 -mtune=generic -march=x86-64 -g -O3"
.LASF42:
	.string	"_offset"
.LASF78:
	.string	"main"
.LASF26:
	.string	"_IO_write_ptr"
.LASF21:
	.string	"_flags"
.LASF28:
	.string	"_IO_buf_base"
.LASF41:
	.string	"_lock"
.LASF33:
	.string	"_markers"
.LASF23:
	.string	"_IO_read_end"
.LASF46:
	.string	"_freeres_buf"
.LASF75:
	.string	"__m256i_u"
.LASF69:
	.string	"_mm256_set1_epi64x"
.LASF20:
	.string	"__m256d"
.LASF19:
	.string	"__m256i"
.LASF3:
	.string	"float"
.LASF56:
	.string	"stderr"
.LASF2:
	.string	"long long int"
.LASF1:
	.string	"char"
.LASF6:
	.string	"long int"
.LASF11:
	.string	"__int64_t"
.LASF79:
	.string	"printf"
.LASF38:
	.string	"_cur_column"
.LASF62:
	.string	"is_const"
.LASF64:
	.string	"first_vec"
.LASF37:
	.string	"_old_offset"
.LASF7:
	.string	"unsigned char"
.LASF71:
	.string	"_mm256_loadu_si256"
.LASF9:
	.string	"signed char"
.LASF43:
	.string	"_codecvt"
.LASF15:
	.string	"long long unsigned int"
.LASF5:
	.string	"unsigned int"
.LASF51:
	.string	"_IO_marker"
.LASF40:
	.string	"_shortbuf"
.LASF25:
	.string	"_IO_write_base"
.LASF49:
	.string	"_unused2"
.LASF22:
	.string	"_IO_read_ptr"
.LASF29:
	.string	"_IO_buf_end"
.LASF17:
	.string	"__v4df"
.LASF18:
	.string	"__v4di"
.LASF44:
	.string	"_wide_data"
.LASF45:
	.string	"_freeres_list"
.LASF70:
	.string	"_mm256_movemask_pd"
.LASF59:
	.string	"_Bool"
.LASF47:
	.string	"__pad5"
.LASF66:
	.string	"data"
.LASF8:
	.string	"short unsigned int"
.LASF4:
	.string	"long unsigned int"
.LASF27:
	.string	"_IO_write_end"
.LASF73:
	.string	"is_const.c"
.LASF13:
	.string	"__off64_t"
.LASF14:
	.string	"int64_t"
.LASF35:
	.string	"_fileno"
.LASF34:
	.string	"_chain"
.LASF53:
	.string	"_IO_wide_data"
.LASF60:
	.string	"count"
.LASF48:
	.string	"_mode"
.LASF12:
	.string	"__off_t"
.LASF31:
	.string	"_IO_backup_base"
.LASF54:
	.string	"stdin"
.LASF36:
	.string	"_flags2"
.LASF52:
	.string	"_IO_codecvt"
.LASF24:
	.string	"_IO_read_base"
.LASF68:
	.string	"_mm256_cmpeq_epi64"
.LASF39:
	.string	"_vtable_offset"
.LASF30:
	.string	"_IO_save_base"
.LASF58:
	.string	"sys_errlist"
.LASF50:
	.string	"FILE"
.LASF55:
	.string	"stdout"
.LASF77:
	.string	"_IO_lock_t"
.LASF67:
	.string	"mask"
.LASF61:
	.string	"first"
	.ident	"GCC: (Debian 8.3.0-6) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
