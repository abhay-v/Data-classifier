	.file	"nudft.c"
	.intel_syntax noprefix
	.text
.Ltext0:
	.file 0 "/home/randompigyt/Data-classifier" "src/nudft.c"
	.section	.rodata
	.align 4
.LC3:
	.long	0
	.long	0
	.align 4
.LC4:
	.long	1065353216
	.long	0
	.text
	.globl	nudft
	.type	nudft, @function
nudft:
.LFB6:
	.file 1 "src/nudft.c"
	.loc 1 13 74
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	add	rsp, -128
	mov	QWORD PTR -88[rbp], rdi
	mov	QWORD PTR -96[rbp], rsi
	mov	QWORD PTR -104[rbp], rdx
	mov	QWORD PTR -112[rbp], rcx
	.loc 1 15 5
	mov	rdx, QWORD PTR -104[rbp]
	mov	rax, QWORD PTR -104[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	gsl_matrix_complex_float_alloc@PLT
	mov	QWORD PTR -32[rbp], rax
.LBB2:
	.loc 1 17 17
	mov	QWORD PTR -56[rbp], 0
	.loc 1 17 3
	jmp	.L2
.L7:
.LBB3:
	.loc 1 18 19
	mov	QWORD PTR -48[rbp], 0
	.loc 1 18 5
	jmp	.L3
.L6:
.LBB4:
	.loc 1 19 28
	mov	rax, QWORD PTR -56[rbp]
	test	rax, rax
	js	.L4
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rax
	jmp	.L5
.L4:
	mov	rdx, rax
	shr	rdx
	and	eax, 1
	or	rdx, rax
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rdx
	addsd	xmm0, xmm0
.L5:
	pxor	xmm1, xmm1
	movapd	xmm2, xmm1
	mulsd	xmm2, xmm0
	.loc 1 19 61
	mov	rax, QWORD PTR -48[rbp]
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -88[rbp]
	add	rax, rdx
	movss	xmm1, DWORD PTR [rax]
	cvtss2sd	xmm1, xmm1
	.loc 1 19 28
	mulsd	xmm2, xmm1
	pxor	xmm3, xmm3
	cvtsd2ss	xmm3, xmm2
	movsd	xmm2, QWORD PTR .LC1[rip]
	mulsd	xmm0, xmm2
	mulsd	xmm0, xmm1
	cvtsd2ss	xmm0, xmm0
	.loc 1 19 58
	movaps	xmm1, xmm3
	.loc 1 19 28
	movss	DWORD PTR -120[rbp], xmm1
	movss	DWORD PTR -116[rbp], xmm0
	mov	rax, QWORD PTR -120[rbp]
	movq	xmm0, rax
	call	cexpf@PLT
	movq	rax, xmm0
	mov	QWORD PTR -8[rbp], rax
	movss	xmm0, DWORD PTR -8[rbp]
	movss	DWORD PTR -64[rbp], xmm0
	movss	xmm0, DWORD PTR -4[rbp]
	movss	DWORD PTR -60[rbp], xmm0
	.loc 1 20 7
	mov	rsi, QWORD PTR -8[rbp]
	mov	rdx, QWORD PTR -48[rbp]
	mov	rcx, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR -32[rbp]
	movq	xmm0, rsi
	mov	rsi, rcx
	mov	rdi, rax
	call	gsl_matrix_complex_float_set@PLT
.LBE4:
	.loc 1 18 44 discriminator 3
	add	QWORD PTR -48[rbp], 1
.L3:
	.loc 1 18 28 discriminator 1
	mov	rax, QWORD PTR -48[rbp]
	cmp	rax, QWORD PTR -104[rbp]
	jb	.L6
.LBE3:
	.loc 1 17 42 discriminator 2
	add	QWORD PTR -56[rbp], 1
.L2:
	.loc 1 17 26 discriminator 1
	mov	rax, QWORD PTR -56[rbp]
	cmp	rax, QWORD PTR -104[rbp]
	jb	.L7
.LBE2:
	.loc 1 24 37
	mov	rax, QWORD PTR -104[rbp]
	mov	rdi, rax
	call	gsl_vector_complex_float_alloc@PLT
	mov	QWORD PTR -24[rbp], rax
.LBB5:
	.loc 1 25 17
	mov	QWORD PTR -40[rbp], 0
	.loc 1 25 3
	jmp	.L8
.L9:
	.loc 1 26 45
	mov	rax, QWORD PTR -40[rbp]
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -96[rbp]
	add	rax, rdx
	movss	xmm1, DWORD PTR [rax]
	.loc 1 26 5
	pxor	xmm0, xmm0
	addss	xmm0, xmm1
	movaps	xmm1, xmm0
	pxor	xmm0, xmm0
	movss	DWORD PTR -128[rbp], xmm1
	movss	DWORD PTR -124[rbp], xmm0
	mov	rcx, QWORD PTR -128[rbp]
	mov	rdx, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR -24[rbp]
	movq	xmm0, rcx
	mov	rsi, rdx
	mov	rdi, rax
	call	gsl_vector_complex_float_set@PLT
	.loc 1 25 42 discriminator 3
	add	QWORD PTR -40[rbp], 1
.L8:
	.loc 1 25 26 discriminator 1
	mov	rax, QWORD PTR -40[rbp]
	cmp	rax, QWORD PTR -104[rbp]
	jb	.L9
.LBE5:
	.loc 1 32 5
	mov	rax, QWORD PTR -104[rbp]
	mov	rdi, rax
	call	gsl_vector_complex_float_alloc@PLT
	mov	QWORD PTR -16[rbp], rax
	.loc 1 34 3
	mov	rcx, QWORD PTR -16[rbp]
	movq	xmm0, QWORD PTR .LC3[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	rdi, QWORD PTR .LC4[rip]
	movdqa	xmm1, xmm0
	mov	rsi, rax
	movq	xmm0, rdi
	mov	edi, 111
	call	gsl_blas_cgemv@PLT
.LBB6:
	.loc 1 36 12
	mov	DWORD PTR -68[rbp], 0
	.loc 1 36 3
	jmp	.L10
.L11:
	.loc 1 36 37 discriminator 3
	add	DWORD PTR -68[rbp], 1
.L10:
	.loc 1 36 21 discriminator 1
	mov	eax, DWORD PTR -68[rbp]
	cdqe
	cmp	rax, QWORD PTR -104[rbp]
	jb	.L11
.LBE6:
	.loc 1 41 37
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR [rax]
	.loc 1 41 3
	lea	rdx, 0[0+rax*8]
	.loc 1 41 22
	mov	rax, QWORD PTR -16[rbp]
	mov	rcx, QWORD PTR 16[rax]
	.loc 1 41 3
	mov	rax, QWORD PTR -112[rbp]
	mov	rsi, rcx
	mov	rdi, rax
	call	memcpy@PLT
	.loc 1 43 3
	mov	rax, QWORD PTR -32[rbp]
	mov	rdi, rax
	call	gsl_matrix_complex_float_free@PLT
	.loc 1 44 3
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	gsl_vector_complex_float_free@PLT
	.loc 1 45 3
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	gsl_vector_complex_float_free@PLT
	.loc 1 46 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	nudft, .-nudft
	.section	.rodata
	.align 8
.LC1:
	.long	1413754136
	.long	1075388923
	.text
.Letext0:
	.file 2 "/usr/include/bits/types.h"
	.file 3 "/usr/include/bits/stdint-uintn.h"
	.file 4 "/usr/include/gsl/gsl_complex.h"
	.file 5 "/usr/lib/gcc/x86_64-pc-linux-gnu/14.2.1/include/stddef.h"
	.file 6 "/usr/include/gsl/gsl_blas_types.h"
	.file 7 "/usr/include/gsl/gsl_block_complex_float.h"
	.file 8 "/usr/include/gsl/gsl_vector_complex_float.h"
	.file 9 "/usr/include/gsl/gsl_matrix_complex_float.h"
	.file 10 "/usr/include/string.h"
	.file 11 "/usr/include/gsl/gsl_blas.h"
	.file 12 "/usr/include/bits/cmathcalls.h"
	.file 13 "/usr/include/gsl/gsl_cblas.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x446
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x10
	.long	.LASF49
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF2
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF3
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF4
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF5
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF7
	.uleb128 0x11
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF8
	.uleb128 0x4
	.long	.LASF10
	.byte	0x2
	.byte	0x2d
	.byte	0x1b
	.long	0x43
	.uleb128 0x12
	.byte	0x8
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF9
	.uleb128 0x4
	.long	.LASF11
	.byte	0x3
	.byte	0x1b
	.byte	0x14
	.long	0x66
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.long	.LASF12
	.uleb128 0x5
	.long	0x93
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF13
	.uleb128 0x2
	.byte	0x10
	.byte	0x4
	.long	.LASF14
	.uleb128 0x2
	.byte	0x10
	.byte	0x3
	.long	.LASF15
	.uleb128 0x2
	.byte	0x20
	.byte	0x3
	.long	.LASF16
	.uleb128 0x4
	.long	.LASF17
	.byte	0x4
	.byte	0x8a
	.byte	0x1
	.long	0xc0
	.uleb128 0x8
	.long	0xaf
	.uleb128 0x2
	.byte	0x8
	.byte	0x3
	.long	.LASF18
	.uleb128 0x4
	.long	.LASF19
	.byte	0x5
	.byte	0xd6
	.byte	0x17
	.long	0x43
	.uleb128 0x8
	.long	0xc7
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF20
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF21
	.uleb128 0x5
	.long	0xeb
	.uleb128 0x13
	.uleb128 0x14
	.long	.LASF50
	.byte	0x7
	.byte	0x4
	.long	0x3c
	.byte	0xd
	.byte	0x2f
	.byte	0x6
	.long	0x111
	.uleb128 0x9
	.long	.LASF22
	.byte	0x6f
	.uleb128 0x9
	.long	.LASF23
	.byte	0x70
	.uleb128 0x9
	.long	.LASF24
	.byte	0x71
	.byte	0
	.uleb128 0x4
	.long	.LASF25
	.byte	0x6
	.byte	0x2c
	.byte	0x21
	.long	0xec
	.uleb128 0x15
	.long	.LASF51
	.byte	0x10
	.byte	0x7
	.byte	0x26
	.byte	0x8
	.long	0x145
	.uleb128 0x3
	.long	.LASF26
	.byte	0x7
	.byte	0x28
	.byte	0xa
	.long	0xc7
	.byte	0
	.uleb128 0x3
	.long	.LASF27
	.byte	0x7
	.byte	0x29
	.byte	0xa
	.long	0x8e
	.byte	0x8
	.byte	0
	.uleb128 0x4
	.long	.LASF28
	.byte	0x7
	.byte	0x2c
	.byte	0x2f
	.long	0x11d
	.uleb128 0xe
	.byte	0x28
	.byte	0x8
	.byte	0x2c
	.long	0x19b
	.uleb128 0x3
	.long	.LASF26
	.byte	0x8
	.byte	0x2e
	.byte	0xa
	.long	0xc7
	.byte	0
	.uleb128 0x3
	.long	.LASF29
	.byte	0x8
	.byte	0x2f
	.byte	0xa
	.long	0xc7
	.byte	0x8
	.uleb128 0x3
	.long	.LASF27
	.byte	0x8
	.byte	0x30
	.byte	0xa
	.long	0x8e
	.byte	0x10
	.uleb128 0x3
	.long	.LASF30
	.byte	0x8
	.byte	0x31
	.byte	0x1c
	.long	0x19b
	.byte	0x18
	.uleb128 0x3
	.long	.LASF31
	.byte	0x8
	.byte	0x32
	.byte	0x7
	.long	0x58
	.byte	0x20
	.byte	0
	.uleb128 0x5
	.long	0x145
	.uleb128 0x4
	.long	.LASF32
	.byte	0x8
	.byte	0x33
	.byte	0x3
	.long	0x151
	.uleb128 0x8
	.long	0x1a0
	.uleb128 0xe
	.byte	0x30
	.byte	0x9
	.byte	0x2b
	.long	0x208
	.uleb128 0x3
	.long	.LASF33
	.byte	0x9
	.byte	0x2d
	.byte	0xa
	.long	0xc7
	.byte	0
	.uleb128 0x3
	.long	.LASF34
	.byte	0x9
	.byte	0x2e
	.byte	0xa
	.long	0xc7
	.byte	0x8
	.uleb128 0x16
	.string	"tda"
	.byte	0x9
	.byte	0x2f
	.byte	0xa
	.long	0xc7
	.byte	0x10
	.uleb128 0x3
	.long	.LASF27
	.byte	0x9
	.byte	0x30
	.byte	0xb
	.long	0x8e
	.byte	0x18
	.uleb128 0x3
	.long	.LASF30
	.byte	0x9
	.byte	0x31
	.byte	0x1d
	.long	0x19b
	.byte	0x20
	.uleb128 0x3
	.long	.LASF31
	.byte	0x9
	.byte	0x32
	.byte	0x7
	.long	0x58
	.byte	0x28
	.byte	0
	.uleb128 0x4
	.long	.LASF35
	.byte	0x9
	.byte	0x33
	.byte	0x3
	.long	0x1b1
	.uleb128 0x8
	.long	0x208
	.uleb128 0xa
	.long	.LASF36
	.byte	0x8
	.byte	0x54
	.byte	0x6
	.long	0x22b
	.uleb128 0x1
	.long	0x22b
	.byte	0
	.uleb128 0x5
	.long	0x1a0
	.uleb128 0xa
	.long	.LASF37
	.byte	0x9
	.byte	0x5e
	.byte	0x6
	.long	0x242
	.uleb128 0x1
	.long	0x242
	.byte	0
	.uleb128 0x5
	.long	0x208
	.uleb128 0x6
	.long	.LASF38
	.byte	0xa
	.byte	0x2b
	.byte	0xe
	.long	0x72
	.long	0x267
	.uleb128 0x1
	.long	0x72
	.uleb128 0x1
	.long	0xe6
	.uleb128 0x1
	.long	0x43
	.byte	0
	.uleb128 0x6
	.long	.LASF39
	.byte	0xb
	.byte	0xde
	.byte	0x6
	.long	0x58
	.long	0x296
	.uleb128 0x1
	.long	0x111
	.uleb128 0x1
	.long	0xbb
	.uleb128 0x1
	.long	0x296
	.uleb128 0x1
	.long	0x29b
	.uleb128 0x1
	.long	0xbb
	.uleb128 0x1
	.long	0x22b
	.byte	0
	.uleb128 0x5
	.long	0x214
	.uleb128 0x5
	.long	0x1ac
	.uleb128 0xa
	.long	.LASF40
	.byte	0x8
	.byte	0xbb
	.byte	0x12
	.long	0x2bc
	.uleb128 0x1
	.long	0x22b
	.uleb128 0x1
	.long	0xd3
	.uleb128 0x1
	.long	0xaf
	.byte	0
	.uleb128 0x6
	.long	.LASF41
	.byte	0x8
	.byte	0x45
	.byte	0x1b
	.long	0x22b
	.long	0x2d2
	.uleb128 0x1
	.long	0xd3
	.byte	0
	.uleb128 0x17
	.long	.LASF42
	.byte	0x9
	.value	0x106
	.byte	0x12
	.long	0x2f4
	.uleb128 0x1
	.long	0x242
	.uleb128 0x1
	.long	0xd3
	.uleb128 0x1
	.long	0xd3
	.uleb128 0x1
	.long	0xbb
	.byte	0
	.uleb128 0x6
	.long	.LASF43
	.byte	0xc
	.byte	0x59
	.byte	0x1
	.long	0xc0
	.long	0x30a
	.uleb128 0x1
	.long	0xc0
	.byte	0
	.uleb128 0x6
	.long	.LASF44
	.byte	0x9
	.byte	0x47
	.byte	0x1
	.long	0x242
	.long	0x325
	.uleb128 0x1
	.long	0xd3
	.uleb128 0x1
	.long	0xd3
	.byte	0
	.uleb128 0x18
	.long	.LASF52
	.byte	0x1
	.byte	0xd
	.byte	0x6
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x444
	.uleb128 0xb
	.string	"x"
	.byte	0x13
	.long	0x8e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0xb
	.string	"y"
	.byte	0x1d
	.long	0x8e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x19
	.long	.LASF45
	.byte	0x1
	.byte	0xd
	.byte	0x29
	.long	0x7b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0xb
	.string	"res"
	.byte	0x45
	.long	0x444
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x7
	.string	"m"
	.byte	0xe
	.byte	0x1d
	.long	0x242
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xc
	.long	.LASF46
	.byte	0x18
	.byte	0x1d
	.long	0x22b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xc
	.long	.LASF47
	.byte	0x1f
	.byte	0x1d
	.long	0x22b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xf
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.long	0x402
	.uleb128 0x7
	.string	"i"
	.byte	0x11
	.byte	0x11
	.long	0x7b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0xd
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x7
	.string	"j"
	.byte	0x12
	.byte	0x13
	.long	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0xd
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.uleb128 0xc
	.long	.LASF48
	.byte	0x13
	.byte	0x15
	.long	0xc0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xf
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.long	0x424
	.uleb128 0x7
	.string	"i"
	.byte	0x19
	.byte	0x11
	.long	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.byte	0
	.uleb128 0xd
	.quad	.LBB6
	.quad	.LBE6-.LBB6
	.uleb128 0x7
	.string	"i"
	.byte	0x24
	.byte	0xc
	.long	0x58
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.byte	0
	.byte	0
	.uleb128 0x5
	.long	0xc0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
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
	.uleb128 0x4
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
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
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
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x21
	.sleb128 13
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
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
	.uleb128 0xd
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 9
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x12
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x15
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
	.uleb128 0x16
	.uleb128 0xd
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
	.uleb128 0x38
	.uleb128 0xb
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
	.uleb128 0x18
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
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF40:
	.string	"gsl_vector_complex_float_set"
.LASF49:
	.string	"GNU C23 14.2.1 20240910 -masm=intel -mtune=generic -march=x86-64 -g -O0 -std=gnu23"
.LASF19:
	.string	"size_t"
.LASF34:
	.string	"size2"
.LASF51:
	.string	"gsl_block_complex_float_struct"
.LASF28:
	.string	"gsl_block_complex_float"
.LASF23:
	.string	"CblasTrans"
.LASF3:
	.string	"short unsigned int"
.LASF50:
	.string	"CBLAS_TRANSPOSE"
.LASF45:
	.string	"num_samples"
.LASF30:
	.string	"block"
.LASF42:
	.string	"gsl_matrix_complex_float_set"
.LASF13:
	.string	"float"
.LASF27:
	.string	"data"
.LASF29:
	.string	"stride"
.LASF47:
	.string	"res_vec"
.LASF26:
	.string	"size"
.LASF39:
	.string	"gsl_blas_cgemv"
.LASF5:
	.string	"long unsigned int"
.LASF46:
	.string	"y_vec"
.LASF2:
	.string	"unsigned char"
.LASF33:
	.string	"size1"
.LASF12:
	.string	"double"
.LASF7:
	.string	"short int"
.LASF44:
	.string	"gsl_matrix_complex_float_alloc"
.LASF16:
	.string	"complex long double"
.LASF31:
	.string	"owner"
.LASF4:
	.string	"unsigned int"
.LASF21:
	.string	"long long unsigned int"
.LASF41:
	.string	"gsl_vector_complex_float_alloc"
.LASF18:
	.string	"complex float"
.LASF20:
	.string	"long long int"
.LASF24:
	.string	"CblasConjTrans"
.LASF17:
	.string	"gsl_complex_float"
.LASF9:
	.string	"char"
.LASF22:
	.string	"CblasNoTrans"
.LASF48:
	.string	"w_ij"
.LASF38:
	.string	"memcpy"
.LASF37:
	.string	"gsl_matrix_complex_float_free"
.LASF15:
	.string	"complex double"
.LASF35:
	.string	"gsl_matrix_complex_float"
.LASF32:
	.string	"gsl_vector_complex_float"
.LASF11:
	.string	"uint64_t"
.LASF8:
	.string	"long int"
.LASF10:
	.string	"__uint64_t"
.LASF14:
	.string	"long double"
.LASF6:
	.string	"signed char"
.LASF25:
	.string	"CBLAS_TRANSPOSE_t"
.LASF52:
	.string	"nudft"
.LASF43:
	.string	"cexpf"
.LASF36:
	.string	"gsl_vector_complex_float_free"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/randompigyt/Data-classifier"
.LASF0:
	.string	"src/nudft.c"
	.ident	"GCC: (GNU) 14.2.1 20240910"
	.section	.note.GNU-stack,"",@progbits
