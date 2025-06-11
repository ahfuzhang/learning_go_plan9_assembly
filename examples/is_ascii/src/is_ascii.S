	.file	"is_ascii.c"
	.text
.Ltext0:
	.p2align 4,,15
	.globl	is_ascii_faster
	.type	is_ascii_faster, @function
is_ascii_faster:
.LVL0:
.LFB5179:
	.file 1 "is_ascii.c"
	.loc 1 12 48 view -0
	.cfi_startproc
	.loc 1 13 5 view .LVU1
	.loc 1 14 5 view .LVU2
	.loc 1 14 27 is_stmt 0 view .LVU3
	movslq	%esi, %rdx
	.loc 1 14 17 view .LVU4
	addq	%rdi, %rdx
.LVL1:
	.loc 1 17 5 is_stmt 1 view .LVU5
	.loc 1 17 11 is_stmt 0 view .LVU6
	cmpl	$31, %esi
	jle	.L2
.LBB28:
	.loc 1 18 9 is_stmt 1 view .LVU7
.LVL2:
.LBB29:
.LBI29:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/8/include/avxintrin.h"
	.loc 2 919 1 view .LVU8
.LBB30:
	.loc 2 921 3 view .LVU9
	.loc 2 921 3 is_stmt 0 view .LVU10
.LBE30:
.LBE29:
	.loc 1 19 9 is_stmt 1 view .LVU11
.LBB34:
.LBI34:
	.file 3 "/usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h"
	.loc 3 433 1 view .LVU12
.LBB35:
	.loc 3 435 3 view .LVU13
.LBE35:
.LBE34:
.LBB39:
.LBB31:
	.loc 2 921 10 is_stmt 0 view .LVU14
	vmovdqu	(%rdi), %xmm2
	vinserti128	$0x1, 16(%rdi), %ymm2, %ymm0
.LBE31:
.LBE39:
.LBB40:
.LBB36:
	.loc 3 435 10 view .LVU15
	vpmovmskb	%ymm0, %eax
.LVL3:
	.loc 3 435 10 view .LVU16
.LBE36:
.LBE40:
	.loc 1 20 9 is_stmt 1 view .LVU17
	.loc 1 20 12 is_stmt 0 view .LVU18
	testl	%eax, %eax
	je	.L4
	jmp	.L9
.LVL4:
	.p2align 4,,10
	.p2align 3
.L5:
	.loc 1 18 9 is_stmt 1 view .LVU19
.LBB41:
	.loc 2 919 1 view .LVU20
.LBB32:
	.loc 2 921 3 view .LVU21
	.loc 2 921 3 is_stmt 0 view .LVU22
.LBE32:
.LBE41:
	.loc 1 19 9 is_stmt 1 view .LVU23
.LBB42:
	.loc 3 433 1 view .LVU24
.LBB37:
	.loc 3 435 3 view .LVU25
.LBE37:
.LBE42:
.LBB43:
.LBB33:
	.loc 2 921 10 is_stmt 0 view .LVU26
	vmovdqu	(%rdi), %xmm1
	vinserti128	$0x1, 16(%rdi), %ymm1, %ymm0
.LBE33:
.LBE43:
.LBB44:
.LBB38:
	.loc 3 435 10 view .LVU27
	vpmovmskb	%ymm0, %eax
.LVL5:
	.loc 3 435 10 view .LVU28
.LBE38:
.LBE44:
	.loc 1 20 9 is_stmt 1 view .LVU29
	.loc 1 20 12 is_stmt 0 view .LVU30
	testl	%eax, %eax
	jne	.L9
.LVL6:
.L4:
	.loc 1 23 9 is_stmt 1 view .LVU31
	.loc 1 23 11 is_stmt 0 view .LVU32
	addq	$32, %rdi
.LVL7:
	.loc 1 23 11 view .LVU33
.LBE28:
	.loc 1 17 16 view .LVU34
	movq	%rdx, %rax
	subq	%rdi, %rax
	.loc 1 17 11 view .LVU35
	cmpq	$31, %rax
	jg	.L5
	vzeroupper
.LVL8:
.L2:
	.loc 1 27 11 view .LVU36
	cmpq	%rdi, %rdx
	ja	.L7
.L10:
	.loc 1 34 12 view .LVU37
	movl	$1, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L16:
	.loc 1 31 9 is_stmt 1 view .LVU38
	.loc 1 31 10 is_stmt 0 view .LVU39
	addq	$1, %rdi
.LVL9:
	.loc 1 27 11 view .LVU40
	cmpq	%rdi, %rdx
	je	.L10
.L7:
	.loc 1 28 9 is_stmt 1 view .LVU41
	.loc 1 28 12 is_stmt 0 view .LVU42
	cmpb	$0, (%rdi)
	jns	.L16
.LBB45:
	.loc 1 21 20 view .LVU43
	xorl	%eax, %eax
.LBE45:
	.loc 1 35 1 view .LVU44
	ret
.LVL10:
	.p2align 4,,10
	.p2align 3
.L9:
.LBB46:
	.loc 1 21 20 view .LVU45
	xorl	%eax, %eax
.LVL11:
	.loc 1 21 20 view .LVU46
	vzeroupper
	ret
.LBE46:
	.cfi_endproc
.LFE5179:
	.size	is_ascii_faster, .-is_ascii_faster
	.p2align 4,,15
	.globl	get_random_string
	.type	get_random_string, @function
get_random_string:
.LVL12:
.LFB5180:
	.loc 1 37 34 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 38 5 view .LVU48
	.loc 1 37 34 is_stmt 0 view .LVU49
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	.loc 1 38 8 view .LVU50
	testl	%edi, %edi
	jle	.L20
	movslq	%edi, %rbx
	.loc 1 40 5 is_stmt 1 view .LVU51
	.loc 1 40 35 is_stmt 0 view .LVU52
	leal	1(%rbx), %edi
.LVL13:
	.loc 1 40 24 view .LVU53
	movslq	%edi, %rdi
	call	malloc@PLT
.LVL14:
	movq	%rax, %r12
.LVL15:
	.loc 1 41 5 is_stmt 1 view .LVU54
	.loc 1 41 8 is_stmt 0 view .LVU55
	testq	%rax, %rax
	je	.L20
	.loc 1 44 5 is_stmt 1 view .LVU56
	.loc 1 44 25 is_stmt 0 view .LVU57
	xorl	%edi, %edi
	movq	%r12, %r13
	call	time@PLT
.LVL16:
	.loc 1 44 5 view .LVU58
	movl	%eax, %edi
	call	srand@PLT
.LVL17:
	.loc 1 46 5 is_stmt 1 view .LVU59
.LBB47:
	.loc 1 46 10 view .LVU60
	.loc 1 46 10 is_stmt 0 view .LVU61
	leal	-1(%rbx), %eax
	leaq	1(%r12,%rax), %rbp
.LVL18:
	.p2align 4,,10
	.p2align 3
.L21:
	.loc 1 47 9 is_stmt 1 discriminator 3 view .LVU62
	.loc 1 47 25 is_stmt 0 discriminator 3 view .LVU63
	call	rand@PLT
.LVL19:
	addq	$1, %r13
.LVL20:
	.loc 1 47 32 discriminator 3 view .LVU64
	cltd
	shrl	$25, %edx
	addl	%edx, %eax
	andl	$127, %eax
	subl	%edx, %eax
	.loc 1 47 18 discriminator 3 view .LVU65
	movb	%al, -1(%r13)
	.loc 1 46 5 discriminator 3 view .LVU66
	cmpq	%rbp, %r13
	jne	.L21
.LBE47:
	.loc 1 50 5 is_stmt 1 view .LVU67
	.loc 1 50 14 is_stmt 0 view .LVU68
	movb	$0, (%r12,%rbx)
	.loc 1 51 5 is_stmt 1 view .LVU69
	.loc 1 52 1 is_stmt 0 view .LVU70
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movq	%r12, %rax
	popq	%rbx
	.cfi_def_cfa_offset 32
.LVL21:
	.loc 1 52 1 view .LVU71
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
.LVL22:
	.loc 1 52 1 view .LVU72
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.LVL23:
	.p2align 4,,10
	.p2align 3
.L20:
	.cfi_restore_state
	.loc 1 52 1 view .LVU73
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	.loc 1 38 26 view .LVU74
	xorl	%r12d, %r12d
	.loc 1 52 1 view .LVU75
	popq	%rbx
	.cfi_def_cfa_offset 32
	movq	%r12, %rax
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE5180:
	.size	get_random_string, .-get_random_string
	.p2align 4,,15
	.globl	is_ascii
	.type	is_ascii, @function
is_ascii:
.LVL24:
.LFB5181:
	.loc 1 54 40 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 55 5 view .LVU77
	.loc 1 55 10 view .LVU78
	.loc 1 60 5 view .LVU79
	.loc 1 61 1 is_stmt 0 view .LVU80
	movl	$1, %eax
	ret
	.cfi_endproc
.LFE5181:
	.size	is_ascii, .-is_ascii
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"spend: %ld us, ret=%d\n"
.LC3:
	.string	"speed: %.1f mb / s\n"
.LC4:
	.string	"faster spend: %ld us, ret=%d\n"
.LC5:
	.string	"faster speed: %.1f mb / s\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LVL25:
.LFB5182:
	.loc 1 63 33 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 64 5 view .LVU82
	.loc 1 65 5 view .LVU83
	.loc 1 63 33 is_stmt 0 view .LVU84
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx
	subq	$64, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	.loc 1 65 8 view .LVU85
	cmpl	$1, %edi
	jg	.L30
.LVL26:
	.loc 1 72 5 is_stmt 1 view .LVU86
	.loc 1 72 17 is_stmt 0 view .LVU87
	movl	$10485760, %edi
.LVL27:
	.loc 1 76 5 view .LVU88
	leaq	-80(%rbp), %r15
	.loc 1 68 9 view .LVU89
	movl	$10485760, %r12d
	.loc 1 64 9 view .LVU90
	movl	$1000000, %r14d
	.loc 1 72 17 view .LVU91
	call	get_random_string
.LVL28:
	.loc 1 76 5 view .LVU92
	movq	%r15, %rdi
	xorl	%esi, %esi
	.loc 1 72 17 view .LVU93
	movq	%rax, %rbx
.LVL29:
	.loc 1 73 5 is_stmt 1 view .LVU94
	.loc 1 74 5 view .LVU95
	.loc 1 75 5 view .LVU96
	.loc 1 76 5 view .LVU97
	call	gettimeofday@PLT
.LVL30:
	.loc 1 77 5 view .LVU98
.LBB48:
	.loc 1 77 10 view .LVU99
	.loc 1 77 10 is_stmt 0 view .LVU100
.LBE48:
	.loc 1 76 5 view .LVU101
	movl	$1000000, %edi
.LVL31:
.L31:
	.loc 1 76 5 view .LVU102
	leal	(%r12,%r12), %esi
	vpxor	%xmm0, %xmm0, %xmm0
	movl	%edi, %edx
	leal	(%rsi,%r12), %r8d
	vpinsrd	$1, %r12d, %xmm0, %xmm0
	shrl	$3, %edx
	leal	(%r8,%r12), %eax
	leal	(%rax,%r12), %r9d
	leal	(%r9,%r12), %ecx
	movl	%ecx, -88(%rbp)
	vmovd	-88(%rbp), %xmm7
	leal	(%rcx,%r12), %r10d
	movl	%eax, -88(%rbp)
	vmovd	-88(%rbp), %xmm3
	leal	0(,%r12,8), %eax
	movl	%esi, -88(%rbp)
	vpinsrd	$1, %r10d, %xmm7, %xmm2
	vmovd	-88(%rbp), %xmm7
	vpinsrd	$1, %r9d, %xmm3, %xmm1
	movl	%eax, -88(%rbp)
	.loc 1 64 9 view .LVU103
	xorl	%eax, %eax
	vpinsrd	$1, %r8d, %xmm7, %xmm3
	vpunpcklqdq	%xmm2, %xmm1, %xmm1
	vpbroadcastd	-88(%rbp), %ymm2
	movl	%r12d, -88(%rbp)
	vpunpcklqdq	%xmm3, %xmm0, %xmm0
	vpbroadcastd	-88(%rbp), %ymm3
	vinserti128	$0x1, %xmm1, %ymm0, %ymm0
.LVL32:
	.p2align 4,,10
	.p2align 3
.L35:
.LBB49:
	.loc 1 78 9 is_stmt 1 view .LVU104
	.loc 1 78 9 is_stmt 0 view .LVU105
.LBE49:
	.loc 1 55 5 is_stmt 1 view .LVU106
	.loc 1 55 10 view .LVU107
	.loc 1 60 5 view .LVU108
.LBB50:
	.loc 1 79 9 view .LVU109
	addl	$1, %eax
	.loc 1 79 21 is_stmt 0 view .LVU110
	vpaddd	%ymm3, %ymm0, %ymm1
	.loc 1 79 21 view .LVU111
	vpaddd	%ymm0, %ymm2, %ymm0
	cmpl	%eax, %edx
	jne	.L35
	.loc 1 79 21 view .LVU112
	movl	%edi, %eax
	vextracti128	$0x1, %ymm1, %xmm1
	andl	$-8, %eax
	vpextrd	$3, %xmm1, %r13d
	movl	%eax, %edx
	imull	%r12d, %edx
	cmpl	%edi, %eax
	je	.L59
	vzeroupper
.LVL33:
.L34:
	.loc 1 78 9 is_stmt 1 view .LVU113
	.loc 1 78 9 is_stmt 0 view .LVU114
.LBE50:
	.loc 1 55 5 is_stmt 1 view .LVU115
	.loc 1 55 10 view .LVU116
	.loc 1 60 5 view .LVU117
.LBB51:
	.loc 1 79 9 view .LVU118
	.loc 1 79 21 is_stmt 0 view .LVU119
	leal	(%rdx,%r12), %r13d
.LVL34:
	.loc 1 77 33 view .LVU120
	leal	1(%rax), %edx
.LVL35:
	.loc 1 77 5 view .LVU121
	cmpl	%r14d, %edx
	jge	.L33
	.loc 1 78 9 is_stmt 1 view .LVU122
.LVL36:
	.loc 1 78 9 is_stmt 0 view .LVU123
.LBE51:
	.loc 1 55 5 is_stmt 1 view .LVU124
	.loc 1 55 10 view .LVU125
	.loc 1 60 5 view .LVU126
.LBB52:
	.loc 1 79 9 view .LVU127
	.loc 1 77 33 is_stmt 0 view .LVU128
	leal	2(%rax), %edx
.LVL37:
	.loc 1 79 21 view .LVU129
	addl	%r12d, %r13d
.LVL38:
	.loc 1 77 5 view .LVU130
	cmpl	%r14d, %edx
	jge	.L33
	.loc 1 78 9 is_stmt 1 view .LVU131
.LVL39:
	.loc 1 78 9 is_stmt 0 view .LVU132
.LBE52:
	.loc 1 55 5 is_stmt 1 view .LVU133
	.loc 1 55 10 view .LVU134
	.loc 1 60 5 view .LVU135
.LBB53:
	.loc 1 79 9 view .LVU136
	.loc 1 77 33 is_stmt 0 view .LVU137
	leal	3(%rax), %edx
.LVL40:
	.loc 1 79 21 view .LVU138
	addl	%r12d, %r13d
.LVL41:
	.loc 1 77 5 view .LVU139
	cmpl	%r14d, %edx
	jge	.L33
	.loc 1 78 9 is_stmt 1 view .LVU140
.LVL42:
	.loc 1 78 9 is_stmt 0 view .LVU141
.LBE53:
	.loc 1 55 5 is_stmt 1 view .LVU142
	.loc 1 55 10 view .LVU143
	.loc 1 60 5 view .LVU144
.LBB54:
	.loc 1 79 9 view .LVU145
	.loc 1 77 33 is_stmt 0 view .LVU146
	leal	4(%rax), %edx
.LVL43:
	.loc 1 79 21 view .LVU147
	addl	%r12d, %r13d
.LVL44:
	.loc 1 77 5 view .LVU148
	cmpl	%r14d, %edx
	jge	.L33
	.loc 1 78 9 is_stmt 1 view .LVU149
.LVL45:
	.loc 1 78 9 is_stmt 0 view .LVU150
.LBE54:
	.loc 1 55 5 is_stmt 1 view .LVU151
	.loc 1 55 10 view .LVU152
	.loc 1 60 5 view .LVU153
.LBB55:
	.loc 1 79 9 view .LVU154
	.loc 1 77 33 is_stmt 0 view .LVU155
	leal	5(%rax), %edx
.LVL46:
	.loc 1 79 21 view .LVU156
	addl	%r12d, %r13d
.LVL47:
	.loc 1 77 5 view .LVU157
	cmpl	%r14d, %edx
	jge	.L33
	.loc 1 78 9 is_stmt 1 view .LVU158
.LVL48:
	.loc 1 78 9 is_stmt 0 view .LVU159
.LBE55:
	.loc 1 55 5 is_stmt 1 view .LVU160
	.loc 1 55 10 view .LVU161
	.loc 1 60 5 view .LVU162
.LBB56:
	.loc 1 79 9 view .LVU163
	.loc 1 77 33 is_stmt 0 view .LVU164
	leal	6(%rax), %edx
.LVL49:
	.loc 1 79 21 view .LVU165
	addl	%r12d, %r13d
.LVL50:
	.loc 1 77 5 view .LVU166
	cmpl	%r14d, %edx
	jge	.L33
	.loc 1 78 9 is_stmt 1 view .LVU167
.LVL51:
	.loc 1 78 9 is_stmt 0 view .LVU168
.LBE56:
	.loc 1 55 5 is_stmt 1 view .LVU169
	.loc 1 55 10 view .LVU170
	.loc 1 60 5 view .LVU171
.LBB57:
	.loc 1 79 9 view .LVU172
	.loc 1 77 33 is_stmt 0 view .LVU173
	addl	$7, %eax
	.loc 1 79 21 view .LVU174
	addl	%r12d, %r13d
.LVL52:
	.loc 1 77 5 view .LVU175
	cmpl	%r14d, %eax
	jge	.L33
	.loc 1 78 9 is_stmt 1 view .LVU176
.LVL53:
	.loc 1 78 9 is_stmt 0 view .LVU177
.LBE57:
	.loc 1 55 5 is_stmt 1 view .LVU178
	.loc 1 55 10 view .LVU179
	.loc 1 60 5 view .LVU180
.LBB58:
	.loc 1 79 9 view .LVU181
	.loc 1 79 21 is_stmt 0 view .LVU182
	addl	%r12d, %r13d
.LVL54:
.L33:
	.loc 1 79 21 view .LVU183
.LBE58:
	.loc 1 81 5 is_stmt 1 view .LVU184
	leaq	-64(%rbp), %r8
	xorl	%esi, %esi
	movq	%r8, %rdi
	movq	%r8, -104(%rbp)
	call	gettimeofday@PLT
.LVL55:
	.loc 1 82 5 view .LVU185
	.loc 1 82 28 is_stmt 0 view .LVU186
	movq	-64(%rbp), %rcx
	subq	-80(%rbp), %rcx
	.loc 1 83 5 view .LVU187
	xorl	%eax, %eax
	.loc 1 82 50 view .LVU188
	imull	$1000000, %ecx, %ecx
	.loc 1 82 63 view .LVU189
	subl	-72(%rbp), %ecx
	.loc 1 82 50 view .LVU190
	addl	-56(%rbp), %ecx
.LVL56:
	.loc 1 83 5 is_stmt 1 view .LVU191
	movl	$1, %edx
	movl	%ecx, %esi
	leaq	.LC0(%rip), %rdi
	movl	%ecx, -92(%rbp)
	call	printf@PLT
.LVL57:
	.loc 1 84 5 view .LVU192
	.loc 1 84 37 is_stmt 0 view .LVU193
	vxorpd	%xmm6, %xmm6, %xmm6
	.loc 1 84 73 view .LVU194
	movl	-92(%rbp), %ecx
	.loc 1 84 56 view .LVU195
	vmovsd	.LC1(%rip), %xmm7
	.loc 1 84 37 view .LVU196
	vcvtsi2sd	%r13d, %xmm6, %xmm6
	.loc 1 84 5 view .LVU197
	leaq	.LC3(%rip), %rdi
	movl	$1, %eax
	.loc 1 84 56 view .LVU198
	vmulsd	%xmm6, %xmm7, %xmm0
	.loc 1 84 37 view .LVU199
	vmovsd	%xmm6, -88(%rbp)
	.loc 1 84 63 view .LVU200
	vmulsd	%xmm7, %xmm0, %xmm1
	.loc 1 84 73 view .LVU201
	vxorpd	%xmm0, %xmm0, %xmm0
	vcvtsi2sd	%ecx, %xmm0, %xmm0
	.loc 1 84 86 view .LVU202
	vdivsd	.LC2(%rip), %xmm0, %xmm0
	.loc 1 84 5 view .LVU203
	vdivsd	%xmm0, %xmm1, %xmm0
	call	printf@PLT
.LVL58:
	.loc 1 86 5 is_stmt 1 view .LVU204
	xorl	%esi, %esi
	movq	%r15, %rdi
	call	gettimeofday@PLT
.LVL59:
	.loc 1 87 5 view .LVU205
.LBB59:
	.loc 1 87 10 view .LVU206
	.loc 1 87 5 is_stmt 0 view .LVU207
	testl	%r14d, %r14d
	movq	-104(%rbp), %r8
	jle	.L48
	movslq	%r12d, %rdi
	.loc 1 87 14 view .LVU208
	xorl	%eax, %eax
	addq	%rbx, %rdi
.LVL60:
	.p2align 4,,10
	.p2align 3
.L44:
	.loc 1 88 9 is_stmt 1 view .LVU209
.LBB60:
.LBI60:
	.loc 1 12 6 view .LVU210
.LBB61:
	.loc 1 13 5 view .LVU211
	.loc 1 14 5 view .LVU212
	.loc 1 17 5 view .LVU213
	.loc 1 17 11 is_stmt 0 view .LVU214
	cmpl	$31, %r12d
	jle	.L49
.LBB62:
	.loc 1 18 9 is_stmt 1 view .LVU215
.LVL61:
.LBB63:
.LBI63:
	.loc 2 919 1 view .LVU216
.LBB64:
	.loc 2 921 3 view .LVU217
	.loc 2 921 3 is_stmt 0 view .LVU218
.LBE64:
.LBE63:
	.loc 1 19 9 is_stmt 1 view .LVU219
.LBB68:
.LBI68:
	.loc 3 433 1 view .LVU220
.LBB69:
	.loc 3 435 3 view .LVU221
.LBE69:
.LBE68:
.LBB73:
.LBB65:
	.loc 2 921 10 is_stmt 0 view .LVU222
	vmovdqu	(%rbx), %xmm5
	vinserti128	$0x1, 16(%rbx), %ymm5, %ymm0
.LBE65:
.LBE73:
.LBB74:
.LBB70:
	.loc 3 435 10 view .LVU223
	vpmovmskb	%ymm0, %r15d
.LVL62:
	.loc 3 435 10 view .LVU224
.LBE70:
.LBE74:
	.loc 1 20 9 is_stmt 1 view .LVU225
	.loc 1 20 12 is_stmt 0 view .LVU226
	testl	%r15d, %r15d
	jne	.L53
	movq	%rbx, %rcx
	jmp	.L40
.LVL63:
	.p2align 4,,10
	.p2align 3
.L41:
	.loc 1 18 9 is_stmt 1 view .LVU227
.LBB75:
	.loc 2 919 1 view .LVU228
.LBB66:
	.loc 2 921 3 view .LVU229
	.loc 2 921 3 is_stmt 0 view .LVU230
.LBE66:
.LBE75:
	.loc 1 19 9 is_stmt 1 view .LVU231
.LBB76:
	.loc 3 433 1 view .LVU232
.LBB71:
	.loc 3 435 3 view .LVU233
.LBE71:
.LBE76:
.LBB77:
.LBB67:
	.loc 2 921 10 is_stmt 0 view .LVU234
	vmovdqu	(%rcx), %xmm4
	vinserti128	$0x1, 16(%rcx), %ymm4, %ymm0
.LBE67:
.LBE77:
.LBB78:
.LBB72:
	.loc 3 435 10 view .LVU235
	vpmovmskb	%ymm0, %esi
.LVL64:
	.loc 3 435 10 view .LVU236
.LBE72:
.LBE78:
	.loc 1 20 9 is_stmt 1 view .LVU237
	.loc 1 20 12 is_stmt 0 view .LVU238
	testl	%esi, %esi
	jne	.L39
.LVL65:
.L40:
	.loc 1 23 9 is_stmt 1 view .LVU239
	.loc 1 23 11 is_stmt 0 view .LVU240
	addq	$32, %rcx
.LVL66:
	.loc 1 23 11 view .LVU241
.LBE62:
	.loc 1 17 16 view .LVU242
	movq	%rdi, %rsi
	subq	%rcx, %rsi
	.loc 1 17 11 view .LVU243
	cmpq	$31, %rsi
	jg	.L41
.LVL67:
.L38:
	.loc 1 27 11 view .LVU244
	cmpq	%rcx, %rdi
	ja	.L43
	.loc 1 27 11 view .LVU245
	jmp	.L51
	.p2align 4,,10
	.p2align 3
.L60:
	.loc 1 31 9 is_stmt 1 view .LVU246
	.loc 1 31 10 is_stmt 0 view .LVU247
	addq	$1, %rcx
.LVL68:
	.loc 1 27 11 view .LVU248
	cmpq	%rcx, %rdi
	je	.L51
.L43:
	.loc 1 28 9 is_stmt 1 view .LVU249
	.loc 1 28 12 is_stmt 0 view .LVU250
	cmpb	$0, (%rcx)
	jns	.L60
.LVL69:
.L53:
	.loc 1 28 12 view .LVU251
	xorl	%r15d, %r15d
.L39:
.LVL70:
	.loc 1 28 12 view .LVU252
.LBE61:
.LBE60:
	.loc 1 89 9 is_stmt 1 view .LVU253
	.loc 1 87 33 is_stmt 0 view .LVU254
	addl	$1, %eax
.LVL71:
	.loc 1 87 5 view .LVU255
	cmpl	%r14d, %eax
	jne	.L44
	leal	(%r12,%r13), %edx
	leal	-1(%rax), %r13d
	vxorpd	%xmm7, %xmm7, %xmm7
	imull	%r13d, %r12d
	leal	(%r12,%rdx), %r13d
	vcvtsi2sd	%r13d, %xmm7, %xmm7
	vmovsd	%xmm7, -88(%rbp)
	vzeroupper
.LVL72:
.L37:
	.loc 1 87 5 view .LVU256
.LBE59:
	.loc 1 91 5 is_stmt 1 view .LVU257
	movq	%r8, %rdi
	xorl	%esi, %esi
	call	gettimeofday@PLT
.LVL73:
	.loc 1 92 5 view .LVU258
	.loc 1 92 24 is_stmt 0 view .LVU259
	movq	-64(%rbp), %rbx
.LVL74:
	.loc 1 92 24 view .LVU260
	subq	-80(%rbp), %rbx
	.loc 1 93 5 view .LVU261
	movl	%r15d, %edx
	.loc 1 92 46 view .LVU262
	imull	$1000000, %ebx, %ebx
	.loc 1 92 59 view .LVU263
	subl	-72(%rbp), %ebx
	.loc 1 92 46 view .LVU264
	addl	-56(%rbp), %ebx
.LVL75:
	.loc 1 93 5 is_stmt 1 view .LVU265
	xorl	%eax, %eax
	movl	%ebx, %esi
	leaq	.LC4(%rip), %rdi
	call	printf@PLT
.LVL76:
	.loc 1 94 5 view .LVU266
	.loc 1 94 63 is_stmt 0 view .LVU267
	vmovsd	.LC1(%rip), %xmm7
	vmulsd	-88(%rbp), %xmm7, %xmm0
	.loc 1 94 5 view .LVU268
	leaq	.LC5(%rip), %rdi
	movl	$1, %eax
	.loc 1 94 70 view .LVU269
	vmulsd	%xmm7, %xmm0, %xmm1
	.loc 1 94 80 view .LVU270
	vxorpd	%xmm0, %xmm0, %xmm0
	vcvtsi2sd	%ebx, %xmm0, %xmm0
	.loc 1 94 93 view .LVU271
	vdivsd	.LC2(%rip), %xmm0, %xmm0
	.loc 1 94 5 view .LVU272
	vdivsd	%xmm0, %xmm1, %xmm0
	call	printf@PLT
.LVL77:
	.loc 1 95 5 is_stmt 1 view .LVU273
	.loc 1 96 1 is_stmt 0 view .LVU274
	addq	$64, %rsp
	xorl	%eax, %eax
	popq	%rbx
.LVL78:
	.loc 1 96 1 view .LVU275
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
.LVL79:
	.p2align 4,,10
	.p2align 3
.L51:
	.cfi_restore_state
.LBB81:
.LBB80:
.LBB79:
	.loc 1 27 11 view .LVU276
	movl	$1, %r15d
	jmp	.L39
.LVL80:
.L49:
	.loc 1 17 11 view .LVU277
	movq	%rbx, %rcx
	jmp	.L38
.LVL81:
.L30:
	.loc 1 17 11 view .LVU278
	movl	%edi, %ebx
.LBE79:
.LBE80:
.LBE81:
.LBB82:
.LBB83:
	.file 4 "/usr/include/stdlib.h"
	.loc 4 363 16 view .LVU279
	movq	8(%rsi), %rdi
.LVL82:
	.loc 4 363 16 view .LVU280
	movq	%rsi, %r12
.LBE83:
.LBE82:
	.loc 1 66 9 is_stmt 1 view .LVU281
.LVL83:
.LBB85:
.LBI82:
	.loc 4 361 1 view .LVU282
.LBB84:
	.loc 4 363 3 view .LVU283
	.loc 4 363 16 is_stmt 0 view .LVU284
	movl	$10, %edx
	xorl	%esi, %esi
.LVL84:
	.loc 4 363 16 view .LVU285
	call	strtol@PLT
.LVL85:
	.loc 4 363 16 view .LVU286
	movq	%rax, %r13
	.loc 4 363 10 view .LVU287
	movl	%eax, %r14d
.LVL86:
	.loc 4 363 10 view .LVU288
.LBE84:
.LBE85:
	.loc 1 68 5 is_stmt 1 view .LVU289
	.loc 1 69 5 view .LVU290
	.loc 1 69 8 is_stmt 0 view .LVU291
	cmpl	$2, %ebx
	je	.L45
	.loc 1 70 9 is_stmt 1 view .LVU292
.LVL87:
.LBB86:
.LBI86:
	.loc 4 361 1 view .LVU293
.LBB87:
	.loc 4 363 3 view .LVU294
	.loc 4 363 16 is_stmt 0 view .LVU295
	movq	16(%r12), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
.LVL88:
	.loc 4 363 10 view .LVU296
	movl	%eax, %r12d
.LVL89:
.L32:
	.loc 4 363 10 view .LVU297
.LBE87:
.LBE86:
	.loc 1 72 5 is_stmt 1 view .LVU298
	.loc 1 72 17 is_stmt 0 view .LVU299
	movl	%r12d, %edi
	.loc 1 76 5 view .LVU300
	leaq	-80(%rbp), %r15
	.loc 1 72 17 view .LVU301
	call	get_random_string
.LVL90:
	.loc 1 76 5 view .LVU302
	xorl	%esi, %esi
	movq	%r15, %rdi
	.loc 1 72 17 view .LVU303
	movq	%rax, %rbx
.LVL91:
	.loc 1 73 5 is_stmt 1 view .LVU304
	.loc 1 74 5 view .LVU305
	.loc 1 75 5 view .LVU306
	.loc 1 76 5 view .LVU307
	call	gettimeofday@PLT
.LVL92:
	.loc 1 77 5 view .LVU308
.LBB88:
	.loc 1 77 10 view .LVU309
	.loc 1 77 5 is_stmt 0 view .LVU310
	testl	%r13d, %r13d
	jle	.L46
	movl	%r13d, %edi
	cmpl	$8, %r13d
	jg	.L31
.LVL93:
	.loc 1 77 14 view .LVU311
	xorl	%eax, %eax
.LBE88:
	.loc 1 75 9 view .LVU312
	xorl	%edx, %edx
	jmp	.L34
.LVL94:
.L46:
	.loc 1 75 9 view .LVU313
	xorl	%r13d, %r13d
.LVL95:
	.loc 1 75 9 view .LVU314
	jmp	.L33
.LVL96:
.L48:
.LBB89:
	.loc 1 87 5 view .LVU315
	movl	$1, %r15d
	jmp	.L37
.LVL97:
.L59:
	.loc 1 87 5 view .LVU316
	vzeroupper
	jmp	.L33
.LVL98:
.L45:
	.loc 1 87 5 view .LVU317
.LBE89:
	.loc 1 68 9 view .LVU318
	movl	$10485760, %r12d
.LVL99:
	.loc 1 68 9 view .LVU319
	jmp	.L32
	.cfi_endproc
.LFE5182:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1062207488
	.align 8
.LC2:
	.long	0
	.long	1093567616
	.text
.Letext0:
	.file 5 "/usr/lib/gcc/x86_64-linux-gnu/8/include/stddef.h"
	.file 6 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 7 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.file 8 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 9 "/usr/include/stdio.h"
	.file 10 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h"
	.file 11 "/usr/include/x86_64-linux-gnu/bits/types/struct_timeval.h"
	.file 12 "/usr/include/time.h"
	.file 13 "/usr/include/x86_64-linux-gnu/sys/time.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xacb
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF94
	.byte	0xc
	.long	.LASF95
	.long	.LASF96
	.long	.Ldebug_ranges0+0x2f0
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF7
	.byte	0x5
	.byte	0xd8
	.byte	0x17
	.long	0x35
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF1
	.uleb128 0x4
	.byte	0x8
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF2
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF3
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x2
	.long	.LASF8
	.byte	0x6
	.byte	0x96
	.byte	0x19
	.long	0x68
	.uleb128 0x2
	.long	.LASF9
	.byte	0x6
	.byte	0x97
	.byte	0x1b
	.long	0x68
	.uleb128 0x2
	.long	.LASF10
	.byte	0x6
	.byte	0x9e
	.byte	0x1a
	.long	0x68
	.uleb128 0x2
	.long	.LASF11
	.byte	0x6
	.byte	0xa0
	.byte	0x1f
	.long	0x68
	.uleb128 0x6
	.byte	0x8
	.long	0xa5
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF12
	.uleb128 0x7
	.long	0xa5
	.uleb128 0x8
	.long	.LASF52
	.byte	0xd8
	.byte	0x7
	.byte	0x31
	.byte	0x8
	.long	0x238
	.uleb128 0x9
	.long	.LASF13
	.byte	0x7
	.byte	0x33
	.byte	0x7
	.long	0x61
	.byte	0
	.uleb128 0x9
	.long	.LASF14
	.byte	0x7
	.byte	0x36
	.byte	0x9
	.long	0x9f
	.byte	0x8
	.uleb128 0x9
	.long	.LASF15
	.byte	0x7
	.byte	0x37
	.byte	0x9
	.long	0x9f
	.byte	0x10
	.uleb128 0x9
	.long	.LASF16
	.byte	0x7
	.byte	0x38
	.byte	0x9
	.long	0x9f
	.byte	0x18
	.uleb128 0x9
	.long	.LASF17
	.byte	0x7
	.byte	0x39
	.byte	0x9
	.long	0x9f
	.byte	0x20
	.uleb128 0x9
	.long	.LASF18
	.byte	0x7
	.byte	0x3a
	.byte	0x9
	.long	0x9f
	.byte	0x28
	.uleb128 0x9
	.long	.LASF19
	.byte	0x7
	.byte	0x3b
	.byte	0x9
	.long	0x9f
	.byte	0x30
	.uleb128 0x9
	.long	.LASF20
	.byte	0x7
	.byte	0x3c
	.byte	0x9
	.long	0x9f
	.byte	0x38
	.uleb128 0x9
	.long	.LASF21
	.byte	0x7
	.byte	0x3d
	.byte	0x9
	.long	0x9f
	.byte	0x40
	.uleb128 0x9
	.long	.LASF22
	.byte	0x7
	.byte	0x40
	.byte	0x9
	.long	0x9f
	.byte	0x48
	.uleb128 0x9
	.long	.LASF23
	.byte	0x7
	.byte	0x41
	.byte	0x9
	.long	0x9f
	.byte	0x50
	.uleb128 0x9
	.long	.LASF24
	.byte	0x7
	.byte	0x42
	.byte	0x9
	.long	0x9f
	.byte	0x58
	.uleb128 0x9
	.long	.LASF25
	.byte	0x7
	.byte	0x44
	.byte	0x16
	.long	0x251
	.byte	0x60
	.uleb128 0x9
	.long	.LASF26
	.byte	0x7
	.byte	0x46
	.byte	0x14
	.long	0x257
	.byte	0x68
	.uleb128 0x9
	.long	.LASF27
	.byte	0x7
	.byte	0x48
	.byte	0x7
	.long	0x61
	.byte	0x70
	.uleb128 0x9
	.long	.LASF28
	.byte	0x7
	.byte	0x49
	.byte	0x7
	.long	0x61
	.byte	0x74
	.uleb128 0x9
	.long	.LASF29
	.byte	0x7
	.byte	0x4a
	.byte	0xb
	.long	0x6f
	.byte	0x78
	.uleb128 0x9
	.long	.LASF30
	.byte	0x7
	.byte	0x4d
	.byte	0x12
	.long	0x4c
	.byte	0x80
	.uleb128 0x9
	.long	.LASF31
	.byte	0x7
	.byte	0x4e
	.byte	0xf
	.long	0x53
	.byte	0x82
	.uleb128 0x9
	.long	.LASF32
	.byte	0x7
	.byte	0x4f
	.byte	0x8
	.long	0x25d
	.byte	0x83
	.uleb128 0x9
	.long	.LASF33
	.byte	0x7
	.byte	0x51
	.byte	0xf
	.long	0x26d
	.byte	0x88
	.uleb128 0x9
	.long	.LASF34
	.byte	0x7
	.byte	0x59
	.byte	0xd
	.long	0x7b
	.byte	0x90
	.uleb128 0x9
	.long	.LASF35
	.byte	0x7
	.byte	0x5b
	.byte	0x17
	.long	0x278
	.byte	0x98
	.uleb128 0x9
	.long	.LASF36
	.byte	0x7
	.byte	0x5c
	.byte	0x19
	.long	0x283
	.byte	0xa0
	.uleb128 0x9
	.long	.LASF37
	.byte	0x7
	.byte	0x5d
	.byte	0x14
	.long	0x257
	.byte	0xa8
	.uleb128 0x9
	.long	.LASF38
	.byte	0x7
	.byte	0x5e
	.byte	0x9
	.long	0x43
	.byte	0xb0
	.uleb128 0x9
	.long	.LASF39
	.byte	0x7
	.byte	0x5f
	.byte	0xa
	.long	0x29
	.byte	0xb8
	.uleb128 0x9
	.long	.LASF40
	.byte	0x7
	.byte	0x60
	.byte	0x7
	.long	0x61
	.byte	0xc0
	.uleb128 0x9
	.long	.LASF41
	.byte	0x7
	.byte	0x62
	.byte	0x8
	.long	0x289
	.byte	0xc4
	.byte	0
	.uleb128 0x2
	.long	.LASF42
	.byte	0x8
	.byte	0x7
	.byte	0x19
	.long	0xb1
	.uleb128 0xa
	.long	.LASF97
	.byte	0x7
	.byte	0x2b
	.byte	0xe
	.uleb128 0xb
	.long	.LASF43
	.uleb128 0x6
	.byte	0x8
	.long	0x24c
	.uleb128 0x6
	.byte	0x8
	.long	0xb1
	.uleb128 0xc
	.long	0xa5
	.long	0x26d
	.uleb128 0xd
	.long	0x35
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x244
	.uleb128 0xb
	.long	.LASF44
	.uleb128 0x6
	.byte	0x8
	.long	0x273
	.uleb128 0xb
	.long	.LASF45
	.uleb128 0x6
	.byte	0x8
	.long	0x27e
	.uleb128 0xc
	.long	0xa5
	.long	0x299
	.uleb128 0xd
	.long	0x35
	.byte	0x13
	.byte	0
	.uleb128 0xe
	.long	.LASF46
	.byte	0x9
	.byte	0x89
	.byte	0xe
	.long	0x2a5
	.uleb128 0x6
	.byte	0x8
	.long	0x238
	.uleb128 0xe
	.long	.LASF47
	.byte	0x9
	.byte	0x8a
	.byte	0xe
	.long	0x2a5
	.uleb128 0xe
	.long	.LASF48
	.byte	0x9
	.byte	0x8b
	.byte	0xe
	.long	0x2a5
	.uleb128 0xe
	.long	.LASF49
	.byte	0xa
	.byte	0x1a
	.byte	0xc
	.long	0x61
	.uleb128 0xc
	.long	0x2e5
	.long	0x2da
	.uleb128 0xf
	.byte	0
	.uleb128 0x7
	.long	0x2cf
	.uleb128 0x6
	.byte	0x8
	.long	0xac
	.uleb128 0x7
	.long	0x2df
	.uleb128 0xe
	.long	.LASF50
	.byte	0xa
	.byte	0x1b
	.byte	0x1a
	.long	0x2da
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF51
	.uleb128 0x8
	.long	.LASF53
	.byte	0x10
	.byte	0xb
	.byte	0x8
	.byte	0x8
	.long	0x325
	.uleb128 0x9
	.long	.LASF54
	.byte	0xb
	.byte	0xa
	.byte	0xc
	.long	0x87
	.byte	0
	.uleb128 0x9
	.long	.LASF55
	.byte	0xb
	.byte	0xb
	.byte	0x11
	.long	0x93
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF56
	.uleb128 0xc
	.long	0x9f
	.long	0x33c
	.uleb128 0xd
	.long	0x35
	.byte	0x1
	.byte	0
	.uleb128 0xe
	.long	.LASF57
	.byte	0xc
	.byte	0x9f
	.byte	0xe
	.long	0x32c
	.uleb128 0xe
	.long	.LASF58
	.byte	0xc
	.byte	0xa0
	.byte	0xc
	.long	0x61
	.uleb128 0xe
	.long	.LASF59
	.byte	0xc
	.byte	0xa1
	.byte	0x11
	.long	0x68
	.uleb128 0xe
	.long	.LASF60
	.byte	0xc
	.byte	0xa6
	.byte	0xe
	.long	0x32c
	.uleb128 0xe
	.long	.LASF61
	.byte	0xc
	.byte	0xae
	.byte	0xc
	.long	0x61
	.uleb128 0xe
	.long	.LASF62
	.byte	0xc
	.byte	0xaf
	.byte	0x11
	.long	0x68
	.uleb128 0x8
	.long	.LASF62
	.byte	0x8
	.byte	0xd
	.byte	0x34
	.byte	0x8
	.long	0x3ac
	.uleb128 0x9
	.long	.LASF63
	.byte	0xd
	.byte	0x36
	.byte	0x9
	.long	0x61
	.byte	0
	.uleb128 0x9
	.long	.LASF64
	.byte	0xd
	.byte	0x37
	.byte	0x9
	.long	0x61
	.byte	0x4
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x384
	.uleb128 0x10
	.long	0x3ac
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.long	.LASF65
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.long	.LASF66
	.uleb128 0x2
	.long	.LASF67
	.byte	0x2
	.byte	0x31
	.byte	0xe
	.long	0x3d1
	.uleb128 0x11
	.long	0xa5
	.long	0x3dd
	.uleb128 0x12
	.byte	0x1f
	.byte	0
	.uleb128 0x2
	.long	.LASF68
	.byte	0x2
	.byte	0x38
	.byte	0x13
	.long	0x3e9
	.uleb128 0x11
	.long	0x2f6
	.long	0x3f5
	.uleb128 0x12
	.byte	0x3
	.byte	0
	.uleb128 0x13
	.long	.LASF98
	.byte	0x2
	.byte	0x41
	.byte	0x13
	.long	0x3e9
	.byte	0x1
	.uleb128 0x7
	.long	0x3f5
	.uleb128 0x3
	.byte	0x10
	.byte	0x4
	.long	.LASF69
	.uleb128 0x14
	.long	.LASF77
	.byte	0x1
	.byte	0x3f
	.byte	0x5
	.long	0x61
	.quad	.LFB5182
	.quad	.LFE5182-.LFB5182
	.uleb128 0x1
	.byte	0x9c
	.long	0x7d3
	.uleb128 0x15
	.long	.LASF70
	.byte	0x1
	.byte	0x3f
	.byte	0xe
	.long	0x61
	.long	.LLST10
	.long	.LVUS10
	.uleb128 0x15
	.long	.LASF71
	.byte	0x1
	.byte	0x3f
	.byte	0x1a
	.long	0x7d3
	.long	.LLST11
	.long	.LVUS11
	.uleb128 0x16
	.long	.LASF72
	.byte	0x1
	.byte	0x40
	.byte	0x9
	.long	0x61
	.long	.LLST12
	.long	.LVUS12
	.uleb128 0x17
	.string	"len"
	.byte	0x1
	.byte	0x44
	.byte	0x9
	.long	0x61
	.long	.LLST13
	.long	.LVUS13
	.uleb128 0x17
	.string	"str"
	.byte	0x1
	.byte	0x48
	.byte	0xb
	.long	0x9f
	.long	.LLST14
	.long	.LVUS14
	.uleb128 0x18
	.long	.LASF73
	.byte	0x1
	.byte	0x49
	.byte	0x14
	.long	0x2fd
	.uleb128 0x3
	.byte	0x76
	.sleb128 -80
	.uleb128 0x19
	.string	"end"
	.byte	0x1
	.byte	0x49
	.byte	0x1b
	.long	0x2fd
	.uleb128 0x2
	.byte	0x76
	.sleb128 -64
	.uleb128 0x17
	.string	"ret"
	.byte	0x1
	.byte	0x4a
	.byte	0xa
	.long	0x7d9
	.long	.LLST15
	.long	.LVUS15
	.uleb128 0x16
	.long	.LASF74
	.byte	0x1
	.byte	0x4b
	.byte	0x9
	.long	0x61
	.long	.LLST16
	.long	.LVUS16
	.uleb128 0x16
	.long	.LASF75
	.byte	0x1
	.byte	0x52
	.byte	0x9
	.long	0x61
	.long	.LLST17
	.long	.LVUS17
	.uleb128 0x1a
	.long	.Ldebug_ranges0+0xe0
	.long	0x50b
	.uleb128 0x17
	.string	"i"
	.byte	0x1
	.byte	0x4d
	.byte	0xe
	.long	0x61
	.long	.LLST18
	.long	.LVUS18
	.byte	0
	.uleb128 0x1a
	.long	.Ldebug_ranges0+0x1b0
	.long	0x5f1
	.uleb128 0x17
	.string	"i"
	.byte	0x1
	.byte	0x57
	.byte	0xe
	.long	0x61
	.long	.LLST19
	.long	.LVUS19
	.uleb128 0x1b
	.long	0x8d8
	.quad	.LBI60
	.byte	.LVU210
	.long	.Ldebug_ranges0+0x1f0
	.byte	0x1
	.byte	0x58
	.byte	0xf
	.uleb128 0x1c
	.long	0x8f5
	.long	.LLST20
	.long	.LVUS20
	.uleb128 0x1c
	.long	0x8e9
	.long	.LLST21
	.long	.LVUS21
	.uleb128 0x1d
	.long	.Ldebug_ranges0+0x1f0
	.uleb128 0x1e
	.long	0x901
	.long	.LLST22
	.long	.LVUS22
	.uleb128 0x1e
	.long	0x90b
	.long	.LLST23
	.long	.LVUS23
	.uleb128 0x1f
	.long	0x9e1
	.quad	.LBB62
	.quad	.LBE62-.LBB62
	.uleb128 0x1e
	.long	0x918
	.long	.LLST24
	.long	.LVUS24
	.uleb128 0x1e
	.long	0x924
	.long	.LLST25
	.long	.LVUS25
	.uleb128 0x20
	.long	0x952
	.quad	.LBI63
	.byte	.LVU216
	.long	.Ldebug_ranges0+0x220
	.byte	0x1
	.byte	0x12
	.byte	0x18
	.long	0x5ca
	.uleb128 0x1c
	.long	0x964
	.long	.LLST26
	.long	.LVUS26
	.byte	0
	.uleb128 0x1b
	.long	0x932
	.quad	.LBI68
	.byte	.LVU220
	.long	.Ldebug_ranges0+0x270
	.byte	0x1
	.byte	0x13
	.byte	0x14
	.uleb128 0x1c
	.long	0x944
	.long	.LLST27
	.long	.LVUS27
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x20
	.long	0x978
	.quad	.LBI82
	.byte	.LVU282
	.long	.Ldebug_ranges0+0x2c0
	.byte	0x1
	.byte	0x42
	.byte	0x15
	.long	0x630
	.uleb128 0x1c
	.long	0x98a
	.long	.LLST28
	.long	.LVUS28
	.uleb128 0x21
	.quad	.LVL85
	.long	0xa76
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x3a
	.byte	0
	.byte	0
	.uleb128 0x23
	.long	0x978
	.quad	.LBI86
	.byte	.LVU293
	.quad	.LBB86
	.quad	.LBE86-.LBB86
	.byte	0x1
	.byte	0x46
	.byte	0xf
	.long	0x67b
	.uleb128 0x1c
	.long	0x98a
	.long	.LLST29
	.long	.LVUS29
	.uleb128 0x21
	.quad	.LVL88
	.long	0xa76
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x3a
	.byte	0
	.byte	0
	.uleb128 0x24
	.quad	.LVL28
	.long	0x816
	.long	0x693
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x24
	.quad	.LVL30
	.long	0xa82
	.long	0x6b0
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7f
	.sleb128 0
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x24
	.quad	.LVL55
	.long	0xa82
	.long	0x6cf
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x76
	.sleb128 -104
	.byte	0x6
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x24
	.quad	.LVL57
	.long	0xa8e
	.long	0x6fc
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC0
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x5
	.byte	0x76
	.sleb128 -92
	.byte	0x94
	.byte	0x4
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x24
	.quad	.LVL58
	.long	0xa8e
	.long	0x71b
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC3
	.byte	0
	.uleb128 0x24
	.quad	.LVL59
	.long	0xa82
	.long	0x738
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7f
	.sleb128 0
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x24
	.quad	.LVL73
	.long	0xa82
	.long	0x757
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x76
	.sleb128 -104
	.byte	0x6
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x24
	.quad	.LVL76
	.long	0xa8e
	.long	0x782
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC4
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x7f
	.sleb128 0
	.byte	0
	.uleb128 0x24
	.quad	.LVL77
	.long	0xa8e
	.long	0x7a1
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC5
	.byte	0
	.uleb128 0x24
	.quad	.LVL90
	.long	0x816
	.long	0x7b9
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x21
	.quad	.LVL92
	.long	0xa82
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7f
	.sleb128 0
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x9f
	.uleb128 0x3
	.byte	0x1
	.byte	0x2
	.long	.LASF76
	.uleb128 0x25
	.long	.LASF79
	.byte	0x1
	.byte	0x36
	.byte	0x6
	.long	0x7d9
	.byte	0x1
	.long	0x816
	.uleb128 0x26
	.string	"str"
	.byte	0x1
	.byte	0x36
	.byte	0x1b
	.long	0x2df
	.uleb128 0x26
	.string	"len"
	.byte	0x1
	.byte	0x36
	.byte	0x24
	.long	0x61
	.uleb128 0x27
	.uleb128 0x28
	.string	"i"
	.byte	0x1
	.byte	0x37
	.byte	0xe
	.long	0x61
	.byte	0
	.byte	0
	.uleb128 0x14
	.long	.LASF78
	.byte	0x1
	.byte	0x25
	.byte	0x7
	.long	0x9f
	.quad	.LFB5180
	.quad	.LFE5180-.LFB5180
	.uleb128 0x1
	.byte	0x9c
	.long	0x8d8
	.uleb128 0x29
	.string	"len"
	.byte	0x1
	.byte	0x25
	.byte	0x1d
	.long	0x61
	.long	.LLST7
	.long	.LVUS7
	.uleb128 0x17
	.string	"str"
	.byte	0x1
	.byte	0x28
	.byte	0xb
	.long	0x9f
	.long	.LLST8
	.long	.LVUS8
	.uleb128 0x2a
	.quad	.LBB47
	.quad	.LBE47-.LBB47
	.long	0x895
	.uleb128 0x17
	.string	"i"
	.byte	0x1
	.byte	0x2e
	.byte	0xe
	.long	0x61
	.long	.LLST9
	.long	.LVUS9
	.uleb128 0x2b
	.quad	.LVL19
	.long	0xa9b
	.byte	0
	.uleb128 0x24
	.quad	.LVL14
	.long	0xaa8
	.long	0x8b3
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x8
	.byte	0x73
	.sleb128 1
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0
	.uleb128 0x24
	.quad	.LVL16
	.long	0xab5
	.long	0x8ca
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x2b
	.quad	.LVL17
	.long	0xac1
	.byte	0
	.uleb128 0x25
	.long	.LASF80
	.byte	0x1
	.byte	0xc
	.byte	0x6
	.long	0x7d9
	.byte	0x1
	.long	0x932
	.uleb128 0x26
	.string	"str"
	.byte	0x1
	.byte	0xc
	.byte	0x22
	.long	0x2df
	.uleb128 0x26
	.string	"len"
	.byte	0x1
	.byte	0xc
	.byte	0x2b
	.long	0x61
	.uleb128 0x28
	.string	"p"
	.byte	0x1
	.byte	0xd
	.byte	0x11
	.long	0x2df
	.uleb128 0x28
	.string	"end"
	.byte	0x1
	.byte	0xe
	.byte	0x11
	.long	0x2df
	.uleb128 0x27
	.uleb128 0x2c
	.long	.LASF81
	.byte	0x1
	.byte	0x12
	.byte	0x11
	.long	0x3dd
	.uleb128 0x2c
	.long	.LASF82
	.byte	0x1
	.byte	0x13
	.byte	0xd
	.long	0x61
	.byte	0
	.byte	0
	.uleb128 0x2d
	.long	.LASF83
	.byte	0x3
	.value	0x1b1
	.byte	0x1
	.long	0x61
	.byte	0x3
	.long	0x952
	.uleb128 0x2e
	.string	"__A"
	.byte	0x3
	.value	0x1b1
	.byte	0x1f
	.long	0x3dd
	.byte	0
	.uleb128 0x2d
	.long	.LASF84
	.byte	0x2
	.value	0x397
	.byte	0x1
	.long	0x3dd
	.byte	0x3
	.long	0x972
	.uleb128 0x2e
	.string	"__P"
	.byte	0x2
	.value	0x397
	.byte	0x26
	.long	0x972
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x402
	.uleb128 0x2f
	.long	.LASF85
	.byte	0x4
	.value	0x169
	.byte	0x1
	.long	0x61
	.byte	0x3
	.long	0x998
	.uleb128 0x30
	.long	.LASF86
	.byte	0x4
	.value	0x169
	.byte	0x1
	.long	0x2df
	.byte	0
	.uleb128 0x31
	.long	0x8d8
	.quad	.LFB5179
	.quad	.LFE5179-.LFB5179
	.uleb128 0x1
	.byte	0x9c
	.long	0xa4c
	.uleb128 0x1c
	.long	0x8e9
	.long	.LLST0
	.long	.LVUS0
	.uleb128 0x32
	.long	0x8f5
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1e
	.long	0x901
	.long	.LLST1
	.long	.LVUS1
	.uleb128 0x1e
	.long	0x90b
	.long	.LLST2
	.long	.LVUS2
	.uleb128 0x1d
	.long	.Ldebug_ranges0+0
	.uleb128 0x1e
	.long	0x918
	.long	.LLST3
	.long	.LVUS3
	.uleb128 0x1e
	.long	0x924
	.long	.LLST4
	.long	.LVUS4
	.uleb128 0x20
	.long	0x952
	.quad	.LBI29
	.byte	.LVU8
	.long	.Ldebug_ranges0+0x40
	.byte	0x1
	.byte	0x12
	.byte	0x18
	.long	0xa27
	.uleb128 0x1c
	.long	0x964
	.long	.LLST5
	.long	.LVUS5
	.byte	0
	.uleb128 0x1b
	.long	0x932
	.quad	.LBI34
	.byte	.LVU12
	.long	.Ldebug_ranges0+0x90
	.byte	0x1
	.byte	0x13
	.byte	0x14
	.uleb128 0x1c
	.long	0x944
	.long	.LLST6
	.long	.LVUS6
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x31
	.long	0x7e0
	.quad	.LFB5181
	.quad	.LFE5181-.LFB5181
	.uleb128 0x1
	.byte	0x9c
	.long	0xa76
	.uleb128 0x32
	.long	0x7f1
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x32
	.long	0x7fd
	.uleb128 0x1
	.byte	0x54
	.byte	0
	.uleb128 0x33
	.long	.LASF87
	.long	.LASF87
	.byte	0x4
	.byte	0xb0
	.byte	0x11
	.uleb128 0x33
	.long	.LASF88
	.long	.LASF88
	.byte	0xd
	.byte	0x44
	.byte	0xc
	.uleb128 0x34
	.long	.LASF89
	.long	.LASF89
	.byte	0x9
	.value	0x14c
	.byte	0xc
	.uleb128 0x34
	.long	.LASF90
	.long	.LASF90
	.byte	0x4
	.value	0x1c5
	.byte	0xc
	.uleb128 0x34
	.long	.LASF91
	.long	.LASF91
	.byte	0x4
	.value	0x21b
	.byte	0xe
	.uleb128 0x33
	.long	.LASF92
	.long	.LASF92
	.byte	0xc
	.byte	0x4b
	.byte	0xf
	.uleb128 0x34
	.long	.LASF93
	.long	.LASF93
	.byte	0x4
	.value	0x1c7
	.byte	0xd
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0x9
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
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0xf
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x12
	.uleb128 0x21
	.byte	0
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.uleb128 0x1a
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x1d
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
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
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x23
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
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
	.uleb128 0xb
	.byte	0x1
	.byte	0
	.byte	0
	.uleb128 0x28
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
	.uleb128 0x29
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
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2c
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
	.byte	0
	.byte	0
	.uleb128 0x2d
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
	.uleb128 0x2e
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
	.uleb128 0x2f
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x30
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
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
	.uleb128 0x31
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
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
	.uleb128 0x32
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x33
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
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x34
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
.LVUS10:
	.uleb128 0
	.uleb128 .LVU88
	.uleb128 .LVU88
	.uleb128 .LVU278
	.uleb128 .LVU278
	.uleb128 .LVU280
	.uleb128 .LVU280
	.uleb128 .LVU304
	.uleb128 .LVU304
	.uleb128 .LVU317
	.uleb128 .LVU317
	.uleb128 0
.LLST10:
	.quad	.LVL25
	.quad	.LVL27
	.value	0x1
	.byte	0x55
	.quad	.LVL27
	.quad	.LVL81
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL81
	.quad	.LVL82
	.value	0x1
	.byte	0x55
	.quad	.LVL82
	.quad	.LVL91
	.value	0x1
	.byte	0x53
	.quad	.LVL91
	.quad	.LVL98
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL98
	.quad	.LFE5182
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LVUS11:
	.uleb128 0
	.uleb128 .LVU92
	.uleb128 .LVU92
	.uleb128 .LVU278
	.uleb128 .LVU278
	.uleb128 .LVU285
	.uleb128 .LVU285
	.uleb128 .LVU297
	.uleb128 .LVU297
	.uleb128 .LVU317
	.uleb128 .LVU317
	.uleb128 .LVU319
	.uleb128 .LVU319
	.uleb128 0
.LLST11:
	.quad	.LVL25
	.quad	.LVL28-1
	.value	0x1
	.byte	0x54
	.quad	.LVL28-1
	.quad	.LVL81
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL81
	.quad	.LVL84
	.value	0x1
	.byte	0x54
	.quad	.LVL84
	.quad	.LVL89
	.value	0x1
	.byte	0x5c
	.quad	.LVL89
	.quad	.LVL98
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL98
	.quad	.LVL99
	.value	0x1
	.byte	0x5c
	.quad	.LVL99
	.quad	.LFE5182
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS12:
	.uleb128 .LVU83
	.uleb128 .LVU102
	.uleb128 .LVU278
	.uleb128 .LVU288
	.uleb128 .LVU288
	.uleb128 .LVU311
	.uleb128 .LVU311
	.uleb128 .LVU313
	.uleb128 .LVU313
	.uleb128 .LVU314
	.uleb128 .LVU317
	.uleb128 0
.LLST12:
	.quad	.LVL25
	.quad	.LVL31
	.value	0x6
	.byte	0xc
	.long	0xf4240
	.byte	0x9f
	.quad	.LVL81
	.quad	.LVL86
	.value	0x6
	.byte	0xc
	.long	0xf4240
	.byte	0x9f
	.quad	.LVL86
	.quad	.LVL93
	.value	0x1
	.byte	0x5d
	.quad	.LVL93
	.quad	.LVL94
	.value	0x1
	.byte	0x55
	.quad	.LVL94
	.quad	.LVL95
	.value	0x1
	.byte	0x5d
	.quad	.LVL98
	.quad	.LFE5182
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LVUS13:
	.uleb128 .LVU86
	.uleb128 .LVU102
	.uleb128 .LVU290
	.uleb128 .LVU297
	.uleb128 .LVU297
	.uleb128 .LVU315
	.uleb128 .LVU317
	.uleb128 0
.LLST13:
	.quad	.LVL26
	.quad	.LVL31
	.value	0x4
	.byte	0x44
	.byte	0x43
	.byte	0x24
	.byte	0x9f
	.quad	.LVL86
	.quad	.LVL89
	.value	0x4
	.byte	0x44
	.byte	0x43
	.byte	0x24
	.byte	0x9f
	.quad	.LVL89
	.quad	.LVL96
	.value	0x1
	.byte	0x5c
	.quad	.LVL98
	.quad	.LFE5182
	.value	0x4
	.byte	0x44
	.byte	0x43
	.byte	0x24
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS14:
	.uleb128 .LVU94
	.uleb128 .LVU98
	.uleb128 .LVU98
	.uleb128 .LVU260
	.uleb128 .LVU276
	.uleb128 .LVU278
	.uleb128 .LVU304
	.uleb128 .LVU308
	.uleb128 .LVU308
	.uleb128 .LVU317
.LLST14:
	.quad	.LVL29
	.quad	.LVL30-1
	.value	0x1
	.byte	0x50
	.quad	.LVL30-1
	.quad	.LVL74
	.value	0x1
	.byte	0x53
	.quad	.LVL79
	.quad	.LVL81
	.value	0x1
	.byte	0x53
	.quad	.LVL91
	.quad	.LVL92-1
	.value	0x1
	.byte	0x50
	.quad	.LVL92-1
	.quad	.LVL98
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LVUS15:
	.uleb128 .LVU100
	.uleb128 .LVU252
	.uleb128 .LVU276
	.uleb128 .LVU278
	.uleb128 .LVU310
	.uleb128 .LVU317
.LLST15:
	.quad	.LVL30
	.quad	.LVL70
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL79
	.quad	.LVL81
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL92
	.quad	.LVL98
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS16:
	.uleb128 .LVU97
	.uleb128 .LVU104
	.uleb128 .LVU113
	.uleb128 .LVU120
	.uleb128 .LVU120
	.uleb128 .LVU183
	.uleb128 .LVU207
	.uleb128 .LVU209
	.uleb128 .LVU307
	.uleb128 .LVU315
	.uleb128 .LVU315
	.uleb128 .LVU316
.LLST16:
	.quad	.LVL29
	.quad	.LVL32
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL33
	.quad	.LVL34
	.value	0x1
	.byte	0x51
	.quad	.LVL34
	.quad	.LVL54
	.value	0x1
	.byte	0x5d
	.quad	.LVL59
	.quad	.LVL60
	.value	0x1
	.byte	0x5d
	.quad	.LVL91
	.quad	.LVL96
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL96
	.quad	.LVL97
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LVUS17:
	.uleb128 .LVU191
	.uleb128 .LVU192
	.uleb128 .LVU192
	.uleb128 .LVU265
	.uleb128 .LVU265
	.uleb128 .LVU275
	.uleb128 .LVU276
	.uleb128 .LVU278
	.uleb128 .LVU315
	.uleb128 .LVU316
.LLST17:
	.quad	.LVL56
	.quad	.LVL57-1
	.value	0x1
	.byte	0x52
	.quad	.LVL57-1
	.quad	.LVL75
	.value	0x3
	.byte	0x76
	.sleb128 -92
	.quad	.LVL75
	.quad	.LVL78
	.value	0x1
	.byte	0x53
	.quad	.LVL79
	.quad	.LVL81
	.value	0x3
	.byte	0x76
	.sleb128 -92
	.quad	.LVL96
	.quad	.LVL97
	.value	0x3
	.byte	0x76
	.sleb128 -92
	.quad	0
	.quad	0
.LVUS18:
	.uleb128 .LVU100
	.uleb128 .LVU104
	.uleb128 .LVU113
	.uleb128 .LVU120
	.uleb128 .LVU120
	.uleb128 .LVU121
	.uleb128 .LVU121
	.uleb128 .LVU129
	.uleb128 .LVU129
	.uleb128 .LVU130
	.uleb128 .LVU130
	.uleb128 .LVU138
	.uleb128 .LVU138
	.uleb128 .LVU139
	.uleb128 .LVU139
	.uleb128 .LVU147
	.uleb128 .LVU147
	.uleb128 .LVU148
	.uleb128 .LVU148
	.uleb128 .LVU156
	.uleb128 .LVU156
	.uleb128 .LVU157
	.uleb128 .LVU157
	.uleb128 .LVU165
	.uleb128 .LVU165
	.uleb128 .LVU166
	.uleb128 .LVU166
	.uleb128 .LVU175
	.uleb128 .LVU310
	.uleb128 .LVU315
.LLST18:
	.quad	.LVL30
	.quad	.LVL32
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL33
	.quad	.LVL34
	.value	0x1
	.byte	0x50
	.quad	.LVL34
	.quad	.LVL35
	.value	0x3
	.byte	0x70
	.sleb128 1
	.byte	0x9f
	.quad	.LVL35
	.quad	.LVL37
	.value	0x1
	.byte	0x51
	.quad	.LVL37
	.quad	.LVL38
	.value	0x3
	.byte	0x70
	.sleb128 1
	.byte	0x9f
	.quad	.LVL38
	.quad	.LVL40
	.value	0x1
	.byte	0x51
	.quad	.LVL40
	.quad	.LVL41
	.value	0x3
	.byte	0x70
	.sleb128 2
	.byte	0x9f
	.quad	.LVL41
	.quad	.LVL43
	.value	0x1
	.byte	0x51
	.quad	.LVL43
	.quad	.LVL44
	.value	0x3
	.byte	0x70
	.sleb128 3
	.byte	0x9f
	.quad	.LVL44
	.quad	.LVL46
	.value	0x1
	.byte	0x51
	.quad	.LVL46
	.quad	.LVL47
	.value	0x3
	.byte	0x70
	.sleb128 4
	.byte	0x9f
	.quad	.LVL47
	.quad	.LVL49
	.value	0x1
	.byte	0x51
	.quad	.LVL49
	.quad	.LVL50
	.value	0x3
	.byte	0x70
	.sleb128 5
	.byte	0x9f
	.quad	.LVL50
	.quad	.LVL52
	.value	0x1
	.byte	0x51
	.quad	.LVL92
	.quad	.LVL96
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS19:
	.uleb128 .LVU207
	.uleb128 .LVU209
	.uleb128 .LVU209
	.uleb128 .LVU256
	.uleb128 .LVU276
	.uleb128 .LVU278
	.uleb128 .LVU315
	.uleb128 .LVU316
.LLST19:
	.quad	.LVL59
	.quad	.LVL60
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL60
	.quad	.LVL72
	.value	0x1
	.byte	0x50
	.quad	.LVL79
	.quad	.LVL81
	.value	0x1
	.byte	0x50
	.quad	.LVL96
	.quad	.LVL97
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS20:
	.uleb128 .LVU210
	.uleb128 .LVU252
	.uleb128 .LVU276
	.uleb128 .LVU278
.LLST20:
	.quad	.LVL60
	.quad	.LVL70
	.value	0x1
	.byte	0x5c
	.quad	.LVL79
	.quad	.LVL81
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LVUS21:
	.uleb128 .LVU210
	.uleb128 .LVU252
	.uleb128 .LVU276
	.uleb128 .LVU278
.LLST21:
	.quad	.LVL60
	.quad	.LVL70
	.value	0x1
	.byte	0x53
	.quad	.LVL79
	.quad	.LVL81
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LVUS22:
	.uleb128 .LVU212
	.uleb128 .LVU227
	.uleb128 .LVU227
	.uleb128 .LVU251
	.uleb128 .LVU276
	.uleb128 .LVU277
	.uleb128 .LVU277
	.uleb128 .LVU278
.LLST22:
	.quad	.LVL60
	.quad	.LVL63
	.value	0x1
	.byte	0x53
	.quad	.LVL63
	.quad	.LVL69
	.value	0x1
	.byte	0x52
	.quad	.LVL79
	.quad	.LVL80
	.value	0x1
	.byte	0x52
	.quad	.LVL80
	.quad	.LVL81
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LVUS23:
	.uleb128 .LVU213
	.uleb128 .LVU252
	.uleb128 .LVU276
	.uleb128 .LVU278
.LLST23:
	.quad	.LVL60
	.quad	.LVL70
	.value	0xc
	.byte	0x7c
	.sleb128 0
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.quad	.LVL79
	.quad	.LVL81
	.value	0xc
	.byte	0x7c
	.sleb128 0
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS24:
	.uleb128 .LVU218
	.uleb128 .LVU230
	.uleb128 .LVU230
	.uleb128 .LVU239
	.uleb128 .LVU239
	.uleb128 .LVU244
.LLST24:
	.quad	.LVL61
	.quad	.LVL63
	.value	0x2
	.byte	0x73
	.sleb128 0
	.quad	.LVL63
	.quad	.LVL65
	.value	0x2
	.byte	0x72
	.sleb128 0
	.quad	.LVL65
	.quad	.LVL67
	.value	0x2
	.byte	0x73
	.sleb128 0
	.quad	0
	.quad	0
.LVUS25:
	.uleb128 .LVU224
	.uleb128 .LVU227
	.uleb128 .LVU227
	.uleb128 .LVU236
	.uleb128 .LVU236
	.uleb128 .LVU239
	.uleb128 .LVU239
	.uleb128 .LVU244
.LLST25:
	.quad	.LVL62
	.quad	.LVL63
	.value	0x1
	.byte	0x5f
	.quad	.LVL63
	.quad	.LVL64
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL64
	.quad	.LVL65
	.value	0x1
	.byte	0x54
	.quad	.LVL65
	.quad	.LVL67
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS26:
	.uleb128 .LVU216
	.uleb128 .LVU218
	.uleb128 .LVU228
	.uleb128 .LVU230
.LLST26:
	.quad	.LVL61
	.quad	.LVL61
	.value	0x1
	.byte	0x53
	.quad	.LVL63
	.quad	.LVL63
	.value	0x1
	.byte	0x52
	.quad	0
	.quad	0
.LVUS27:
	.uleb128 .LVU220
	.uleb128 .LVU224
	.uleb128 .LVU232
	.uleb128 .LVU236
.LLST27:
	.quad	.LVL61
	.quad	.LVL62
	.value	0x2
	.byte	0x73
	.sleb128 0
	.quad	.LVL63
	.quad	.LVL64
	.value	0x2
	.byte	0x72
	.sleb128 0
	.quad	0
	.quad	0
.LVUS28:
	.uleb128 .LVU282
	.uleb128 .LVU286
.LLST28:
	.quad	.LVL83
	.quad	.LVL85-1
	.value	0x1
	.byte	0x55
	.quad	0
	.quad	0
.LVUS29:
	.uleb128 .LVU293
	.uleb128 .LVU296
.LLST29:
	.quad	.LVL87
	.quad	.LVL88-1
	.value	0x2
	.byte	0x7c
	.sleb128 16
	.quad	0
	.quad	0
.LVUS7:
	.uleb128 0
	.uleb128 .LVU53
	.uleb128 .LVU53
	.uleb128 .LVU71
	.uleb128 .LVU71
	.uleb128 0
.LLST7:
	.quad	.LVL12
	.quad	.LVL13
	.value	0x1
	.byte	0x55
	.quad	.LVL13
	.quad	.LVL21
	.value	0x1
	.byte	0x53
	.quad	.LVL21
	.quad	.LFE5180
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS8:
	.uleb128 .LVU54
	.uleb128 .LVU58
	.uleb128 .LVU58
	.uleb128 .LVU72
	.uleb128 .LVU72
	.uleb128 .LVU73
.LLST8:
	.quad	.LVL15
	.quad	.LVL16-1
	.value	0x1
	.byte	0x50
	.quad	.LVL16-1
	.quad	.LVL22
	.value	0x1
	.byte	0x5c
	.quad	.LVL22
	.quad	.LVL23
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LVUS9:
	.uleb128 .LVU61
	.uleb128 .LVU62
	.uleb128 .LVU62
	.uleb128 .LVU64
.LLST9:
	.quad	.LVL17
	.quad	.LVL18
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL18
	.quad	.LVL20
	.value	0x6
	.byte	0x7d
	.sleb128 0
	.byte	0x7c
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS0:
	.uleb128 0
	.uleb128 .LVU19
	.uleb128 .LVU19
	.uleb128 0
.LLST0:
	.quad	.LVL0
	.quad	.LVL4
	.value	0x1
	.byte	0x55
	.quad	.LVL4
	.quad	.LFE5179
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS1:
	.uleb128 .LVU2
	.uleb128 0
.LLST1:
	.quad	.LVL0
	.quad	.LFE5179
	.value	0x1
	.byte	0x55
	.quad	0
	.quad	0
.LVUS2:
	.uleb128 .LVU5
	.uleb128 0
.LLST2:
	.quad	.LVL1
	.quad	.LFE5179
	.value	0x1
	.byte	0x51
	.quad	0
	.quad	0
.LVUS3:
	.uleb128 .LVU10
	.uleb128 .LVU19
	.uleb128 .LVU19
	.uleb128 .LVU22
	.uleb128 .LVU22
	.uleb128 .LVU31
	.uleb128 .LVU31
	.uleb128 .LVU36
.LLST3:
	.quad	.LVL2
	.quad	.LVL4
	.value	0x2
	.byte	0x75
	.sleb128 0
	.quad	.LVL4
	.quad	.LVL4
	.value	0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.quad	.LVL4
	.quad	.LVL6
	.value	0x2
	.byte	0x75
	.sleb128 0
	.quad	.LVL6
	.quad	.LVL8
	.value	0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.quad	0
	.quad	0
.LVUS4:
	.uleb128 .LVU16
	.uleb128 .LVU19
	.uleb128 .LVU19
	.uleb128 .LVU28
	.uleb128 .LVU28
	.uleb128 .LVU31
	.uleb128 .LVU31
	.uleb128 .LVU36
	.uleb128 .LVU45
	.uleb128 .LVU46
.LLST4:
	.quad	.LVL3
	.quad	.LVL4
	.value	0x1
	.byte	0x50
	.quad	.LVL4
	.quad	.LVL5
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL5
	.quad	.LVL6
	.value	0x1
	.byte	0x50
	.quad	.LVL6
	.quad	.LVL8
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL10
	.quad	.LVL11
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LVUS5:
	.uleb128 .LVU8
	.uleb128 .LVU10
	.uleb128 .LVU20
	.uleb128 .LVU22
.LLST5:
	.quad	.LVL2
	.quad	.LVL2
	.value	0x1
	.byte	0x55
	.quad	.LVL4
	.quad	.LVL4
	.value	0x1
	.byte	0x55
	.quad	0
	.quad	0
.LVUS6:
	.uleb128 .LVU12
	.uleb128 .LVU16
	.uleb128 .LVU24
	.uleb128 .LVU28
.LLST6:
	.quad	.LVL2
	.quad	.LVL3
	.value	0x2
	.byte	0x75
	.sleb128 0
	.quad	.LVL4
	.quad	.LVL5
	.value	0x2
	.byte	0x75
	.sleb128 0
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
	.quad	.LFB5182
	.quad	.LFE5182-.LFB5182
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LBB28
	.quad	.LBE28
	.quad	.LBB45
	.quad	.LBE45
	.quad	.LBB46
	.quad	.LBE46
	.quad	0
	.quad	0
	.quad	.LBB29
	.quad	.LBE29
	.quad	.LBB39
	.quad	.LBE39
	.quad	.LBB41
	.quad	.LBE41
	.quad	.LBB43
	.quad	.LBE43
	.quad	0
	.quad	0
	.quad	.LBB34
	.quad	.LBE34
	.quad	.LBB40
	.quad	.LBE40
	.quad	.LBB42
	.quad	.LBE42
	.quad	.LBB44
	.quad	.LBE44
	.quad	0
	.quad	0
	.quad	.LBB48
	.quad	.LBE48
	.quad	.LBB49
	.quad	.LBE49
	.quad	.LBB50
	.quad	.LBE50
	.quad	.LBB51
	.quad	.LBE51
	.quad	.LBB52
	.quad	.LBE52
	.quad	.LBB53
	.quad	.LBE53
	.quad	.LBB54
	.quad	.LBE54
	.quad	.LBB55
	.quad	.LBE55
	.quad	.LBB56
	.quad	.LBE56
	.quad	.LBB57
	.quad	.LBE57
	.quad	.LBB58
	.quad	.LBE58
	.quad	.LBB88
	.quad	.LBE88
	.quad	0
	.quad	0
	.quad	.LBB59
	.quad	.LBE59
	.quad	.LBB81
	.quad	.LBE81
	.quad	.LBB89
	.quad	.LBE89
	.quad	0
	.quad	0
	.quad	.LBB60
	.quad	.LBE60
	.quad	.LBB80
	.quad	.LBE80
	.quad	0
	.quad	0
	.quad	.LBB63
	.quad	.LBE63
	.quad	.LBB73
	.quad	.LBE73
	.quad	.LBB75
	.quad	.LBE75
	.quad	.LBB77
	.quad	.LBE77
	.quad	0
	.quad	0
	.quad	.LBB68
	.quad	.LBE68
	.quad	.LBB74
	.quad	.LBE74
	.quad	.LBB76
	.quad	.LBE76
	.quad	.LBB78
	.quad	.LBE78
	.quad	0
	.quad	0
	.quad	.LBB82
	.quad	.LBE82
	.quad	.LBB85
	.quad	.LBE85
	.quad	0
	.quad	0
	.quad	.Ltext0
	.quad	.Letext0
	.quad	.LFB5182
	.quad	.LFE5182
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF28:
	.string	"_flags2"
.LASF66:
	.string	"double"
.LASF52:
	.string	"_IO_FILE"
.LASF54:
	.string	"tv_sec"
.LASF49:
	.string	"sys_nerr"
.LASF24:
	.string	"_IO_save_end"
.LASF5:
	.string	"short int"
.LASF7:
	.string	"size_t"
.LASF91:
	.string	"malloc"
.LASF94:
	.string	"GNU C17 8.3.0 -mavx2 -mtune=generic -march=x86-64 -g -O3"
.LASF34:
	.string	"_offset"
.LASF57:
	.string	"__tzname"
.LASF72:
	.string	"run_times"
.LASF18:
	.string	"_IO_write_ptr"
.LASF13:
	.string	"_flags"
.LASF20:
	.string	"_IO_buf_base"
.LASF41:
	.string	"_unused2"
.LASF25:
	.string	"_markers"
.LASF15:
	.string	"_IO_read_end"
.LASF38:
	.string	"_freeres_buf"
.LASF61:
	.string	"daylight"
.LASF98:
	.string	"__m256i_u"
.LASF90:
	.string	"rand"
.LASF62:
	.string	"timezone"
.LASF79:
	.string	"is_ascii"
.LASF68:
	.string	"__m256i"
.LASF65:
	.string	"float"
.LASF42:
	.string	"FILE"
.LASF48:
	.string	"stderr"
.LASF51:
	.string	"long long int"
.LASF82:
	.string	"bits"
.LASF59:
	.string	"__timezone"
.LASF33:
	.string	"_lock"
.LASF58:
	.string	"__daylight"
.LASF6:
	.string	"long int"
.LASF83:
	.string	"_mm256_movemask_epi8"
.LASF89:
	.string	"printf"
.LASF87:
	.string	"strtol"
.LASF30:
	.string	"_cur_column"
.LASF64:
	.string	"tz_dsttime"
.LASF85:
	.string	"atoi"
.LASF17:
	.string	"_IO_write_base"
.LASF71:
	.string	"argv"
.LASF2:
	.string	"unsigned char"
.LASF29:
	.string	"_old_offset"
.LASF69:
	.string	"long double"
.LASF74:
	.string	"total_bytes"
.LASF70:
	.string	"argc"
.LASF84:
	.string	"_mm256_loadu_si256"
.LASF4:
	.string	"signed char"
.LASF88:
	.string	"gettimeofday"
.LASF56:
	.string	"long long unsigned int"
.LASF1:
	.string	"unsigned int"
.LASF43:
	.string	"_IO_marker"
.LASF32:
	.string	"_shortbuf"
.LASF60:
	.string	"tzname"
.LASF92:
	.string	"time"
.LASF14:
	.string	"_IO_read_ptr"
.LASF73:
	.string	"start"
.LASF21:
	.string	"_IO_buf_end"
.LASF12:
	.string	"char"
.LASF76:
	.string	"_Bool"
.LASF77:
	.string	"main"
.LASF36:
	.string	"_wide_data"
.LASF37:
	.string	"_freeres_list"
.LASF9:
	.string	"__off64_t"
.LASF63:
	.string	"tz_minuteswest"
.LASF39:
	.string	"__pad5"
.LASF81:
	.string	"data"
.LASF3:
	.string	"short unsigned int"
.LASF0:
	.string	"long unsigned int"
.LASF19:
	.string	"_IO_write_end"
.LASF10:
	.string	"__time_t"
.LASF80:
	.string	"is_ascii_faster"
.LASF27:
	.string	"_fileno"
.LASF26:
	.string	"_chain"
.LASF53:
	.string	"timeval"
.LASF67:
	.string	"__v32qi"
.LASF45:
	.string	"_IO_wide_data"
.LASF40:
	.string	"_mode"
.LASF55:
	.string	"tv_usec"
.LASF78:
	.string	"get_random_string"
.LASF23:
	.string	"_IO_backup_base"
.LASF46:
	.string	"stdin"
.LASF8:
	.string	"__off_t"
.LASF96:
	.string	"/home/fuchun.zhang/code/github.com/ahfuzhang/is_ascii/tests"
.LASF44:
	.string	"_IO_codecvt"
.LASF16:
	.string	"_IO_read_base"
.LASF31:
	.string	"_vtable_offset"
.LASF35:
	.string	"_codecvt"
.LASF22:
	.string	"_IO_save_base"
.LASF50:
	.string	"sys_errlist"
.LASF75:
	.string	"spend"
.LASF11:
	.string	"__suseconds_t"
.LASF86:
	.string	"__nptr"
.LASF93:
	.string	"srand"
.LASF47:
	.string	"stdout"
.LASF95:
	.string	"is_ascii.c"
.LASF97:
	.string	"_IO_lock_t"
	.ident	"GCC: (Debian 8.3.0-6) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
