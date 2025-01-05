	.file	"main.c"
	.intel_syntax noprefix
	.text
.Ltext0:
	.file 0 "/home/randompigyt/Data-classifier" "src/main.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Hello world"
.LC7:
	.string	"%f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB22:
	.file 1 "src/main.c"
	.loc 1 12 16 view -0
	.cfi_startproc
	push	r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	.loc 1 13 9 is_stmt 0 view .LVU1
	xor	edi, edi
	.loc 1 12 16 view .LVU2
	push	r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	push	r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	push	rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	push	rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	sub	rsp, 16048
	.cfi_def_cfa_offset 16096
	.loc 1 12 16 view .LVU3
	mov	rbp, QWORD PTR fs:40
	mov	QWORD PTR 16040[rsp], rbp
	xor	ebp, ebp
	.loc 1 13 3 is_stmt 1 view .LVU4
	lea	r12, 16[rsp]
	lea	r13, 28[rsp]
	.loc 1 13 9 is_stmt 0 view .LVU5
	call	time@PLT
.LVL0:
	.loc 1 17 9 view .LVU6
	lea	rbx, 4032[rsp]
	.loc 1 13 3 discriminator 1 view .LVU7
	mov	edi, eax
	call	srand@PLT
.LVL1:
	.loc 1 15 3 is_stmt 1 view .LVU8
	lea	rdi, .LC0[rip]
	call	puts@PLT
.LVL2:
	.loc 1 16 3 view .LVU9
	.loc 1 17 3 view .LVU10
	.loc 1 17 9 is_stmt 0 view .LVU11
	mov	ecx, 500
	mov	rdi, rbx
	.loc 1 19 9 view .LVU12
	mov	DWORD PTR 24[rsp], 0x40c00000
	.loc 1 17 9 view .LVU13
	mov	rax, rbp
	lea	rbp, 32[rsp]
	rep stosq
	.loc 1 19 3 is_stmt 1 view .LVU14
	.loc 1 21 3 view .LVU15
.LVL3:
	.loc 1 22 3 view .LVU16
.LBB2:
	.loc 1 22 8 view .LVU17
	.loc 1 22 21 discriminator 1 view .LVU18
.LBE2:
	.loc 1 19 9 is_stmt 0 view .LVU19
	mov	rax, QWORD PTR .LC1[rip]
	mov	QWORD PTR 16[rsp], rax
.LVL4:
.L3:
.LBB6:
.LBB3:
	.loc 1 23 5 is_stmt 1 view .LVU20
	.loc 1 23 18 is_stmt 0 view .LVU21
	call	rand@PLT
.LVL5:
	.loc 1 25 5 is_stmt 1 view .LVU22
.LBB4:
	.loc 1 25 10 view .LVU23
	.loc 1 25 23 discriminator 1 view .LVU24
	.loc 1 27 32 is_stmt 0 view .LVU25
	pxor	xmm0, xmm0
	.loc 1 27 43 view .LVU26
	pxor	xmm3, xmm3
	xor	r14d, r14d
	.loc 1 27 32 view .LVU27
	cvtss2sd	xmm0, DWORD PTR [r12]
	.loc 1 27 29 view .LVU28
	mulsd	xmm0, QWORD PTR .LC3[rip]
	movsd	QWORD PTR [rsp], xmm0
.LBE4:
	.loc 1 23 25 discriminator 1 view .LVU29
	pxor	xmm0, xmm0
	cvtsi2ss	xmm0, eax
	mulss	xmm0, DWORD PTR .LC4[rip]
	.loc 1 23 11 discriminator 1 view .LVU30
	mulss	xmm0, DWORD PTR .LC5[rip]
.LBB5:
	.loc 1 27 43 view .LVU31
	cvtss2sd	xmm3, xmm0
	movsd	QWORD PTR 8[rsp], xmm3
.LVL6:
	.p2align 4
	.p2align 3
.L2:
	.loc 1 26 7 is_stmt 1 view .LVU32
	.loc 1 26 16 is_stmt 0 view .LVU33
	pxor	xmm0, xmm0
	cvtsi2ss	xmm0, r14d
	mulss	xmm0, DWORD PTR .LC6[rip]
	.loc 1 26 12 view .LVU34
	movss	DWORD PTR 0[rbp+r14*4], xmm0
	.loc 1 27 7 is_stmt 1 view .LVU35
	.loc 1 27 39 is_stmt 0 view .LVU36
	cvtss2sd	xmm0, xmm0
	.loc 1 27 36 view .LVU37
	mulsd	xmm0, QWORD PTR [rsp]
	.loc 1 27 43 view .LVU38
	addsd	xmm0, QWORD PTR 8[rsp]
	.loc 1 27 15 view .LVU39
	cvtsd2ss	xmm0, xmm0
	call	cosf@PLT
.LVL7:
	.loc 1 27 12 discriminator 1 view .LVU40
	addss	xmm0, DWORD PTR [rbx+r14*4]
	movss	DWORD PTR [rbx+r14*4], xmm0
	.loc 1 25 32 is_stmt 1 discriminator 3 view .LVU41
.LVL8:
	.loc 1 25 23 discriminator 1 view .LVU42
	add	r14, 1
.LVL9:
	.loc 1 25 23 is_stmt 0 discriminator 1 view .LVU43
	cmp	r14, 1000
	jne	.L2
.LBE5:
.LBE3:
	.loc 1 22 57 is_stmt 1 discriminator 2 view .LVU44
.LVL10:
	.loc 1 22 21 discriminator 1 view .LVU45
	add	r12, 4
.LVL11:
	.loc 1 22 21 is_stmt 0 discriminator 1 view .LVU46
	cmp	r13, r12
	jne	.L3
.LBE6:
	.loc 1 31 3 is_stmt 1 view .LVU47
	.loc 1 32 3 view .LVU48
	lea	r12, 8032[rsp]
.LVL12:
	.loc 1 32 3 is_stmt 0 view .LVU49
	mov	rsi, rbx
	mov	rdi, rbp
	mov	edx, 1000
	mov	rcx, r12
	mov	rbx, r12
	lea	rbp, .LC7[rip]
	call	nudft@PLT
.LVL13:
	.loc 1 34 3 is_stmt 1 view .LVU50
	mov	edi, 10
	lea	r12, 8832[rsp]
	call	putchar@PLT
.LVL14:
	.loc 1 35 3 view .LVU51
.LBB7:
	.loc 1 35 8 view .LVU52
	.loc 1 35 21 discriminator 1 view .LVU53
	.p2align 4
	.p2align 3
.L4:
	.loc 1 36 5 view .LVU54
	.loc 1 36 20 is_stmt 0 view .LVU55
	movq	xmm0, QWORD PTR [rbx]
	.loc 1 35 21 discriminator 1 view .LVU56
	add	rbx, 8
.LVL15:
	.loc 1 36 20 view .LVU57
	call	cabsf@PLT
.LVL16:
	.loc 1 36 5 discriminator 1 view .LVU58
	mov	rdi, rbp
	mov	eax, 1
	cvtss2sd	xmm0, xmm0
	call	printf@PLT
.LVL17:
	.loc 1 35 29 is_stmt 1 discriminator 3 view .LVU59
	.loc 1 35 21 discriminator 1 view .LVU60
	cmp	rbx, r12
	jne	.L4
.LBE7:
	.loc 1 39 3 view .LVU61
	.loc 1 40 1 is_stmt 0 view .LVU62
	mov	rax, QWORD PTR 16040[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L11
	add	rsp, 16048
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	xor	eax, eax
	pop	rbx
	.cfi_def_cfa_offset 40
	pop	rbp
	.cfi_def_cfa_offset 32
	pop	r12
	.cfi_def_cfa_offset 24
	pop	r13
	.cfi_def_cfa_offset 16
	pop	r14
	.cfi_def_cfa_offset 8
.LVL18:
	.loc 1 40 1 view .LVU63
	ret
.LVL19:
.L11:
	.cfi_restore_state
	.loc 1 40 1 view .LVU64
	call	__stack_chk_fail@PLT
.LVL20:
	.cfi_endproc
.LFE22:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	1073741824
	.long	1082130432
	.align 8
.LC3:
	.long	1413754136
	.long	1075388923
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC4:
	.long	805306368
	.align 4
.LC5:
	.long	1092616192
	.align 4
.LC6:
	.long	1000593162
	.text
.Letext0:
	.file 2 "/usr/include/bits/types.h"
	.file 3 "/usr/include/bits/types/time_t.h"
	.file 4 "/usr/include/bits/stdint-uintn.h"
	.file 5 "/usr/include/stdio.h"
	.file 6 "/usr/include/bits/cmathcalls.h"
	.file 7 "/usr/include/bits/mathcalls.h"
	.file 8 "src/nudft.h"
	.file 9 "/usr/include/stdlib.h"
	.file 10 "/usr/include/time.h"
	.file 11 "<built-in>"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x376
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0xf
	.long	.LASF29
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.long	.LLRL6
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x1
	.byte	0x4
	.byte	0x4
	.long	.LASF2
	.uleb128 0x10
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.long	.LASF3
	.uleb128 0x1
	.byte	0x2
	.byte	0x7
	.long	.LASF4
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.long	.LASF5
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.long	.LASF6
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.long	.LASF7
	.uleb128 0x1
	.byte	0x2
	.byte	0x5
	.long	.LASF8
	.uleb128 0x1
	.byte	0x8
	.byte	0x5
	.long	.LASF9
	.uleb128 0x5
	.long	.LASF10
	.byte	0x2
	.byte	0x2d
	.byte	0x1b
	.long	0x4d
	.uleb128 0x5
	.long	.LASF11
	.byte	0x2
	.byte	0xa0
	.byte	0x1a
	.long	0x62
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.long	.LASF12
	.uleb128 0x11
	.long	0x81
	.uleb128 0x1
	.byte	0x8
	.byte	0x4
	.long	.LASF13
	.uleb128 0x6
	.long	0x88
	.uleb128 0x1
	.byte	0x8
	.byte	0x5
	.long	.LASF14
	.uleb128 0x5
	.long	.LASF15
	.byte	0x3
	.byte	0xa
	.byte	0x12
	.long	0x75
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.long	.LASF16
	.uleb128 0x5
	.long	.LASF17
	.byte	0x4
	.byte	0x1b
	.byte	0x14
	.long	0x69
	.uleb128 0x12
	.long	.LASF18
	.byte	0x5
	.value	0x16b
	.byte	0xc
	.long	0x31
	.long	0xd7
	.uleb128 0x2
	.long	0x94
	.uleb128 0x13
	.byte	0
	.uleb128 0xa
	.long	.LASF19
	.byte	0x6
	.byte	0x70
	.byte	0x1
	.long	0x2a
	.long	0xed
	.uleb128 0x2
	.long	0xed
	.byte	0
	.uleb128 0x1
	.byte	0x8
	.byte	0x3
	.long	.LASF20
	.uleb128 0x14
	.long	.LASF22
	.byte	0x8
	.byte	0xa
	.byte	0x6
	.long	0x115
	.uleb128 0x2
	.long	0x115
	.uleb128 0x2
	.long	0x115
	.uleb128 0x2
	.long	0xb3
	.uleb128 0x2
	.long	0x11a
	.byte	0
	.uleb128 0x6
	.long	0x2a
	.uleb128 0x6
	.long	0xed
	.uleb128 0xa
	.long	.LASF21
	.byte	0x7
	.byte	0x3e
	.byte	0x1
	.long	0x2a
	.long	0x135
	.uleb128 0x2
	.long	0x2a
	.byte	0
	.uleb128 0x15
	.long	.LASF30
	.byte	0x9
	.value	0x23d
	.byte	0xc
	.long	0x31
	.uleb128 0x16
	.long	.LASF23
	.byte	0x9
	.value	0x23f
	.byte	0xd
	.long	0x155
	.uleb128 0x2
	.long	0x46
	.byte	0
	.uleb128 0xa
	.long	.LASF24
	.byte	0xa
	.byte	0x4c
	.byte	0xf
	.long	0xa0
	.long	0x16b
	.uleb128 0x2
	.long	0x16b
	.byte	0
	.uleb128 0x6
	.long	0xa0
	.uleb128 0x17
	.long	.LASF31
	.byte	0x1
	.byte	0xc
	.byte	0x5
	.long	0x31
	.quad	.LFB22
	.quad	.LFE22-.LFB22
	.uleb128 0x1
	.byte	0x9c
	.long	0x330
	.uleb128 0x7
	.string	"x"
	.byte	0x10
	.byte	0x9
	.long	0x330
	.uleb128 0x4
	.byte	0x91
	.sleb128 -16064
	.uleb128 0x7
	.string	"y"
	.byte	0x11
	.byte	0x9
	.long	0x330
	.uleb128 0x4
	.byte	0x91
	.sleb128 -12064
	.uleb128 0x7
	.string	"f"
	.byte	0x13
	.byte	0x9
	.long	0x33f
	.uleb128 0x4
	.byte	0x91
	.sleb128 -16080
	.uleb128 0x18
	.string	"dt"
	.byte	0x1
	.byte	0x15
	.byte	0x9
	.long	0x2a
	.byte	0x4
	.long	0x3ba3d70a
	.uleb128 0x7
	.string	"res"
	.byte	0x1f
	.byte	0x11
	.long	0x34f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -8064
	.uleb128 0xc
	.long	.LLRL0
	.long	0x250
	.uleb128 0x8
	.string	"j"
	.byte	0x16
	.byte	0xc
	.long	0x31
	.long	.LLST1
	.long	.LVUS1
	.uleb128 0x19
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x8
	.string	"phi"
	.byte	0x17
	.byte	0xb
	.long	0x2a
	.long	.LLST2
	.long	.LVUS2
	.uleb128 0xc
	.long	.LLRL3
	.long	0x241
	.uleb128 0x8
	.string	"i"
	.byte	0x19
	.byte	0xe
	.long	0x31
	.long	.LLST4
	.long	.LVUS4
	.uleb128 0x4
	.quad	.LVL7
	.long	0x11f
	.byte	0
	.uleb128 0x4
	.quad	.LVL5
	.long	0x135
	.byte	0
	.byte	0
	.uleb128 0x1a
	.quad	.LBB7
	.quad	.LBE7-.LBB7
	.long	0x298
	.uleb128 0x8
	.string	"i"
	.byte	0x23
	.byte	0xc
	.long	0x31
	.long	.LLST5
	.long	.LVUS5
	.uleb128 0x4
	.quad	.LVL16
	.long	0xd7
	.uleb128 0x1b
	.quad	.LVL17
	.long	0xbf
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x9
	.quad	.LVL0
	.long	0x155
	.long	0x2b0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x4
	.quad	.LVL1
	.long	0x142
	.uleb128 0x9
	.quad	.LVL2
	.long	0x35e
	.long	0x2dc
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC0
	.byte	0
	.uleb128 0x9
	.quad	.LVL13
	.long	0xf4
	.long	0x30b
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x91
	.sleb128 -16064
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x4
	.byte	0x91
	.sleb128 -12064
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0xa
	.value	0x3e8
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x9
	.quad	.LVL14
	.long	0x367
	.long	0x322
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x3a
	.byte	0
	.uleb128 0x4
	.quad	.LVL20
	.long	0x370
	.byte	0
	.uleb128 0xb
	.long	0x2a
	.long	0x33f
	.uleb128 0xd
	.long	0x4d
	.byte	0
	.uleb128 0xb
	.long	0x2a
	.long	0x34f
	.uleb128 0x1c
	.long	0x4d
	.byte	0x2
	.byte	0
	.uleb128 0xb
	.long	0xed
	.long	0x35e
	.uleb128 0xd
	.long	0x4d
	.byte	0
	.uleb128 0xe
	.long	.LASF25
	.long	.LASF27
	.uleb128 0xe
	.long	.LASF26
	.long	.LASF28
	.uleb128 0x1d
	.long	.LASF32
	.long	.LASF32
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
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
	.uleb128 0x2
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x49
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x7e
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x48
	.byte	0
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
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
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
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
	.uleb128 0x8
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
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
	.uleb128 0x9
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
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
	.uleb128 0x21
	.sleb128 999
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0x21
	.sleb128 11
	.uleb128 0x3b
	.uleb128 0x21
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x1f
	.uleb128 0x1b
	.uleb128 0x1f
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x18
	.byte	0
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x2e
	.byte	0
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
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
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
	.uleb128 0x1c
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.uleb128 0x1b
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1d
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
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loclists,"",@progbits
	.long	.Ldebug_loc3-.Ldebug_loc2
.Ldebug_loc2:
	.value	0x5
	.byte	0x8
	.byte	0
	.long	0
.Ldebug_loc0:
.LVUS1:
	.uleb128 .LVU18
	.uleb128 .LVU20
	.uleb128 .LVU20
	.uleb128 .LVU45
	.uleb128 .LVU45
	.uleb128 .LVU46
	.uleb128 .LVU46
	.uleb128 .LVU49
.LLST1:
	.byte	0x6
	.quad	.LVL3
	.byte	0x4
	.uleb128 .LVL3-.LVL3
	.uleb128 .LVL4-.LVL3
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL4-.LVL3
	.uleb128 .LVL10-.LVL3
	.uleb128 0xb
	.byte	0x7c
	.sleb128 0
	.byte	0x91
	.sleb128 0
	.byte	0x1c
	.byte	0x23
	.uleb128 0x3ed0
	.byte	0x32
	.byte	0x25
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL10-.LVL3
	.uleb128 .LVL11-.LVL3
	.uleb128 0xd
	.byte	0x7c
	.sleb128 0
	.byte	0x91
	.sleb128 0
	.byte	0x1c
	.byte	0x23
	.uleb128 0x3ed0
	.byte	0x32
	.byte	0x25
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL11-.LVL3
	.uleb128 .LVL12-.LVL3
	.uleb128 0xd
	.byte	0x7c
	.sleb128 0
	.byte	0x91
	.sleb128 0
	.byte	0x1c
	.byte	0x23
	.uleb128 0x3ecc
	.byte	0x32
	.byte	0x25
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.byte	0
.LVUS2:
	.uleb128 .LVU22
	.uleb128 .LVU32
.LLST2:
	.byte	0x8
	.quad	.LVL5
	.uleb128 .LVL6-.LVL5
	.uleb128 0x17
	.byte	0x70
	.sleb128 0
	.byte	0xa8
	.uleb128 0x31
	.byte	0xa8
	.uleb128 0x2a
	.byte	0xa4
	.uleb128 0x2a
	.byte	0x4
	.long	0x30000000
	.byte	0x1e
	.byte	0xa4
	.uleb128 0x2a
	.byte	0x4
	.long	0x41200000
	.byte	0x1e
	.byte	0x9f
	.byte	0
.LVUS4:
	.uleb128 .LVU24
	.uleb128 .LVU32
	.uleb128 .LVU32
	.uleb128 .LVU42
	.uleb128 .LVU42
	.uleb128 .LVU43
	.uleb128 .LVU43
	.uleb128 .LVU63
	.uleb128 .LVU64
	.uleb128 0
.LLST4:
	.byte	0x6
	.quad	.LVL5
	.byte	0x4
	.uleb128 .LVL5-.LVL5
	.uleb128 .LVL6-.LVL5
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL6-.LVL5
	.uleb128 .LVL8-.LVL5
	.uleb128 0x1
	.byte	0x5e
	.byte	0x4
	.uleb128 .LVL8-.LVL5
	.uleb128 .LVL9-.LVL5
	.uleb128 0x3
	.byte	0x7e
	.sleb128 1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL9-.LVL5
	.uleb128 .LVL18-.LVL5
	.uleb128 0x1
	.byte	0x5e
	.byte	0x4
	.uleb128 .LVL19-.LVL5
	.uleb128 .LFE22-.LVL5
	.uleb128 0x1
	.byte	0x5e
	.byte	0
.LVUS5:
	.uleb128 .LVU53
	.uleb128 .LVU54
	.uleb128 .LVU54
	.uleb128 .LVU57
	.uleb128 .LVU57
	.uleb128 .LVU60
.LLST5:
	.byte	0x6
	.quad	.LVL14
	.byte	0x4
	.uleb128 .LVL14-.LVL14
	.uleb128 .LVL14-.LVL14
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL14-.LVL14
	.uleb128 .LVL15-.LVL14
	.uleb128 0xb
	.byte	0x73
	.sleb128 0
	.byte	0x91
	.sleb128 0
	.byte	0x1c
	.byte	0x23
	.uleb128 0x1f80
	.byte	0x33
	.byte	0x25
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL15-.LVL14
	.uleb128 .LVL17-.LVL14
	.uleb128 0xb
	.byte	0x73
	.sleb128 0
	.byte	0x91
	.sleb128 0
	.byte	0x1c
	.byte	0x23
	.uleb128 0x1f78
	.byte	0x33
	.byte	0x25
	.byte	0x9f
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.LFB22
	.quad	.LFE22-.LFB22
	.quad	0
	.quad	0
	.section	.debug_rnglists,"",@progbits
.Ldebug_ranges0:
	.long	.Ldebug_ranges3-.Ldebug_ranges2
.Ldebug_ranges2:
	.value	0x5
	.byte	0x8
	.byte	0
	.long	0
.LLRL0:
	.byte	0x5
	.quad	.LBB2
	.byte	0x4
	.uleb128 .LBB2-.LBB2
	.uleb128 .LBE2-.LBB2
	.byte	0x4
	.uleb128 .LBB6-.LBB2
	.uleb128 .LBE6-.LBB2
	.byte	0
.LLRL3:
	.byte	0x5
	.quad	.LBB4
	.byte	0x4
	.uleb128 .LBB4-.LBB4
	.uleb128 .LBE4-.LBB4
	.byte	0x4
	.uleb128 .LBB5-.LBB4
	.uleb128 .LBE5-.LBB4
	.byte	0
.LLRL6:
	.byte	0x7
	.quad	.LFB22
	.uleb128 .LFE22-.LFB22
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF19:
	.string	"cabsf"
.LASF11:
	.string	"__time_t"
.LASF28:
	.string	"__builtin_putchar"
.LASF17:
	.string	"uint64_t"
.LASF2:
	.string	"float"
.LASF27:
	.string	"__builtin_puts"
.LASF3:
	.string	"unsigned char"
.LASF6:
	.string	"long unsigned int"
.LASF4:
	.string	"short unsigned int"
.LASF26:
	.string	"putchar"
.LASF29:
	.string	"GNU C23 14.2.1 20240910 -masm=intel -mtune=generic -march=x86-64 -g -O3 -std=gnu23"
.LASF32:
	.string	"__stack_chk_fail"
.LASF21:
	.string	"cosf"
.LASF13:
	.string	"double"
.LASF23:
	.string	"srand"
.LASF31:
	.string	"main"
.LASF5:
	.string	"unsigned int"
.LASF16:
	.string	"long long unsigned int"
.LASF15:
	.string	"time_t"
.LASF20:
	.string	"complex float"
.LASF24:
	.string	"time"
.LASF14:
	.string	"long long int"
.LASF12:
	.string	"char"
.LASF18:
	.string	"printf"
.LASF8:
	.string	"short int"
.LASF10:
	.string	"__uint64_t"
.LASF9:
	.string	"long int"
.LASF25:
	.string	"puts"
.LASF7:
	.string	"signed char"
.LASF22:
	.string	"nudft"
.LASF30:
	.string	"rand"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"src/main.c"
.LASF1:
	.string	"/home/randompigyt/Data-classifier"
	.ident	"GCC: (GNU) 14.2.1 20240910"
	.section	.note.GNU-stack,"",@progbits
