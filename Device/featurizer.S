	.text
	.syntax unified
	.eabi_attribute	67, "2.09"	@ Tag_conformance
	.cpu	cortex-m4
	.eabi_attribute	6, 13	@ Tag_CPU_arch
	.eabi_attribute	7, 77	@ Tag_CPU_arch_profile
	.eabi_attribute	8, 0	@ Tag_ARM_ISA_use
	.eabi_attribute	9, 2	@ Tag_THUMB_ISA_use
	.fpu	fpv4-sp-d16
	.eabi_attribute	27, 1	@ Tag_ABI_HardFP_use
	.eabi_attribute	36, 1	@ Tag_FP_HP_extension
	.eabi_attribute	34, 1	@ Tag_CPU_unaligned_access
	.eabi_attribute	15, 1	@ Tag_ABI_PCS_RW_data
	.eabi_attribute	16, 1	@ Tag_ABI_PCS_RO_data
	.eabi_attribute	17, 2	@ Tag_ABI_PCS_GOT_use
	.eabi_attribute	20, 1	@ Tag_ABI_FP_denormal
	.eabi_attribute	21, 1	@ Tag_ABI_FP_exceptions
	.eabi_attribute	23, 3	@ Tag_ABI_FP_number_model
	.eabi_attribute	24, 1	@ Tag_ABI_align_needed
	.eabi_attribute	25, 1	@ Tag_ABI_align_preserved
	.eabi_attribute	38, 1	@ Tag_ABI_FP_16bit_format
	.eabi_attribute	14, 0	@ Tag_ABI_PCS_R9_use
	.file	"mfcc"
	.globl	mfcc_Filter             @ -- Begin function mfcc_Filter
	.p2align	2
	.type	mfcc_Filter,%function
	.code	16                      @ @mfcc_Filter
	.thumb_func
mfcc_Filter:
	.fnstart
@ %bb.0:                                @ %entry
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.pad	#4
	sub	sp, #4
	.vsave	{d8, d9}
	vpush	{d8, d9}
	.pad	#6144
	sub.w	sp, sp, #6144
	.pad	#16
	sub	sp, #16
	str	r2, [sp, #8]            @ 4-byte Spill
	mov	r5, r1
	mov.w	r2, #2048
	ldr	r1, .LCPI0_16
.LPC0_0:
	add	r1, pc
	str	r0, [r1]
	ldr	r6, .LCPI0_17
.LPC0_1:
	add	r6, pc
	mov	r0, r6
	mov	r1, r6
	bl	memmove
	mov	r0, r6
	mov	r1, r5
	mov.w	r2, #2048
	bl	memcpy
	ldr	r5, .LCPI0_18
	mov	r1, r6
	mov.w	r2, #2048
.LPC0_2:
	add	r5, pc
	mov	r0, r5
	bl	memcpy
	ldr	r2, .LCPI0_19
	ldr	r1, .LCPI0_20
	movs	r0, #0
.LPC0_3:
	add	r2, pc
.LPC0_4:
	add	r1, pc
	b	.LBB0_6
	.p2align	2
@ %bb.1:
.LCPI0_16:
	.long	mfcc_context-(.LPC0_0+4)
	.p2align	2
@ %bb.2:
.LCPI0_17:
	.long	g_0-(.LPC0_1+4)
	.p2align	2
@ %bb.3:
.LCPI0_18:
	.long	g_1-(.LPC0_2+4)
	.p2align	2
@ %bb.4:
.LCPI0_19:
	.long	c_0-(.LPC0_3+4)
	.p2align	2
@ %bb.5:
.LCPI0_20:
	.long	g_2-(.LPC0_4+4)
.LBB0_6:                                @ %loop.body.i9
                                        @ =>This Inner Loop Header: Depth=1
	adds	r3, r5, r0
	adds	r7, r2, r0
	adds	r6, r1, r0
	adds	r0, #64
	vldr	s0, [r7]
	vldr	s1, [r3]
	vldr	s2, [r7, #4]
	vldr	s3, [r3, #4]
	vldr	s4, [r7, #8]
	vldr	s5, [r3, #8]
	vldr	s6, [r7, #12]
	vldr	s7, [r3, #12]
	vldr	s8, [r7, #16]
	vldr	s9, [r3, #16]
	vldr	s10, [r7, #20]
	vldr	s11, [r3, #20]
	vldr	s12, [r7, #24]
	vldr	s13, [r3, #24]
	vldr	s14, [r7, #28]
	vldr	s15, [r3, #28]
	vldr	s16, [r7, #32]
	vldr	s18, [r3, #32]
	cmp.w	r0, #2048
	vmul.f32	s0, s1, s0
	vmul.f32	s2, s3, s2
	vmul.f32	s4, s5, s4
	vmul.f32	s6, s7, s6
	vmul.f32	s8, s9, s8
	vmul.f32	s10, s11, s10
	vmul.f32	s12, s13, s12
	vmul.f32	s14, s15, s14
	vmul.f32	s1, s18, s16
	vstr	s0, [r6]
	vstr	s2, [r6, #4]
	vldr	s0, [r7, #36]
	vldr	s2, [r3, #36]
	vstr	s4, [r6, #8]
	vstr	s6, [r6, #12]
	vstr	s8, [r6, #16]
	vstr	s10, [r6, #20]
	vstr	s12, [r6, #24]
	vstr	s14, [r6, #28]
	vstr	s1, [r6, #32]
	vmul.f32	s0, s2, s0
	vldr	s2, [r3, #40]
	vstr	s0, [r6, #36]
	vldr	s0, [r7, #40]
	vmul.f32	s0, s2, s0
	vldr	s2, [r3, #44]
	vstr	s0, [r6, #40]
	vldr	s0, [r7, #44]
	vmul.f32	s0, s2, s0
	vldr	s2, [r3, #48]
	vstr	s0, [r6, #44]
	vldr	s0, [r7, #48]
	vmul.f32	s0, s2, s0
	vldr	s2, [r3, #52]
	vstr	s0, [r6, #48]
	vldr	s0, [r7, #52]
	vmul.f32	s0, s2, s0
	vldr	s2, [r3, #56]
	vstr	s0, [r6, #52]
	vldr	s0, [r7, #56]
	vmul.f32	s0, s2, s0
	vldr	s2, [r3, #60]
	vstr	s0, [r6, #56]
	vldr	s0, [r7, #60]
	vmul.f32	s0, s2, s0
	vstr	s0, [r6, #60]
	bne.w	.LBB0_6
@ %bb.7:                                @ %_Node__BinaryOperationNode_float__in_512_512_out_512_Node_1148.exit
	add.w	r0, r1, #60
	movs	r1, #0
	add.w	r11, sp, #2064
	movs	r2, #0
.LBB0_8:                                @ %loop.body.i6
                                        @ =>This Inner Loop Header: Depth=1
	ldr	r3, [r0, #-60]
	ldr	r7, [r0, #-56]
	str.w	r3, [r11, r2]
	add.w	r3, r11, r2
	adds	r2, #128
	str	r1, [r3, #4]
	strd	r7, r1, [r3, #8]
	cmp.w	r2, #4096
	ldr	r7, [r0, #-52]
	strd	r7, r1, [r3, #16]
	ldr	r7, [r0, #-48]
	strd	r7, r1, [r3, #24]
	ldr	r7, [r0, #-44]
	strd	r7, r1, [r3, #32]
	ldr	r7, [r0, #-40]
	strd	r7, r1, [r3, #40]
	ldr	r7, [r0, #-36]
	strd	r7, r1, [r3, #48]
	ldr	r7, [r0, #-32]
	strd	r7, r1, [r3, #56]
	ldr	r7, [r0, #-28]
	strd	r7, r1, [r3, #64]
	ldr	r7, [r0, #-24]
	strd	r7, r1, [r3, #72]
	ldr	r7, [r0, #-20]
	strd	r7, r1, [r3, #80]
	ldr	r7, [r0, #-16]
	strd	r7, r1, [r3, #88]
	ldr	r7, [r0, #-12]
	strd	r7, r1, [r3, #96]
	ldr	r7, [r0, #-8]
	strd	r7, r1, [r3, #104]
	ldr	r7, [r0, #-4]
	strd	r7, r1, [r3, #112]
	ldr	r7, [r0]
	add.w	r0, r0, #64
	strd	r7, r1, [r3, #120]
	bne	.LBB0_8
@ %bb.9:                                @ %loop.after.i
	movs	r1, #0
	movs	r2, #60
	add	r4, sp, #16
.LBB0_10:                               @ %loop.body.i.i
                                        @ =>This Inner Loop Header: Depth=1
	add.w	r3, r11, r2
	add.w	r7, r11, r1, lsl #1
	ldr	r3, [r3, #-60]
	ldrd	r6, r5, [r7, #4]
	ldr	r0, [r7, #12]
	add.w	r12, r7, #32
	str.w	r3, [r11, r1]
	add.w	r3, r11, r1
	str	r0, [sp, #12]           @ 4-byte Spill
	str	r5, [r4, r1]
	str	r6, [r3, #4]
	adds	r6, r4, r1
	adds	r1, #32
	ldrd	r5, r0, [r7, #16]
	ldrd	lr, r10, [r7, #24]
	cmp.w	r1, #2048
	strd	r5, r0, [r3, #8]
	ldm.w	r12, {r0, r5, r12}
	ldr.w	r8, [r7, #44]
	strd	r0, r5, [r3, #16]
	ldr.w	r0, [r11, r2]
	ldrd	r5, r9, [r7, #48]
	ldr	r7, [r7, #56]
	add.w	r2, r2, #64
	strd	r5, r9, [r3, #24]
	ldr	r3, [sp, #12]           @ 4-byte Reload
	strd	r3, lr, [r6, #4]
	strd	r10, r12, [r6, #12]
	strd	r8, r7, [r6, #20]
	str	r0, [r6, #28]
	bne	.LBB0_10
@ %bb.11:                               @ %loop.init1.i.i
	movs	r1, #0
.LBB0_12:                               @ %loop.body3.i.i
                                        @ =>This Inner Loop Header: Depth=1
	adds	r3, r4, r1
	ldr.w	lr, [r4, r1]
	add.w	r2, r11, r1
	adds	r1, #64
	add.w	r10, r3, #20
	ldrd	r7, r6, [r3, #4]
	ldrd	r5, r12, [r3, #12]
	cmp.w	r1, #2048
	ldm.w	r10, {r0, r8, r9, r10}
	str.w	lr, [r2, #2048]
	str.w	r7, [r2, #2052]
	str.w	r6, [r2, #2056]
	str.w	r5, [r2, #2060]
	str.w	r12, [r2, #2064]
	str.w	r0, [r2, #2068]
	str.w	r8, [r2, #2072]
	str.w	r9, [r2, #2076]
	ldrd	r0, r7, [r3, #36]
	ldrd	r6, r5, [r3, #44]
	ldrd	r12, lr, [r3, #52]
	ldr	r3, [r3, #60]
	str.w	r10, [r2, #2080]
	str.w	r0, [r2, #2084]
	add.w	r0, r2, #2096
	str.w	r7, [r2, #2088]
	str.w	r6, [r2, #2092]
	stm.w	r0, {r5, r12, lr}
	str.w	r3, [r2, #2108]
	bne	.LBB0_12
@ %bb.13:                               @ %loop.after5.i.i
	add	r6, sp, #16
	mov	r0, r11
	mov	r1, r6
	bl	FFTC_float_256
	add.w	r0, r11, #2048
	mov	r1, r6
	bl	FFTC_float_256
	ldr	r1, .LCPI0_21
	movs	r0, #0
.LPC0_5:
	add	r1, pc
	mov	r12, r1
	b	.LBB0_15
	.p2align	2
@ %bb.14:
.LCPI0_21:
	.long	twiddles_256-(.LPC0_5+4)
.LBB0_15:                               @ %loop.body8.i.i
                                        @ =>This Inner Loop Header: Depth=1
	add.w	r2, r11, r0
	mov	r1, r12
	adds	r3, r1, r0
	add.w	r5, r2, #2048
	addw	r7, r2, #2052
	vldr	s14, [r2]
	addw	r1, r2, #2056
	addw	r6, r2, #2060
	vldr	s1, [r2, #4]
	vldr	s3, [r2, #8]
	vldr	s5, [r2, #12]
	addw	r4, r2, #2068
	adds	r0, #32
	vldr	s0, [r3]
	vldr	s8, [r5]
	vldr	s2, [r3, #4]
	vldr	s10, [r7]
	vldr	s4, [r3, #8]
	vldr	s9, [r1]
	vldr	s6, [r3, #12]
	vldr	s11, [r6]
	vldr	s13, [r3, #16]
	vldr	s15, [r3, #20]
	cmp.w	r0, #2048
	vmul.f32	s12, s0, s8
	vmul.f32	s0, s0, s10
	vmls.f32	s12, s2, s10
	vmla.f32	s0, s2, s8
	vsub.f32	s7, s14, s12
	vmul.f32	s10, s4, s9
	vmul.f32	s4, s4, s11
	vadd.f32	s8, s14, s12
	vadd.f32	s12, s1, s0
	vsub.f32	s0, s1, s0
	vstr	s7, [r5]
	add.w	r5, r2, #2064
	vmls.f32	s10, s6, s11
	vmla.f32	s4, s6, s9
	vldr	s7, [r5]
	vldr	s16, [r4]
	vadd.f32	s14, s3, s10
	vsub.f32	s10, s3, s10
	vldr	s2, [r2, #16]
	vldr	s3, [r2, #20]
	vadd.f32	s1, s5, s4
	vstr	s8, [r2]
	vstr	s12, [r2, #4]
	vstr	s0, [r7]
	vsub.f32	s4, s5, s4
	addw	r7, r2, #2072
	vstr	s14, [r2, #8]
	vstr	s1, [r2, #12]
	vstr	s10, [r1]
	vstr	s4, [r6]
	addw	r1, r2, #2076
	vmul.f32	s18, s13, s7
	vmul.f32	s6, s13, s16
	vmls.f32	s18, s15, s16
	vmla.f32	s6, s15, s7
	vadd.f32	s5, s2, s18
	vadd.f32	s0, s3, s6
	vsub.f32	s2, s2, s18
	vstr	s5, [r2, #16]
	vstr	s0, [r2, #20]
	vsub.f32	s0, s3, s6
	vstr	s2, [r5]
	vldr	s6, [r3, #28]
	vstr	s0, [r4]
	vldr	s0, [r3, #24]
	vldr	s2, [r7]
	vldr	s4, [r1]
	vldr	s8, [r2, #24]
	vldr	s10, [r2, #28]
	vmul.f32	s12, s0, s2
	vmul.f32	s0, s0, s4
	vmls.f32	s12, s6, s4
	vmla.f32	s0, s6, s2
	vadd.f32	s2, s8, s12
	vadd.f32	s4, s10, s0
	vsub.f32	s0, s10, s0
	vstr	s2, [r2, #24]
	vsub.f32	s2, s8, s12
	vstr	s4, [r2, #28]
	vstr	s2, [r7]
	vstr	s0, [r1]
	bne.w	.LBB0_15
@ %bb.16:                               @ %loop.body3.i7.preheader
	ldr	r0, .LCPI0_22
	movs	r2, #0
.LPC0_6:
	add	r0, pc
	mov	lr, r0
	add.w	r1, r0, #28
.LBB0_17:                               @ %loop.body3.i7
                                        @ =>This Inner Loop Header: Depth=1
	add.w	r3, r11, r2
	adds	r2, #64
	vldr	s2, [r3, #4]
	vldr	s0, [r3]
	cmp.w	r2, #2048
	vmul.f32	s2, s2, s2
	vmla.f32	s2, s0, s0
	vsqrt.f32	s0, s2
	vldr	s2, [r3, #12]
	vstr	s0, [r1, #-28]
	vldr	s0, [r3, #8]
	vmul.f32	s2, s2, s2
	vmla.f32	s2, s0, s0
	vsqrt.f32	s0, s2
	vldr	s2, [r3, #20]
	vstr	s0, [r1, #-24]
	vldr	s0, [r3, #16]
	vmul.f32	s2, s2, s2
	vmla.f32	s2, s0, s0
	vsqrt.f32	s0, s2
	vldr	s2, [r3, #28]
	vstr	s0, [r1, #-20]
	vldr	s0, [r3, #24]
	vmul.f32	s2, s2, s2
	vmla.f32	s2, s0, s0
	vsqrt.f32	s0, s2
	vldr	s2, [r3, #36]
	vstr	s0, [r1, #-16]
	vldr	s0, [r3, #32]
	vmul.f32	s2, s2, s2
	vmla.f32	s2, s0, s0
	vsqrt.f32	s0, s2
	vldr	s2, [r3, #44]
	vstr	s0, [r1, #-12]
	vldr	s0, [r3, #40]
	vmul.f32	s2, s2, s2
	vmla.f32	s2, s0, s0
	vsqrt.f32	s0, s2
	vldr	s2, [r3, #52]
	vstr	s0, [r1, #-8]
	vldr	s0, [r3, #48]
	vmul.f32	s2, s2, s2
	vmla.f32	s2, s0, s0
	vsqrt.f32	s0, s2
	vldr	s2, [r3, #60]
	vstr	s0, [r1, #-4]
	vldr	s0, [r3, #56]
	vmul.f32	s2, s2, s2
	vmla.f32	s2, s0, s0
	vsqrt.f32	s0, s2
	vstr	s0, [r1]
	add.w	r1, r1, #32
	bne	.LBB0_17
@ %bb.18:                               @ %_Node__FFTNode_float__in_512_out_256.exit
	ldr	r0, .LCPI0_23
	vldr	s0, .LCPI0_24
	movs	r1, #0
	vmov.f32	s2, #5.000000e-01
	vmov.f32	s4, #1.500000e+00
	vmov.f32	s6, #2.500000e+00
	vmov.f32	s8, #-5.000000e-01
.LPC0_7:
	add	r0, pc
	mov	r8, r0
	ldr	r0, .LCPI0_25
.LPC0_8:
	add	r0, pc
	mov	r9, r0
	ldr	r0, .LCPI0_26
.LPC0_9:
	add	r0, pc
	mov	r10, r0
.LBB0_19:                               @ %loop.body.i5
                                        @ =>This Loop Header: Depth=1
                                        @     Child Loop BB0_26 Depth 2
                                        @     Child Loop BB0_40 Depth 2
	mov	r0, r8
	vmov.f32	s10, s0
	ldr.w	r12, [r0, r1, lsl #2]
	mov	r0, r9
	ldr.w	r6, [r0, r1, lsl #2]
	mov	r0, r10
	ldr.w	r2, [r0, r1, lsl #2]
	cmp	r6, r2
	ble	.LBB0_27
@ %bb.20:                               @ %loop.body3.lr.ph.i
                                        @   in Loop: Header=BB0_19 Depth=1
	subs	r5, r6, r2
	subs	r3, r6, #1
	mov	r4, r2
	vmov	s10, r5
	subs	r3, r3, r2
	ands	r5, r5, #3
	vcvt.f32.s32	s12, s10
	vmov.f32	s10, s0
	beq	.LBB0_24
@ %bb.21:                               @ %loop.body3.i.prol
                                        @   in Loop: Header=BB0_19 Depth=1
	mov	r7, lr
	vdiv.f32	s1, s2, s12
	vmov.f32	s10, s0
	cmp	r5, #1
	add.w	r4, r7, r2, lsl #2
	vldr	s14, [r4]
	add.w	r4, r2, #1
	vmla.f32	s10, s14, s1
	beq	.LBB0_24
@ %bb.22:                               @ %loop.body3.i.prol.1
                                        @   in Loop: Header=BB0_19 Depth=1
	add.w	r0, r7, r4, lsl #2
	vdiv.f32	s1, s4, s12
	adds	r4, r2, #2
	cmp	r5, #2
	vldr	s14, [r0]
	vmla.f32	s10, s14, s1
	beq	.LBB0_24
@ %bb.23:                               @ %loop.body3.i.prol.2
                                        @   in Loop: Header=BB0_19 Depth=1
	add.w	r0, r7, r4, lsl #2
	vdiv.f32	s1, s6, s12
	adds	r4, r2, #3
	vldr	s14, [r0]
	vmla.f32	s10, s14, s1
.LBB0_24:                               @ %loop.body3.i.prol.loopexit
                                        @   in Loop: Header=BB0_19 Depth=1
	cmp	r3, #3
	blo	.LBB0_27
@ %bb.25:                               @ %loop.body3.lr.ph.i.new
                                        @   in Loop: Header=BB0_19 Depth=1
	mov	r0, lr
	rsbs	r2, r2, #0
	add.w	r3, r0, r4, lsl #2
	adds	r3, #8
.LBB0_26:                               @ %loop.body3.i
                                        @   Parent Loop BB0_19 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	adds	r5, r2, r4
	adds	r4, #4
	vmov	s14, r5
	adds	r0, r5, #3
	adds	r7, r5, #2
	adds	r5, #1
	cmp	r6, r4
	vcvt.f32.s32	s14, s14
	vmov	s1, r5
	vmov	s3, r7
	vmov	s13, r0
	vcvt.f32.s32	s1, s1
	vadd.f32	s14, s14, s2
	vldr	s5, [r3, #-8]
	vldr	s7, [r3, #-4]
	vldr	s9, [r3]
	vldr	s11, [r3, #4]
	vcvt.f32.s32	s3, s3
	vcvt.f32.s32	s13, s13
	add.w	r3, r3, #16
	vdiv.f32	s14, s14, s12
	vadd.f32	s1, s1, s2
	vadd.f32	s3, s3, s2
	vmla.f32	s10, s5, s14
	vdiv.f32	s14, s1, s12
	vadd.f32	s1, s13, s2
	vdiv.f32	s3, s3, s12
	vmla.f32	s10, s7, s14
	vdiv.f32	s14, s1, s12
	vmla.f32	s10, s9, s3
	vmla.f32	s10, s11, s14
	bne	.LBB0_26
.LBB0_27:                               @ %loop.init6.i
                                        @   in Loop: Header=BB0_19 Depth=1
	cmp	r12, r6
	ble.w	.LBB0_41
@ %bb.28:                               @ %loop.body8.lr.ph.i
                                        @   in Loop: Header=BB0_19 Depth=1
	sub.w	r3, r12, r6
	sub.w	r0, r12, #1
	vmov	s12, r3
	subs	r2, r0, r6
	ands	r4, r3, #3
	vcvt.f32.s32	s12, s12
	beq	.LBB0_37
@ %bb.29:                               @ %loop.body8.i.prol
                                        @   in Loop: Header=BB0_19 Depth=1
	vmov	s14, r3
	mov	r5, lr
	adds	r3, r6, #1
	cmp	r4, #1
	vcvt.f32.s32	s14, s14
	add.w	r0, r5, r6, lsl #2
	vadd.f32	s14, s14, s8
	vldr	s1, [r0]
	vdiv.f32	s14, s14, s12
	vmla.f32	s10, s1, s14
	beq	.LBB0_38
@ %bb.30:                               @ %loop.body8.i.prol.1
                                        @   in Loop: Header=BB0_19 Depth=1
	sub.w	r0, r12, r3
	cmp	r4, #2
	vmov	s14, r0
	add.w	r0, r5, r3, lsl #2
	add.w	r3, r6, #2
	vcvt.f32.s32	s14, s14
	vldr	s1, [r0]
	vadd.f32	s14, s14, s8
	vdiv.f32	s14, s14, s12
	vmla.f32	s10, s1, s14
	beq	.LBB0_38
@ %bb.31:                               @ %loop.body8.i.prol.2
                                        @   in Loop: Header=BB0_19 Depth=1
	sub.w	r0, r12, r3
	vmov	s14, r0
	add.w	r0, r5, r3, lsl #2
	adds	r3, r6, #3
	vcvt.f32.s32	s14, s14
	vldr	s1, [r0]
	vadd.f32	s14, s14, s8
	vdiv.f32	s14, s14, s12
	vmla.f32	s10, s1, s14
	cmp	r2, #3
	bhs	.LBB0_39
	b	.LBB0_41
	.p2align	2
@ %bb.32:
.LCPI0_22:
	.long	g_3-(.LPC0_6+4)
	.p2align	2
@ %bb.33:
.LCPI0_23:
	.long	filterEnd_Node_1150-(.LPC0_7+4)
	.p2align	2
@ %bb.34:
.LCPI0_24:
	.long	0                       @ float 0
	.p2align	2
@ %bb.35:
.LCPI0_25:
	.long	filterCenter_Node_1150-(.LPC0_8+4)
	.p2align	2
@ %bb.36:
.LCPI0_26:
	.long	filterStart_Node_1150-(.LPC0_9+4)
.LBB0_37:                               @   in Loop: Header=BB0_19 Depth=1
	mov	r3, r6
.LBB0_38:                               @ %loop.body8.i.prol.loopexit
                                        @   in Loop: Header=BB0_19 Depth=1
	cmp	r2, #3
	blo	.LBB0_41
.LBB0_39:                               @ %loop.body8.lr.ph.i.new
                                        @   in Loop: Header=BB0_19 Depth=1
	mov	r0, lr
	sub.w	r2, r12, r3
	add.w	r0, r0, r3, lsl #2
	add.w	r3, r0, #8
.LBB0_40:                               @ %loop.body8.i
                                        @   Parent Loop BB0_19 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	vmov	s14, r2
	subs	r6, r2, #1
	subs	r7, r2, #2
	subs	r0, r2, #3
	subs	r2, #4
	vcvt.f32.s32	s14, s14
	vmov	s1, r6
	vmov	s3, r7
	vmov	s13, r0
	vcvt.f32.s32	s1, s1
	vadd.f32	s14, s14, s8
	vldr	s5, [r3, #-8]
	vldr	s7, [r3, #-4]
	vldr	s9, [r3]
	vldr	s11, [r3, #4]
	vcvt.f32.s32	s3, s3
	vcvt.f32.s32	s13, s13
	add.w	r3, r3, #16
	vdiv.f32	s14, s14, s12
	vadd.f32	s1, s1, s8
	vadd.f32	s3, s3, s8
	vmla.f32	s10, s5, s14
	vdiv.f32	s14, s1, s12
	vadd.f32	s1, s13, s8
	vdiv.f32	s3, s3, s12
	vmla.f32	s10, s7, s14
	vdiv.f32	s14, s1, s12
	vmla.f32	s10, s9, s3
	vmla.f32	s10, s11, s14
	bne	.LBB0_40
.LBB0_41:                               @ %loop.after10.i
                                        @   in Loop: Header=BB0_19 Depth=1
	ldr	r4, .LCPI0_11
.LPC0_10:
	add	r4, pc
	add.w	r0, r4, r1, lsl #2
	adds	r1, #1
	cmp	r1, #80
	vstr	s10, [r0]
	bne.w	.LBB0_19
@ %bb.42:                               @ %loop.body.i4.preheader
	ldr	r1, .LCPI0_12
	ldr	r5, .LCPI0_13
	movs	r0, #0
.LPC0_11:
	add	r1, pc
.LPC0_12:
	add	r5, pc
.LBB0_43:                               @ %loop.body.i4
                                        @ =>This Inner Loop Header: Depth=1
	adds	r2, r4, r0
	adds	r3, r1, r0
	adds	r7, r5, r0
	adds	r0, #64
	vldr	s0, [r3]
	vldr	s1, [r2]
	vldr	s2, [r3, #4]
	vldr	s3, [r2, #4]
	vldr	s4, [r3, #8]
	vldr	s5, [r2, #8]
	vldr	s6, [r3, #12]
	vldr	s7, [r2, #12]
	vldr	s8, [r3, #16]
	vldr	s9, [r2, #16]
	vldr	s10, [r3, #20]
	vldr	s11, [r2, #20]
	vldr	s12, [r3, #24]
	vldr	s13, [r2, #24]
	vldr	s14, [r3, #28]
	vldr	s15, [r2, #28]
	vldr	s16, [r3, #32]
	vldr	s18, [r2, #32]
	cmp.w	r0, #320
	vadd.f32	s0, s1, s0
	vadd.f32	s2, s3, s2
	vadd.f32	s4, s5, s4
	vadd.f32	s6, s7, s6
	vadd.f32	s8, s9, s8
	vadd.f32	s10, s11, s10
	vadd.f32	s12, s13, s12
	vadd.f32	s14, s15, s14
	vadd.f32	s1, s18, s16
	vstr	s0, [r7]
	vstr	s2, [r7, #4]
	vldr	s0, [r3, #36]
	vldr	s2, [r2, #36]
	vstr	s4, [r7, #8]
	vstr	s6, [r7, #12]
	vstr	s8, [r7, #16]
	vstr	s10, [r7, #20]
	vstr	s12, [r7, #24]
	vstr	s14, [r7, #28]
	vstr	s1, [r7, #32]
	vadd.f32	s0, s2, s0
	vldr	s2, [r2, #40]
	vstr	s0, [r7, #36]
	vldr	s0, [r3, #40]
	vadd.f32	s0, s2, s0
	vldr	s2, [r2, #44]
	vstr	s0, [r7, #40]
	vldr	s0, [r3, #44]
	vadd.f32	s0, s2, s0
	vldr	s2, [r2, #48]
	vstr	s0, [r7, #44]
	vldr	s0, [r3, #48]
	vadd.f32	s0, s2, s0
	vldr	s2, [r2, #52]
	vstr	s0, [r7, #48]
	vldr	s0, [r3, #52]
	vadd.f32	s0, s2, s0
	vldr	s2, [r2, #56]
	vstr	s0, [r7, #52]
	vldr	s0, [r3, #56]
	vadd.f32	s0, s2, s0
	vldr	s2, [r2, #60]
	vstr	s0, [r7, #56]
	vldr	s0, [r3, #60]
	vadd.f32	s0, s2, s0
	vstr	s0, [r7, #60]
	bne.w	.LBB0_43
@ %bb.44:                               @ %loop.body.i.preheader
	ldr	r0, .LCPI0_14
	movs	r4, #0
.LPC0_13:
	add	r0, pc
	mov	r11, r0
.LBB0_45:                               @ %loop.body.i
                                        @ =>This Inner Loop Header: Depth=1
	ldr	r0, [r5, r4]
	bl	logf
	mov	r1, r11
	adds	r6, r5, r4
	mov	r8, r5
	str	r0, [r1, r4]
	ldr	r0, [r6, #4]
	adds	r7, r1, r4
	ldrd	r5, r10, [r6, #8]
	ldr.w	r9, [r6, #16]
	bl	logf
	str	r0, [r7, #4]
	mov	r0, r5
	mov	r5, r8
	bl	logf
	str	r0, [r7, #8]
	mov	r0, r10
	bl	logf
	str	r0, [r7, #12]
	mov	r0, r9
	bl	logf
	str	r0, [r7, #16]
	ldr	r0, [r6, #20]
	bl	logf
	str	r0, [r7, #20]
	ldr	r0, [r6, #24]
	bl	logf
	str	r0, [r7, #24]
	ldr	r0, [r6, #28]
	bl	logf
	str	r0, [r7, #28]
	ldr	r0, [r6, #32]
	bl	logf
	str	r0, [r7, #32]
	ldr	r0, [r6, #36]
	bl	logf
	str	r0, [r7, #36]
	ldr	r0, [r6, #40]
	bl	logf
	str	r0, [r7, #40]
	ldr	r0, [r6, #44]
	bl	logf
	str	r0, [r7, #44]
	ldr	r0, [r6, #48]
	bl	logf
	str	r0, [r7, #48]
	ldr	r0, [r6, #52]
	bl	logf
	str	r0, [r7, #52]
	ldr	r0, [r6, #56]
	bl	logf
	str	r0, [r7, #56]
	ldr	r0, [r6, #60]
	bl	logf
	str	r0, [r7, #60]
	ldr	r0, [r6, #64]
	bl	logf
	str	r0, [r7, #64]
	ldr	r0, [r6, #68]
	bl	logf
	str	r0, [r7, #68]
	ldr	r0, [r6, #72]
	bl	logf
	str	r0, [r7, #72]
	ldr	r0, [r6, #76]
	bl	logf
	adds	r4, #80
	str	r0, [r7, #76]
	cmp.w	r4, #320
	bne	.LBB0_45
@ %bb.46:                               @ %_Node__UnaryOperationNode_float__in_80_out_80_Node_1153.exit
	ldr	r0, [sp, #8]            @ 4-byte Reload
	cbz	r0, .LBB0_48
@ %bb.47:                               @ %loop.init
	ldr	r1, .LCPI0_15
	mov.w	r2, #320
.LPC0_14:
	add	r1, pc
	add.w	sp, sp, #6144
	add	sp, #16
	vpop	{d8, d9}
	add	sp, #4
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	b	memcpy
.LBB0_48:                               @ %if.after
	add.w	sp, sp, #6144
	add	sp, #16
	vpop	{d8, d9}
	add	sp, #4
	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
	.p2align	2
@ %bb.49:
.LCPI0_11:
	.long	g_4-(.LPC0_10+4)
.LCPI0_12:
	.long	c_1-(.LPC0_11+4)
.LCPI0_13:
	.long	g_5-(.LPC0_12+4)
.LCPI0_14:
	.long	g_6-(.LPC0_13+4)
.LCPI0_15:
	.long	g_6-(.LPC0_14+4)
.Lfunc_end0:
	.size	mfcc_Filter, .Lfunc_end0-mfcc_Filter
	.cantunwind
	.fnend
                                        @ -- End function
	.p2align	2               @ -- Begin function FFTC_float_256
	.type	FFTC_float_256,%function
	.code	16                      @ @FFTC_float_256
	.thumb_func
FFTC_float_256:
	.fnstart
@ %bb.0:                                @ %entry
	.save	{r4, r5, r6, r7, r8, lr}
	push.w	{r4, r5, r6, r7, r8, lr}
	.vsave	{d8}
	vpush	{d8}
	mov	r8, r1
	mov	r4, r0
	movs	r0, #0
	movs	r1, #60
.LBB1_1:                                @ %loop.body
                                        @ =>This Inner Loop Header: Depth=1
	add.w	r2, r4, r0, lsl #1
	adds	r6, r4, r1
	ldr	r3, [r2, #8]
	ldr	r5, [r2, #12]
	str.w	r3, [r8, r0]
	add.w	r3, r8, r0
	str	r5, [r3, #4]
	ldr	r6, [r6, #-60]
	ldr	r5, [r2, #4]
	str	r6, [r4, r0]
	adds	r6, r4, r0
	adds	r0, #32
	str	r5, [r6, #4]
	cmp.w	r0, #1024
	ldr	r5, [r2, #24]
	ldr	r7, [r2, #28]
	str	r7, [r3, #12]
	str	r5, [r3, #8]
	ldr	r7, [r2, #16]
	ldr	r5, [r2, #20]
	str	r5, [r6, #12]
	str	r7, [r6, #8]
	ldr	r7, [r2, #40]
	ldr	r5, [r2, #44]
	str	r5, [r3, #20]
	str	r7, [r3, #16]
	ldr	r7, [r2, #32]
	ldr	r5, [r2, #36]
	str	r5, [r6, #20]
	str	r7, [r6, #16]
	ldr	r5, [r4, r1]
	ldr	r7, [r2, #56]
	add.w	r1, r1, #64
	str	r5, [r3, #28]
	str	r7, [r3, #24]
	ldr	r3, [r2, #48]
	ldr	r2, [r2, #52]
	str	r2, [r6, #28]
	str	r3, [r6, #24]
	bne	.LBB1_1
@ %bb.2:                                @ %loop.body3.preheader
	movs	r0, #0
.LBB1_3:                                @ %loop.body3
                                        @ =>This Inner Loop Header: Depth=1
	add.w	r1, r8, r0
	ldr.w	r3, [r8, r0]
	adds	r7, r4, r0
	adds	r0, #64
	ldr	r2, [r1, #4]
	cmp.w	r0, #1024
	str.w	r3, [r7, #1024]
	str.w	r2, [r7, #1028]
	ldr	r2, [r1, #8]
	ldr	r3, [r1, #12]
	str.w	r3, [r7, #1036]
	str.w	r2, [r7, #1032]
	ldr	r2, [r1, #16]
	ldr	r3, [r1, #20]
	str.w	r3, [r7, #1044]
	str.w	r2, [r7, #1040]
	ldr	r2, [r1, #24]
	ldr	r3, [r1, #28]
	str.w	r3, [r7, #1052]
	str.w	r2, [r7, #1048]
	ldr	r2, [r1, #32]
	ldr	r3, [r1, #36]
	str.w	r3, [r7, #1060]
	str.w	r2, [r7, #1056]
	ldr	r2, [r1, #40]
	ldr	r3, [r1, #44]
	str.w	r3, [r7, #1068]
	str.w	r2, [r7, #1064]
	ldr	r2, [r1, #48]
	ldr	r3, [r1, #52]
	str.w	r3, [r7, #1076]
	str.w	r2, [r7, #1072]
	ldr	r2, [r1, #56]
	ldr	r1, [r1, #60]
	str.w	r1, [r7, #1084]
	str.w	r2, [r7, #1080]
	bne	.LBB1_3
@ %bb.4:                                @ %loop.after5
	mov	r0, r4
	mov	r1, r8
	bl	FFTC_float_128
	add.w	r0, r4, #1024
	mov	r1, r8
	bl	FFTC_float_128
	ldr	r1, .LCPI1_0
	movs	r0, #0
.LPC1_0:
	add	r1, pc
	mov	r12, r1
.LBB1_5:                                @ %loop.body8
                                        @ =>This Inner Loop Header: Depth=1
	adds	r2, r4, r0
	mov	r1, r12
	adds	r3, r1, r0
	ldr.w	r1, [r2, #1028]
	ldr.w	r7, [r2, #1024]
	ldr.w	r6, [r2, #1044]
	ldr.w	r5, [r2, #1040]
	vldr	s0, [r3]
	vldr	s2, [r3, #4]
	vldr	s4, [r3, #8]
	vldr	s6, [r3, #12]
	vldr	s9, [r3, #16]
	vldr	s11, [r3, #20]
	vmov	s10, r1
	ldr.w	r1, [r2, #1032]
	vmov	s8, r7
	ldr	r7, [r4, r0]
	vmov	s3, r5
	vmov	s5, r6
	ldr	r6, [r2, #12]
	ldr	r5, [r2, #16]
	vmul.f32	s14, s0, s8
	vmul.f32	s0, s0, s10
	vmul.f32	s15, s9, s3
	vmul.f32	s9, s9, s5
	vmov	s12, r1
	ldr.w	r1, [r2, #1036]
	vmov	s7, r7
	vmls.f32	s14, s2, s10
	vmla.f32	s0, s2, s8
	ldr	r7, [r2, #8]
	vmov	s8, r6
	vmla.f32	s9, s11, s3
	vmls.f32	s15, s11, s5
	vmov	s1, r1
	ldr	r1, [r2, #4]
	vmul.f32	s10, s4, s12
	vadd.f32	s16, s7, s14
	vsub.f32	s14, s7, s14
	vmov	s2, r7
	vmul.f32	s4, s4, s1
	vmls.f32	s10, s6, s1
	vmov	s13, r1
	ldr	r1, [r2, #20]
	vmla.f32	s4, s6, s12
	vmov	s6, r5
	vadd.f32	s3, s2, s10
	vsub.f32	s2, s2, s10
	vadd.f32	s1, s13, s0
	vsub.f32	s0, s13, s0
	vadd.f32	s5, s8, s4
	vsub.f32	s4, s8, s4
	vadd.f32	s8, s6, s15
	vmov	s12, r1
	vmov	r1, s16
	str	r1, [r4, r0]
	vmov	r1, s1
	vadd.f32	s10, s12, s9
	adds	r0, #32
	str	r1, [r2, #4]
	vmov	r1, s14
	cmp.w	r0, #1024
	str.w	r1, [r2, #1024]
	vmov	r1, s0
	vsub.f32	s0, s6, s15
	str.w	r1, [r2, #1028]
	vmov	r1, s3
	str	r1, [r2, #8]
	vmov	r1, s5
	str	r1, [r2, #12]
	vmov	r1, s2
	vldr	s2, [r3, #28]
	str.w	r1, [r2, #1032]
	vmov	r1, s4
	str.w	r1, [r2, #1036]
	vmov	r1, s8
	str	r1, [r2, #16]
	vmov	r1, s10
	str	r1, [r2, #20]
	vmov	r1, s0
	vsub.f32	s0, s12, s9
	str.w	r1, [r2, #1040]
	vmov	r1, s0
	vldr	s0, [r3, #24]
	str.w	r1, [r2, #1044]
	ldr.w	r5, [r2, #1048]
	ldr.w	r6, [r2, #1052]
	ldr	r1, [r2, #24]
	ldr	r7, [r2, #28]
	vmov	s4, r5
	vmov	s6, r6
	vmov	s10, r1
	vmov	s12, r7
	vmul.f32	s8, s0, s4
	vmul.f32	s0, s0, s6
	vmls.f32	s8, s2, s6
	vmla.f32	s0, s2, s4
	vadd.f32	s6, s10, s8
	vadd.f32	s2, s12, s0
	vsub.f32	s0, s12, s0
	vmov	r1, s6
	str	r1, [r2, #24]
	vmov	r1, s2
	vsub.f32	s2, s10, s8
	str	r1, [r2, #28]
	vmov	r1, s2
	str.w	r1, [r2, #1048]
	vmov	r1, s0
	str.w	r1, [r2, #1052]
	bne.w	.LBB1_5
@ %bb.6:                                @ %loop.after10
	vpop	{d8}
	pop.w	{r4, r5, r6, r7, r8, pc}
	.p2align	2
@ %bb.7:
.LCPI1_0:
	.long	twiddles_128-(.LPC1_0+4)
.Lfunc_end1:
	.size	FFTC_float_256, .Lfunc_end1-FFTC_float_256
	.cantunwind
	.fnend
                                        @ -- End function
	.p2align	2               @ -- Begin function FFTC_float_128
	.type	FFTC_float_128,%function
	.code	16                      @ @FFTC_float_128
	.thumb_func
FFTC_float_128:
	.fnstart
@ %bb.0:                                @ %entry
	.save	{r4, r5, r6, r7, r8, lr}
	push.w	{r4, r5, r6, r7, r8, lr}
	.vsave	{d8}
	vpush	{d8}
	mov	r8, r1
	mov	r4, r0
	movs	r0, #0
	movs	r1, #60
.LBB2_1:                                @ %loop.body
                                        @ =>This Inner Loop Header: Depth=1
	add.w	r2, r4, r0, lsl #1
	adds	r6, r4, r1
	ldr	r3, [r2, #8]
	ldr	r5, [r2, #12]
	str.w	r3, [r8, r0]
	add.w	r3, r8, r0
	str	r5, [r3, #4]
	ldr	r6, [r6, #-60]
	ldr	r5, [r2, #4]
	str	r6, [r4, r0]
	adds	r6, r4, r0
	adds	r0, #32
	str	r5, [r6, #4]
	cmp.w	r0, #512
	ldr	r5, [r2, #24]
	ldr	r7, [r2, #28]
	str	r7, [r3, #12]
	str	r5, [r3, #8]
	ldr	r7, [r2, #16]
	ldr	r5, [r2, #20]
	str	r5, [r6, #12]
	str	r7, [r6, #8]
	ldr	r7, [r2, #40]
	ldr	r5, [r2, #44]
	str	r5, [r3, #20]
	str	r7, [r3, #16]
	ldr	r7, [r2, #32]
	ldr	r5, [r2, #36]
	str	r5, [r6, #20]
	str	r7, [r6, #16]
	ldr	r5, [r4, r1]
	ldr	r7, [r2, #56]
	add.w	r1, r1, #64
	str	r5, [r3, #28]
	str	r7, [r3, #24]
	ldr	r3, [r2, #48]
	ldr	r2, [r2, #52]
	str	r2, [r6, #28]
	str	r3, [r6, #24]
	bne	.LBB2_1
@ %bb.2:                                @ %loop.body3.preheader
	movs	r0, #0
.LBB2_3:                                @ %loop.body3
                                        @ =>This Inner Loop Header: Depth=1
	add.w	r1, r8, r0
	ldr.w	r3, [r8, r0]
	adds	r7, r4, r0
	adds	r0, #64
	ldr	r2, [r1, #4]
	cmp.w	r0, #512
	str.w	r3, [r7, #512]
	str.w	r2, [r7, #516]
	ldr	r2, [r1, #8]
	ldr	r3, [r1, #12]
	str.w	r3, [r7, #524]
	str.w	r2, [r7, #520]
	ldr	r2, [r1, #16]
	ldr	r3, [r1, #20]
	str.w	r3, [r7, #532]
	str.w	r2, [r7, #528]
	ldr	r2, [r1, #24]
	ldr	r3, [r1, #28]
	str.w	r3, [r7, #540]
	str.w	r2, [r7, #536]
	ldr	r2, [r1, #32]
	ldr	r3, [r1, #36]
	str.w	r3, [r7, #548]
	str.w	r2, [r7, #544]
	ldr	r2, [r1, #40]
	ldr	r3, [r1, #44]
	str.w	r3, [r7, #556]
	str.w	r2, [r7, #552]
	ldr	r2, [r1, #48]
	ldr	r3, [r1, #52]
	str.w	r3, [r7, #564]
	str.w	r2, [r7, #560]
	ldr	r2, [r1, #56]
	ldr	r1, [r1, #60]
	str.w	r1, [r7, #572]
	str.w	r2, [r7, #568]
	bne	.LBB2_3
@ %bb.4:                                @ %loop.after5
	mov	r0, r4
	mov	r1, r8
	bl	FFTC_float_64
	add.w	r0, r4, #512
	mov	r1, r8
	bl	FFTC_float_64
	ldr	r1, .LCPI2_0
	movs	r0, #0
.LPC2_0:
	add	r1, pc
	mov	r12, r1
.LBB2_5:                                @ %loop.body8
                                        @ =>This Inner Loop Header: Depth=1
	adds	r2, r4, r0
	mov	r1, r12
	adds	r3, r1, r0
	ldr.w	r1, [r2, #516]
	ldr.w	r7, [r2, #512]
	ldr.w	r6, [r2, #532]
	ldr.w	r5, [r2, #528]
	vldr	s0, [r3]
	vldr	s2, [r3, #4]
	vldr	s4, [r3, #8]
	vldr	s6, [r3, #12]
	vldr	s9, [r3, #16]
	vldr	s11, [r3, #20]
	vmov	s10, r1
	ldr.w	r1, [r2, #520]
	vmov	s8, r7
	ldr	r7, [r4, r0]
	vmov	s3, r5
	vmov	s5, r6
	ldr	r6, [r2, #12]
	ldr	r5, [r2, #16]
	vmul.f32	s14, s0, s8
	vmul.f32	s0, s0, s10
	vmul.f32	s15, s9, s3
	vmul.f32	s9, s9, s5
	vmov	s12, r1
	ldr.w	r1, [r2, #524]
	vmov	s7, r7
	vmls.f32	s14, s2, s10
	vmla.f32	s0, s2, s8
	ldr	r7, [r2, #8]
	vmov	s8, r6
	vmla.f32	s9, s11, s3
	vmls.f32	s15, s11, s5
	vmov	s1, r1
	ldr	r1, [r2, #4]
	vmul.f32	s10, s4, s12
	vadd.f32	s16, s7, s14
	vsub.f32	s14, s7, s14
	vmov	s2, r7
	vmul.f32	s4, s4, s1
	vmls.f32	s10, s6, s1
	vmov	s13, r1
	ldr	r1, [r2, #20]
	vmla.f32	s4, s6, s12
	vmov	s6, r5
	vadd.f32	s3, s2, s10
	vsub.f32	s2, s2, s10
	vadd.f32	s1, s13, s0
	vsub.f32	s0, s13, s0
	vadd.f32	s5, s8, s4
	vsub.f32	s4, s8, s4
	vadd.f32	s8, s6, s15
	vmov	s12, r1
	vmov	r1, s16
	str	r1, [r4, r0]
	vmov	r1, s1
	vadd.f32	s10, s12, s9
	adds	r0, #32
	str	r1, [r2, #4]
	vmov	r1, s14
	cmp.w	r0, #512
	str.w	r1, [r2, #512]
	vmov	r1, s0
	vsub.f32	s0, s6, s15
	str.w	r1, [r2, #516]
	vmov	r1, s3
	str	r1, [r2, #8]
	vmov	r1, s5
	str	r1, [r2, #12]
	vmov	r1, s2
	vldr	s2, [r3, #28]
	str.w	r1, [r2, #520]
	vmov	r1, s4
	str.w	r1, [r2, #524]
	vmov	r1, s8
	str	r1, [r2, #16]
	vmov	r1, s10
	str	r1, [r2, #20]
	vmov	r1, s0
	vsub.f32	s0, s12, s9
	str.w	r1, [r2, #528]
	vmov	r1, s0
	vldr	s0, [r3, #24]
	str.w	r1, [r2, #532]
	ldr.w	r6, [r2, #536]
	ldr.w	r5, [r2, #540]
	ldr	r1, [r2, #24]
	ldr	r7, [r2, #28]
	vmov	s4, r6
	vmov	s6, r5
	vmov	s10, r1
	vmov	s12, r7
	vmul.f32	s8, s0, s4
	vmul.f32	s0, s0, s6
	vmls.f32	s8, s2, s6
	vmla.f32	s0, s2, s4
	vadd.f32	s6, s10, s8
	vadd.f32	s2, s12, s0
	vsub.f32	s0, s12, s0
	vmov	r1, s6
	str	r1, [r2, #24]
	vmov	r1, s2
	vsub.f32	s2, s10, s8
	str	r1, [r2, #28]
	vmov	r1, s2
	str.w	r1, [r2, #536]
	vmov	r1, s0
	str.w	r1, [r2, #540]
	bne.w	.LBB2_5
@ %bb.6:                                @ %loop.after10
	vpop	{d8}
	pop.w	{r4, r5, r6, r7, r8, pc}
	.p2align	2
@ %bb.7:
.LCPI2_0:
	.long	twiddles_64-(.LPC2_0+4)
.Lfunc_end2:
	.size	FFTC_float_128, .Lfunc_end2-FFTC_float_128
	.cantunwind
	.fnend
                                        @ -- End function
	.p2align	2               @ -- Begin function FFTC_float_64
	.type	FFTC_float_64,%function
	.code	16                      @ @FFTC_float_64
	.thumb_func
FFTC_float_64:
	.fnstart
@ %bb.0:                                @ %entry
	.save	{r4, r5, r6, r7, r8, lr}
	push.w	{r4, r5, r6, r7, r8, lr}
	.vsave	{d8}
	vpush	{d8}
	mov	r8, r1
	mov	r4, r0
	movs	r0, #0
	movs	r1, #60
.LBB3_1:                                @ %loop.body
                                        @ =>This Inner Loop Header: Depth=1
	add.w	r2, r4, r0, lsl #1
	adds	r6, r4, r1
	ldr	r3, [r2, #8]
	ldr	r5, [r2, #12]
	str.w	r3, [r8, r0]
	add.w	r3, r8, r0
	str	r5, [r3, #4]
	ldr	r6, [r6, #-60]
	ldr	r5, [r2, #4]
	str	r6, [r4, r0]
	adds	r6, r4, r0
	adds	r0, #32
	str	r5, [r6, #4]
	cmp.w	r0, #256
	ldr	r5, [r2, #24]
	ldr	r7, [r2, #28]
	str	r7, [r3, #12]
	str	r5, [r3, #8]
	ldr	r7, [r2, #16]
	ldr	r5, [r2, #20]
	str	r5, [r6, #12]
	str	r7, [r6, #8]
	ldr	r7, [r2, #40]
	ldr	r5, [r2, #44]
	str	r5, [r3, #20]
	str	r7, [r3, #16]
	ldr	r7, [r2, #32]
	ldr	r5, [r2, #36]
	str	r5, [r6, #20]
	str	r7, [r6, #16]
	ldr	r5, [r4, r1]
	ldr	r7, [r2, #56]
	add.w	r1, r1, #64
	str	r5, [r3, #28]
	str	r7, [r3, #24]
	ldr	r3, [r2, #48]
	ldr	r2, [r2, #52]
	str	r2, [r6, #28]
	str	r3, [r6, #24]
	bne	.LBB3_1
@ %bb.2:                                @ %loop.body3.preheader
	movs	r0, #0
.LBB3_3:                                @ %loop.body3
                                        @ =>This Inner Loop Header: Depth=1
	add.w	r1, r8, r0
	ldr.w	r3, [r8, r0]
	adds	r7, r4, r0
	adds	r0, #64
	ldr	r2, [r1, #4]
	cmp.w	r0, #256
	str.w	r3, [r7, #256]
	str.w	r2, [r7, #260]
	ldr	r2, [r1, #8]
	ldr	r3, [r1, #12]
	str.w	r3, [r7, #268]
	str.w	r2, [r7, #264]
	ldr	r2, [r1, #16]
	ldr	r3, [r1, #20]
	str.w	r3, [r7, #276]
	str.w	r2, [r7, #272]
	ldr	r2, [r1, #24]
	ldr	r3, [r1, #28]
	str.w	r3, [r7, #284]
	str.w	r2, [r7, #280]
	ldr	r2, [r1, #32]
	ldr	r3, [r1, #36]
	str.w	r3, [r7, #292]
	str.w	r2, [r7, #288]
	ldr	r2, [r1, #40]
	ldr	r3, [r1, #44]
	str.w	r3, [r7, #300]
	str.w	r2, [r7, #296]
	ldr	r2, [r1, #48]
	ldr	r3, [r1, #52]
	str.w	r3, [r7, #308]
	str.w	r2, [r7, #304]
	ldr	r2, [r1, #56]
	ldr	r1, [r1, #60]
	str.w	r1, [r7, #316]
	str.w	r2, [r7, #312]
	bne	.LBB3_3
@ %bb.4:                                @ %loop.after5
	mov	r0, r4
	mov	r1, r8
	bl	FFTC_float_32
	add.w	r0, r4, #256
	mov	r1, r8
	bl	FFTC_float_32
	ldr	r1, .LCPI3_0
	movs	r0, #0
.LPC3_0:
	add	r1, pc
	mov	r12, r1
.LBB3_5:                                @ %loop.body8
                                        @ =>This Inner Loop Header: Depth=1
	adds	r2, r4, r0
	mov	r1, r12
	adds	r3, r1, r0
	ldr.w	r1, [r2, #260]
	ldr.w	r7, [r2, #256]
	ldr.w	r6, [r2, #276]
	ldr.w	r5, [r2, #272]
	vldr	s0, [r3]
	vldr	s2, [r3, #4]
	vldr	s4, [r3, #8]
	vldr	s6, [r3, #12]
	vldr	s9, [r3, #16]
	vldr	s11, [r3, #20]
	vmov	s10, r1
	ldr.w	r1, [r2, #264]
	vmov	s8, r7
	ldr	r7, [r4, r0]
	vmov	s3, r5
	vmov	s5, r6
	ldr	r6, [r2, #12]
	ldr	r5, [r2, #16]
	vmul.f32	s14, s0, s8
	vmul.f32	s0, s0, s10
	vmul.f32	s15, s9, s3
	vmul.f32	s9, s9, s5
	vmov	s12, r1
	ldr.w	r1, [r2, #268]
	vmov	s7, r7
	vmls.f32	s14, s2, s10
	vmla.f32	s0, s2, s8
	ldr	r7, [r2, #8]
	vmov	s8, r6
	vmla.f32	s9, s11, s3
	vmls.f32	s15, s11, s5
	vmov	s1, r1
	ldr	r1, [r2, #4]
	vmul.f32	s10, s4, s12
	vadd.f32	s16, s7, s14
	vsub.f32	s14, s7, s14
	vmov	s2, r7
	vmul.f32	s4, s4, s1
	vmls.f32	s10, s6, s1
	vmov	s13, r1
	ldr	r1, [r2, #20]
	vmla.f32	s4, s6, s12
	vmov	s6, r5
	vadd.f32	s3, s2, s10
	vsub.f32	s2, s2, s10
	vadd.f32	s1, s13, s0
	vsub.f32	s0, s13, s0
	vadd.f32	s5, s8, s4
	vsub.f32	s4, s8, s4
	vadd.f32	s8, s6, s15
	vmov	s12, r1
	vmov	r1, s16
	str	r1, [r4, r0]
	vmov	r1, s1
	vadd.f32	s10, s12, s9
	adds	r0, #32
	str	r1, [r2, #4]
	vmov	r1, s14
	cmp.w	r0, #256
	str.w	r1, [r2, #256]
	vmov	r1, s0
	vsub.f32	s0, s6, s15
	str.w	r1, [r2, #260]
	vmov	r1, s3
	str	r1, [r2, #8]
	vmov	r1, s5
	str	r1, [r2, #12]
	vmov	r1, s2
	vldr	s2, [r3, #28]
	str.w	r1, [r2, #264]
	vmov	r1, s4
	str.w	r1, [r2, #268]
	vmov	r1, s8
	str	r1, [r2, #16]
	vmov	r1, s10
	str	r1, [r2, #20]
	vmov	r1, s0
	vsub.f32	s0, s12, s9
	str.w	r1, [r2, #272]
	vmov	r1, s0
	vldr	s0, [r3, #24]
	str.w	r1, [r2, #276]
	ldr.w	r6, [r2, #280]
	ldr.w	r5, [r2, #284]
	ldr	r1, [r2, #24]
	ldr	r7, [r2, #28]
	vmov	s4, r6
	vmov	s6, r5
	vmov	s10, r1
	vmov	s12, r7
	vmul.f32	s8, s0, s4
	vmul.f32	s0, s0, s6
	vmls.f32	s8, s2, s6
	vmla.f32	s0, s2, s4
	vadd.f32	s6, s10, s8
	vadd.f32	s2, s12, s0
	vsub.f32	s0, s12, s0
	vmov	r1, s6
	str	r1, [r2, #24]
	vmov	r1, s2
	vsub.f32	s2, s10, s8
	str	r1, [r2, #28]
	vmov	r1, s2
	str.w	r1, [r2, #280]
	vmov	r1, s0
	str.w	r1, [r2, #284]
	bne.w	.LBB3_5
@ %bb.6:                                @ %loop.after10
	vpop	{d8}
	pop.w	{r4, r5, r6, r7, r8, pc}
	.p2align	2
@ %bb.7:
.LCPI3_0:
	.long	twiddles_32-(.LPC3_0+4)
.Lfunc_end3:
	.size	FFTC_float_64, .Lfunc_end3-FFTC_float_64
	.cantunwind
	.fnend
                                        @ -- End function
	.p2align	2               @ -- Begin function FFTC_float_32
	.type	FFTC_float_32,%function
	.code	16                      @ @FFTC_float_32
	.thumb_func
FFTC_float_32:
	.fnstart
@ %bb.0:                                @ %entry
	.save	{r4, r5, r6, r7, r8, lr}
	push.w	{r4, r5, r6, r7, r8, lr}
	.vsave	{d8}
	vpush	{d8}
	mov	r8, r1
	mov	r4, r0
	movs	r0, #0
	movs	r1, #60
.LBB4_1:                                @ %loop.body
                                        @ =>This Inner Loop Header: Depth=1
	add.w	r2, r4, r0, lsl #1
	adds	r5, r4, r1
	ldr	r3, [r2, #8]
	ldr	r6, [r2, #12]
	str.w	r3, [r8, r0]
	add.w	r3, r8, r0
	str	r6, [r3, #4]
	ldr	r5, [r5, #-60]
	ldr	r6, [r2, #4]
	str	r5, [r4, r0]
	adds	r5, r4, r0
	adds	r0, #32
	str	r6, [r5, #4]
	cmp	r0, #128
	ldr	r6, [r2, #24]
	ldr	r7, [r2, #28]
	str	r7, [r3, #12]
	str	r6, [r3, #8]
	ldr	r7, [r2, #16]
	ldr	r6, [r2, #20]
	str	r6, [r5, #12]
	str	r7, [r5, #8]
	ldr	r7, [r2, #40]
	ldr	r6, [r2, #44]
	str	r6, [r3, #20]
	str	r7, [r3, #16]
	ldr	r7, [r2, #32]
	ldr	r6, [r2, #36]
	str	r6, [r5, #20]
	str	r7, [r5, #16]
	ldr	r6, [r4, r1]
	ldr	r7, [r2, #56]
	add.w	r1, r1, #64
	str	r6, [r3, #28]
	str	r7, [r3, #24]
	ldr	r3, [r2, #48]
	ldr	r2, [r2, #52]
	str	r2, [r5, #28]
	str	r3, [r5, #24]
	bne	.LBB4_1
@ %bb.2:                                @ %loop.init1
	ldr.w	r0, [r8]
	ldr.w	r1, [r8, #4]
	mov	r6, r4
	str.w	r1, [r4, #132]
	str	r0, [r6, #128]!
	ldr.w	r0, [r8, #8]
	ldr.w	r1, [r8, #12]
	str.w	r1, [r4, #140]
	str.w	r0, [r4, #136]
	ldr.w	r0, [r8, #16]
	ldr.w	r1, [r8, #20]
	str.w	r1, [r4, #148]
	str.w	r0, [r4, #144]
	ldr.w	r0, [r8, #24]
	ldr.w	r1, [r8, #28]
	str.w	r1, [r4, #156]
	str.w	r0, [r4, #152]
	ldr.w	r0, [r8, #32]
	ldr.w	r1, [r8, #36]
	str.w	r1, [r4, #164]
	str.w	r0, [r4, #160]
	ldr.w	r0, [r8, #40]
	ldr.w	r1, [r8, #44]
	str.w	r1, [r4, #172]
	str.w	r0, [r4, #168]
	ldr.w	r0, [r8, #48]
	ldr.w	r1, [r8, #52]
	str.w	r1, [r4, #180]
	str.w	r0, [r4, #176]
	ldr.w	r0, [r8, #56]
	ldr.w	r1, [r8, #60]
	str.w	r1, [r4, #188]
	str.w	r0, [r4, #184]
	ldr.w	r0, [r8, #64]
	ldr.w	r1, [r8, #68]
	str.w	r1, [r4, #196]
	str.w	r0, [r4, #192]
	ldr.w	r0, [r8, #72]
	ldr.w	r1, [r8, #76]
	str.w	r1, [r4, #204]
	str.w	r0, [r4, #200]
	ldr.w	r0, [r8, #80]
	ldr.w	r1, [r8, #84]
	str.w	r1, [r4, #212]
	str.w	r0, [r4, #208]
	ldr.w	r0, [r8, #88]
	ldr.w	r1, [r8, #92]
	str.w	r1, [r4, #220]
	str.w	r0, [r4, #216]
	ldr.w	r0, [r8, #96]
	ldr.w	r1, [r8, #100]
	str.w	r1, [r4, #228]
	str.w	r0, [r4, #224]
	ldr.w	r0, [r8, #104]
	ldr.w	r1, [r8, #108]
	str.w	r1, [r4, #236]
	str.w	r0, [r4, #232]
	ldr.w	r0, [r8, #112]
	ldr.w	r1, [r8, #116]
	str.w	r1, [r4, #244]
	str.w	r0, [r4, #240]
	ldr.w	r0, [r8, #120]
	ldr.w	r1, [r8, #124]
	str.w	r1, [r4, #252]
	str.w	r0, [r4, #248]
	mov	r0, r4
	mov	r1, r8
	bl	FFTC_float_16
	mov	r0, r6
	mov	r1, r8
	bl	FFTC_float_16
	ldr	r1, .LCPI4_0
	movs	r0, #0
.LPC4_0:
	add	r1, pc
	mov	r12, r1
.LBB4_3:                                @ %loop.body8
                                        @ =>This Inner Loop Header: Depth=1
	adds	r2, r4, r0
	mov	r1, r12
	adds	r3, r1, r0
	ldr.w	r1, [r2, #132]
	ldr.w	r7, [r2, #128]
	ldr.w	r6, [r2, #148]
	ldr.w	r5, [r2, #144]
	vldr	s0, [r3]
	vldr	s2, [r3, #4]
	vldr	s4, [r3, #8]
	vldr	s6, [r3, #12]
	vldr	s9, [r3, #16]
	vldr	s11, [r3, #20]
	vmov	s10, r1
	ldr.w	r1, [r2, #136]
	vmov	s8, r7
	ldr	r7, [r4, r0]
	vmov	s3, r5
	vmov	s5, r6
	ldr	r6, [r2, #12]
	ldr	r5, [r2, #16]
	vmul.f32	s14, s0, s8
	vmul.f32	s0, s0, s10
	vmul.f32	s15, s9, s3
	vmul.f32	s9, s9, s5
	vmov	s12, r1
	ldr.w	r1, [r2, #140]
	vmov	s7, r7
	vmls.f32	s14, s2, s10
	vmla.f32	s0, s2, s8
	ldr	r7, [r2, #8]
	vmov	s8, r6
	vmla.f32	s9, s11, s3
	vmls.f32	s15, s11, s5
	vmov	s1, r1
	ldr	r1, [r2, #4]
	vmul.f32	s10, s4, s12
	vadd.f32	s16, s7, s14
	vsub.f32	s14, s7, s14
	vmov	s2, r7
	vmul.f32	s4, s4, s1
	vmls.f32	s10, s6, s1
	vmov	s13, r1
	ldr	r1, [r2, #20]
	vmla.f32	s4, s6, s12
	vmov	s6, r5
	vadd.f32	s3, s2, s10
	vsub.f32	s2, s2, s10
	vadd.f32	s1, s13, s0
	vsub.f32	s0, s13, s0
	vadd.f32	s5, s8, s4
	vsub.f32	s4, s8, s4
	vadd.f32	s8, s6, s15
	vmov	s12, r1
	vmov	r1, s16
	str	r1, [r4, r0]
	vmov	r1, s1
	vadd.f32	s10, s12, s9
	adds	r0, #32
	str	r1, [r2, #4]
	vmov	r1, s14
	cmp	r0, #128
	str.w	r1, [r2, #128]
	vmov	r1, s0
	vsub.f32	s0, s6, s15
	str.w	r1, [r2, #132]
	vmov	r1, s3
	str	r1, [r2, #8]
	vmov	r1, s5
	str	r1, [r2, #12]
	vmov	r1, s2
	vldr	s2, [r3, #28]
	str.w	r1, [r2, #136]
	vmov	r1, s4
	str.w	r1, [r2, #140]
	vmov	r1, s8
	str	r1, [r2, #16]
	vmov	r1, s10
	str	r1, [r2, #20]
	vmov	r1, s0
	vsub.f32	s0, s12, s9
	str.w	r1, [r2, #144]
	vmov	r1, s0
	vldr	s0, [r3, #24]
	str.w	r1, [r2, #148]
	ldr.w	r6, [r2, #152]
	ldr.w	r5, [r2, #156]
	ldr	r1, [r2, #24]
	ldr	r7, [r2, #28]
	vmov	s4, r6
	vmov	s6, r5
	vmov	s10, r1
	vmov	s12, r7
	vmul.f32	s8, s0, s4
	vmul.f32	s0, s0, s6
	vmls.f32	s8, s2, s6
	vmla.f32	s0, s2, s4
	vadd.f32	s6, s10, s8
	vadd.f32	s2, s12, s0
	vsub.f32	s0, s12, s0
	vmov	r1, s6
	str	r1, [r2, #24]
	vmov	r1, s2
	vsub.f32	s2, s10, s8
	str	r1, [r2, #28]
	vmov	r1, s2
	str.w	r1, [r2, #152]
	vmov	r1, s0
	str.w	r1, [r2, #156]
	bne.w	.LBB4_3
@ %bb.4:                                @ %loop.after10
	vpop	{d8}
	pop.w	{r4, r5, r6, r7, r8, pc}
	.p2align	2
@ %bb.5:
.LCPI4_0:
	.long	twiddles_16-(.LPC4_0+4)
.Lfunc_end4:
	.size	FFTC_float_32, .Lfunc_end4-FFTC_float_32
	.cantunwind
	.fnend
                                        @ -- End function
	.p2align	2               @ -- Begin function FFTC_float_16
	.type	FFTC_float_16,%function
	.code	16                      @ @FFTC_float_16
	.thumb_func
FFTC_float_16:
	.fnstart
@ %bb.0:                                @ %entry
	.save	{r4, r5, r6, lr}
	push	{r4, r5, r6, lr}
	mov	r4, r0
	mov	r6, r1
	ldr	r0, [r4, #8]
	ldr	r1, [r4, #12]
	mov	r5, r4
	str	r1, [r6, #4]
	str	r0, [r6]
	ldr	r0, [r4, #24]
	ldr	r1, [r4, #28]
	str	r1, [r6, #12]
	str	r0, [r6, #8]
	ldr	r0, [r4, #16]
	ldr	r1, [r4, #20]
	ldr	r2, [r4, #40]
	ldr	r3, [r4, #44]
	str	r0, [r4, #8]
	str	r1, [r4, #12]
	str	r3, [r6, #20]
	str	r2, [r6, #16]
	ldr	r0, [r4, #32]
	ldr	r1, [r4, #36]
	ldr	r2, [r4, #56]
	ldr	r3, [r4, #60]
	str	r0, [r4, #16]
	str	r1, [r4, #20]
	str	r3, [r6, #28]
	str	r2, [r6, #24]
	ldr	r0, [r4, #48]
	ldr	r1, [r4, #52]
	ldr	r2, [r4, #72]
	ldr	r3, [r4, #76]
	str	r0, [r4, #24]
	str	r1, [r4, #28]
	str	r3, [r6, #36]
	str	r2, [r6, #32]
	ldr	r0, [r5, #64]!
	str	r0, [r4, #32]
	ldr	r0, [r4, #68]
	ldr	r1, [r4, #88]
	ldr	r2, [r4, #92]
	str	r0, [r4, #36]
	str	r2, [r6, #44]
	str	r1, [r6, #40]
	ldr	r0, [r4, #80]
	ldr	r1, [r4, #84]
	ldr	r2, [r4, #104]
	ldr	r3, [r4, #108]
	str	r0, [r4, #40]
	str	r1, [r4, #44]
	str	r3, [r6, #52]
	str	r2, [r6, #48]
	ldr	r0, [r4, #96]
	ldr	r1, [r4, #100]
	ldr	r2, [r4, #120]
	ldr	r3, [r4, #124]
	str	r0, [r4, #48]
	str	r1, [r4, #52]
	str	r3, [r6, #60]
	str	r2, [r6, #56]
	ldr	r0, [r4, #112]
	ldr	r1, [r4, #116]
	str	r0, [r4, #56]
	str	r1, [r4, #60]
	ldr	r0, [r6]
	ldr	r1, [r6, #4]
	str	r1, [r4, #68]
	str	r0, [r5]
	ldr	r0, [r6, #8]
	ldr	r1, [r6, #12]
	str	r1, [r4, #76]
	str	r0, [r4, #72]
	ldr	r0, [r6, #16]
	ldr	r1, [r6, #20]
	str	r1, [r4, #84]
	str	r0, [r4, #80]
	ldr	r0, [r6, #24]
	ldr	r1, [r6, #28]
	str	r1, [r4, #92]
	str	r0, [r4, #88]
	ldr	r0, [r6, #32]
	ldr	r1, [r6, #36]
	str	r1, [r4, #100]
	str	r0, [r4, #96]
	ldr	r0, [r6, #40]
	ldr	r1, [r6, #44]
	str	r1, [r4, #108]
	str	r0, [r4, #104]
	ldr	r0, [r6, #48]
	ldr	r1, [r6, #52]
	str	r1, [r4, #116]
	str	r0, [r4, #112]
	ldr	r0, [r6, #56]
	ldr	r1, [r6, #60]
	str	r1, [r4, #124]
	str	r0, [r4, #120]
	mov	r0, r4
	mov	r1, r6
	bl	FFTC_float_8
	mov	r0, r5
	mov	r1, r6
	bl	FFTC_float_8
	ldr	r6, [r5]
	ldr	r0, [r4, #68]
	ldr	r1, [r4]
	vldr	s12, .LCPI5_0
	ldr	r2, [r4, #4]
	vldr	s2, .LCPI5_1
	vldr	s0, .LCPI5_2
	vldr	s7, .LCPI5_3
	ldr	r3, [r4, #8]
	ldr.w	r12, [r4, #12]
	vmov	s6, r6
	ldr	r6, [r4, #72]
	vmov	s4, r0
	ldr	r0, [r4, #80]
	vmov	s3, r1
	vmov	s15, r2
	ldr	r1, [r4, #20]
	vmov.f32	s5, s6
	vmov	s8, r6
	ldr	r6, [r4, #76]
	vmov	s1, r0
	vmls.f32	s5, s4, s12
	ldr	r0, [r4, #16]
	vmla.f32	s4, s6, s12
	vmov	s6, r3
	vadd.f32	s13, s3, s5
	vmul.f32	s1, s1, s0
	vmul.f32	s9, s8, s2
	vsub.f32	s3, s3, s5
	vmov	s10, r6
	ldr	r6, [r4, #84]
	vmul.f32	s11, s10, s2
	vmls.f32	s9, s10, s7
	vmov	s10, r12
	vmov	s14, r6
	vmla.f32	s11, s8, s7
	vmov	s8, r0
	vmov	r0, s13
	vadd.f32	s5, s6, s9
	vsub.f32	s6, s6, s9
	vmov	s7, r1
	vmul.f32	s14, s14, s0
	str	r0, [r4]
	vadd.f32	s13, s10, s11
	vsub.f32	s10, s10, s11
	vsub.f32	s12, s1, s14
	vadd.f32	s14, s1, s14
	vadd.f32	s1, s15, s4
	vsub.f32	s4, s15, s4
	vmov	r0, s1
	vadd.f32	s9, s8, s12
	vadd.f32	s11, s7, s14
	str	r0, [r4, #4]
	vmov	r0, s3
	str	r0, [r5]
	vmov	r0, s4
	vsub.f32	s4, s8, s12
	str	r0, [r4, #68]
	vmov	r0, s5
	str	r0, [r4, #8]
	vmov	r0, s13
	str	r0, [r4, #12]
	vmov	r0, s6
	str	r0, [r4, #72]
	vmov	r0, s10
	str	r0, [r4, #76]
	vmov	r0, s9
	str	r0, [r4, #16]
	vmov	r0, s11
	str	r0, [r4, #20]
	vmov	r0, s4
	vsub.f32	s4, s7, s14
	str	r0, [r4, #80]
	vmov	r0, s4
	vldr	s4, .LCPI5_4
	str	r0, [r4, #84]
	ldr	r2, [r4, #88]
	ldr	r3, [r4, #92]
	ldr	r0, [r4, #24]
	ldr	r1, [r4, #28]
	vmov	s6, r2
	vmov	s8, r3
	vmov	s12, r0
	vmov	s14, r1
	vmul.f32	s10, s6, s4
	vmul.f32	s4, s8, s4
	vmls.f32	s10, s8, s2
	vmla.f32	s4, s6, s2
	vadd.f32	s8, s12, s10
	vadd.f32	s6, s14, s4
	vsub.f32	s4, s14, s4
	vmov	r0, s8
	str	r0, [r4, #24]
	vmov	r0, s6
	vsub.f32	s6, s12, s10
	str	r0, [r4, #28]
	vmov	r0, s6
	str	r0, [r4, #88]
	vmov	r0, s4
	vldr	s4, .LCPI5_5
	str	r0, [r4, #92]
	ldr	r3, [r4, #100]
	ldr	r2, [r4, #96]
	ldr	r0, [r4, #32]
	ldr	r1, [r4, #36]
	vmov	s8, r3
	vmov	s6, r2
	vmov	s10, r0
	vmov	s1, r1
	vmov.f32	s12, s8
	vnmls.f32	s12, s6, s4
	vmla.f32	s6, s8, s4
	vadd.f32	s14, s10, s12
	vadd.f32	s4, s1, s6
	vmov	r0, s14
	str	r0, [r4, #32]
	vmov	r0, s4
	vsub.f32	s4, s10, s12
	str	r0, [r4, #36]
	vmov	r0, s4
	vsub.f32	s4, s1, s6
	str	r0, [r4, #96]
	vmov	r0, s4
	vldr	s4, .LCPI5_6
	str	r0, [r4, #100]
	ldr	r2, [r4, #104]
	ldr	r3, [r4, #108]
	ldr	r0, [r4, #40]
	ldr	r1, [r4, #44]
	vmov	s6, r2
	vmov	s8, r3
	vmov	s12, r0
	vmov	s14, r1
	vmul.f32	s10, s6, s4
	vmul.f32	s4, s8, s4
	vmls.f32	s10, s8, s2
	vmla.f32	s4, s6, s2
	vadd.f32	s8, s12, s10
	vadd.f32	s2, s14, s4
	vmov	r0, s8
	str	r0, [r4, #40]
	vmov	r0, s2
	vsub.f32	s2, s12, s10
	str	r0, [r4, #44]
	vmov	r0, s2
	vsub.f32	s2, s14, s4
	str	r0, [r4, #104]
	vmov	r0, s2
	vldr	s2, .LCPI5_7
	str	r0, [r4, #108]
	ldr	r3, [r4, #116]
	ldr	r2, [r4, #112]
	ldr	r0, [r4, #48]
	ldr	r1, [r4, #52]
	vmov	s4, r3
	vmov	s6, r2
	vmov	s8, r0
	vmov	s12, r1
	vmul.f32	s4, s4, s0
	vmov.f32	s10, s4
	vnmls.f32	s4, s6, s0
	vnmls.f32	s10, s6, s2
	vadd.f32	s2, s8, s10
	vadd.f32	s0, s12, s4
	vmov	r0, s2
	vldr	s2, .LCPI5_9
	str	r0, [r4, #48]
	vmov	r0, s0
	vsub.f32	s0, s8, s10
	str	r0, [r4, #52]
	vmov	r0, s0
	vsub.f32	s0, s12, s4
	str	r0, [r4, #112]
	vmov	r0, s0
	vldr	s0, .LCPI5_8
	str	r0, [r4, #116]
	ldr	r2, [r4, #120]
	ldr	r3, [r4, #124]
	ldr	r0, [r4, #56]
	ldr	r1, [r4, #60]
	vmov	s4, r2
	vmov	s6, r3
	vmov	s10, r0
	vmov	s12, r1
	vmul.f32	s8, s4, s0
	vmul.f32	s0, s6, s0
	vmls.f32	s8, s6, s2
	vmla.f32	s0, s4, s2
	vadd.f32	s6, s10, s8
	vadd.f32	s2, s12, s0
	vsub.f32	s0, s12, s0
	vmov	r0, s6
	str	r0, [r4, #56]
	vmov	r0, s2
	vsub.f32	s2, s10, s8
	str	r0, [r4, #60]
	vmov	r0, s2
	str	r0, [r4, #120]
	vmov	r0, s0
	str	r0, [r4, #124]
	pop	{r4, r5, r6, pc}
	.p2align	2
@ %bb.1:
.LCPI5_0:
	.long	0                       @ float 0
.LCPI5_1:
	.long	1064076126              @ float 0.923879504
.LCPI5_2:
	.long	1060439283              @ float 0.707106769
.LCPI5_3:
	.long	1053028118              @ float 0.382683456
.LCPI5_4:
	.long	1053028117              @ float 0.382683426
.LCPI5_5:
	.long	3007036718              @ float -4.37113883E-8
.LCPI5_6:
	.long	3200511768              @ float -0.382683516
.LCPI5_7:
	.long	3207922931              @ float -0.707106769
.LCPI5_8:
	.long	3211559776              @ float -0.923879623
.LCPI5_9:
	.long	1053028112              @ float 0.382683277
.Lfunc_end5:
	.size	FFTC_float_16, .Lfunc_end5-FFTC_float_16
	.cantunwind
	.fnend
                                        @ -- End function
	.p2align	2               @ -- Begin function FFTC_float_8
	.type	FFTC_float_8,%function
	.code	16                      @ @FFTC_float_8
	.thumb_func
FFTC_float_8:
	.fnstart
@ %bb.0:                                @ %entry
	.save	{r4, r5, r6, lr}
	push	{r4, r5, r6, lr}
	.vsave	{d8, d9, d10, d11, d12, d13}
	vpush	{d8, d9, d10, d11, d12, d13}
	ldr	r2, [r0, #8]
	ldr	r3, [r0, #12]
	vldr	s14, .LCPI6_0
	str	r3, [r1, #4]
	str	r2, [r1]
	ldr	r2, [r0, #24]
	ldr	r3, [r0, #28]
	str	r3, [r1, #12]
	str	r2, [r1, #8]
	ldr.w	lr, [r0, #16]
	ldr	r3, [r0, #20]
	ldr.w	r12, [r0, #40]
	ldr	r2, [r0, #44]
	str.w	lr, [r0, #8]
	str	r3, [r0, #12]
	str	r2, [r1, #20]
	str.w	r12, [r1, #16]
	ldr.w	lr, [r0, #32]
	ldr	r3, [r0, #36]
	ldr.w	r12, [r0, #56]
	ldr	r2, [r0, #60]
	str.w	lr, [r0, #16]
	str	r3, [r0, #20]
	str	r2, [r1, #28]
	str.w	r12, [r1, #24]
	ldr.w	lr, [r0, #52]
	ldr.w	r12, [r0, #48]
	str.w	r12, [r0, #24]
	str.w	lr, [r0, #28]
	vmov	s5, lr
	ldr	r2, [r1]
	ldr	r3, [r1, #4]
	str	r3, [r0, #36]
	str	r2, [r0, #32]
	vmov	s2, r3
	vmov	s12, r2
	ldr	r4, [r1, #8]
	ldr	r5, [r1, #12]
	str	r5, [r0, #44]
	str	r4, [r0, #40]
	vmov	s0, r5
	vmov	s8, r4
	ldr	r3, [r1, #16]
	ldr	r5, [r1, #20]
	str	r5, [r0, #52]
	str	r3, [r0, #48]
	vmov	s6, r5
	vmov	s1, r3
	ldr	r6, [r1, #24]
	ldr	r1, [r1, #28]
	ldr	r5, [r0, #12]
	ldr	r4, [r0, #8]
	ldr	r2, [r0, #4]
	ldr	r3, [r0, #20]
	vsub.f32	s13, s12, s1
	vadd.f32	s12, s12, s1
	vsub.f32	s9, s2, s6
	vadd.f32	s2, s2, s6
	vmov	s4, r1
	vmov	s10, r6
	ldr	r1, [r0]
	ldr	r6, [r0, #16]
	vmov	s7, r5
	vmov	s6, r4
	vmov	s22, r3
	vmov	s24, r2
	vsub.f32	s3, s0, s4
	vsub.f32	s11, s8, s10
	vadd.f32	s8, s8, s10
	vsub.f32	s1, s7, s5
	vadd.f32	s0, s0, s4
	vmov	s4, r12
	vadd.f32	s5, s5, s7
	vldr	s10, .LCPI6_1
	vsub.f32	s3, s14, s3
	vadd.f32	s7, s12, s8
	vmov	s15, r6
	vmov	s16, r1
	vadd.f32	s18, s9, s11
	vsub.f32	s9, s9, s11
	vsub.f32	s8, s12, s8
	vadd.f32	s12, s2, s0
	vadd.f32	s26, s4, s6
	vsub.f32	s4, s6, s4
	vsub.f32	s1, s14, s1
	vsub.f32	s2, s2, s0
	vmov.f32	s6, s7
	vadd.f32	s20, s13, s3
	vadd.f32	s11, s16, s15
	vsub.f32	s15, s16, s15
	vmul.f32	s16, s18, s10
	vmul.f32	s0, s9, s10
	vldr	s9, .LCPI6_2
	vsub.f32	s3, s13, s3
	vldr	s13, .LCPI6_3
	vmul.f32	s18, s20, s10
	vadd.f32	s20, s24, s22
	vsub.f32	s22, s24, s22
	vmls.f32	s6, s12, s14
	vmla.f32	s12, s7, s14
	vadd.f32	s24, s26, s11
	vsub.f32	s7, s11, s26
	vadd.f32	s11, s5, s20
	vsub.f32	s5, s20, s5
	vmov.f32	s20, s2
	vadd.f32	s14, s6, s24
	vsub.f32	s6, s24, s6
	vnmls.f32	s20, s8, s9
	vmla.f32	s8, s2, s9
	vmov	r1, s14
	vadd.f32	s14, s12, s11
	vsub.f32	s12, s11, s12
	vadd.f32	s2, s15, s1
	vsub.f32	s1, s15, s1
	vmov.f32	s15, s0
	vadd.f32	s11, s20, s7
	vsub.f32	s7, s7, s20
	vsub.f32	s9, s18, s16
	vadd.f32	s16, s16, s18
	vadd.f32	s18, s4, s22
	vsub.f32	s4, s22, s4
	vnmls.f32	s0, s3, s10
	str	r1, [r0]
	vmov	r1, s14
	vnmls.f32	s15, s3, s13
	str	r1, [r0, #4]
	vmov	r1, s6
	vadd.f32	s13, s8, s5
	vsub.f32	s8, s5, s8
	vadd.f32	s5, s9, s2
	vadd.f32	s20, s16, s18
	vsub.f32	s2, s2, s9
	vsub.f32	s9, s18, s16
	vadd.f32	s16, s15, s1
	str	r1, [r0, #32]
	vmov	r1, s12
	str	r1, [r0, #36]
	vmov	r1, s11
	str	r1, [r0, #16]
	vmov	r1, s13
	str	r1, [r0, #20]
	vmov	r1, s7
	str	r1, [r0, #48]
	vmov	r1, s8
	str	r1, [r0, #52]
	vmov	r1, s5
	str	r1, [r0, #8]
	vmov	r1, s20
	str	r1, [r0, #12]
	vmov	r1, s2
	vadd.f32	s2, s0, s4
	vsub.f32	s0, s4, s0
	str	r1, [r0, #40]
	vmov	r1, s9
	str	r1, [r0, #44]
	vmov	r1, s16
	str	r1, [r0, #24]
	vmov	r1, s2
	vsub.f32	s2, s1, s15
	str	r1, [r0, #28]
	vmov	r1, s2
	str	r1, [r0, #56]
	vmov	r1, s0
	str	r1, [r0, #60]
	vpop	{d8, d9, d10, d11, d12, d13}
	pop	{r4, r5, r6, pc}
	.p2align	2
@ %bb.1:
.LCPI6_0:
	.long	0                       @ float 0
.LCPI6_1:
	.long	1060439283              @ float 0.707106769
.LCPI6_2:
	.long	3007036718              @ float -4.37113883E-8
.LCPI6_3:
	.long	3207922931              @ float -0.707106769
.Lfunc_end6:
	.size	FFTC_float_8, .Lfunc_end6-FFTC_float_8
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	mfcc_Reset              @ -- Begin function mfcc_Reset
	.p2align	1
	.type	mfcc_Reset,%function
	.code	16                      @ @mfcc_Reset
	.thumb_func
mfcc_Reset:
	.fnstart
@ %bb.0:                                @ %entry
	bx	lr
.Lfunc_end7:
	.size	mfcc_Reset, .Lfunc_end7-mfcc_Reset
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	mfcc_GetInputSize       @ -- Begin function mfcc_GetInputSize
	.p2align	1
	.type	mfcc_GetInputSize,%function
	.code	16                      @ @mfcc_GetInputSize
	.thumb_func
mfcc_GetInputSize:
	.fnstart
@ %bb.0:                                @ %entry
	movs	r1, #0
	cmp	r0, #0
	it	eq
	moveq	r1, #1
	lsls	r0, r1, #9
	bx	lr
.Lfunc_end8:
	.size	mfcc_GetInputSize, .Lfunc_end8-mfcc_GetInputSize
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	mfcc_GetOutputSize      @ -- Begin function mfcc_GetOutputSize
	.p2align	1
	.type	mfcc_GetOutputSize,%function
	.code	16                      @ @mfcc_GetOutputSize
	.thumb_func
mfcc_GetOutputSize:
	.fnstart
@ %bb.0:                                @ %entry
	movs	r1, #0
	cmp	r0, #0
	it	eq
	moveq	r1, #80
	mov	r0, r1
	bx	lr
.Lfunc_end9:
	.size	mfcc_GetOutputSize, .Lfunc_end9-mfcc_GetOutputSize
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	mfcc_GetNumNodes        @ -- Begin function mfcc_GetNumNodes
	.p2align	1
	.type	mfcc_GetNumNodes,%function
	.code	16                      @ @mfcc_GetNumNodes
	.thumb_func
mfcc_GetNumNodes:
	.fnstart
@ %bb.0:                                @ %entry
	movs	r0, #10
	bx	lr
.Lfunc_end10:
	.size	mfcc_GetNumNodes, .Lfunc_end10-mfcc_GetNumNodes
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	mfcc_GetInputShape      @ -- Begin function mfcc_GetInputShape
	.p2align	1
	.type	mfcc_GetInputShape,%function
	.code	16                      @ @mfcc_GetInputShape
	.thumb_func
mfcc_GetInputShape:
	.fnstart
@ %bb.0:                                @ %entry
	cbz	r0, .LBB11_2
@ %bb.1:                                @ %ElseBlock0
	movs	r0, #0
	str	r0, [r1]
	str	r0, [r1, #4]
	str	r0, [r1, #8]
	bx	lr
.LBB11_2:                               @ %ThenBlock0
	mov.w	r2, #512
	movs	r0, #1
	str	r2, [r1]
	str	r0, [r1, #4]
	str	r0, [r1, #8]
	bx	lr
.Lfunc_end11:
	.size	mfcc_GetInputShape, .Lfunc_end11-mfcc_GetInputShape
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	mfcc_GetOutputShape     @ -- Begin function mfcc_GetOutputShape
	.p2align	1
	.type	mfcc_GetOutputShape,%function
	.code	16                      @ @mfcc_GetOutputShape
	.thumb_func
mfcc_GetOutputShape:
	.fnstart
@ %bb.0:                                @ %entry
	cbz	r0, .LBB12_2
@ %bb.1:                                @ %ElseBlock0
	movs	r0, #0
	strd	r0, r0, [r1]
	str	r0, [r1, #8]
	bx	lr
.LBB12_2:                               @ %ThenBlock0
	movs	r0, #1
	movs	r2, #80
	strd	r0, r0, [r1]
	str	r2, [r1, #8]
	bx	lr
.Lfunc_end12:
	.size	mfcc_GetOutputShape, .Lfunc_end12-mfcc_GetOutputShape
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	mfcc_GetMetadata        @ -- Begin function mfcc_GetMetadata
	.p2align	2
	.type	mfcc_GetMetadata,%function
	.code	16                      @ @mfcc_GetMetadata
	.thumb_func
mfcc_GetMetadata:
	.fnstart
@ %bb.0:                                @ %entry
	.save	{r4, r5, r6, r7, lr}
	push	{r4, r5, r6, r7, lr}
	ldr	r3, .LCPI13_0
	mov	r1, r0
	ldr	r0, .LCPI13_1
	movs	r2, #0
.LPC13_0:
	add	r3, pc
.LPC13_1:
	add	r0, pc
.LBB13_1:                               @ %loop.body.i
                                        @ =>This Inner Loop Header: Depth=1
	ldrb	r6, [r3, r2]
	ldrb	r4, [r1, r2]
	orrs.w	r5, r4, r6
	beq	.LBB13_28
@ %bb.2:                                @ %if.after.i
                                        @   in Loop: Header=BB13_1 Depth=1
	cmp	r4, r6
	bne	.LBB13_5
@ %bb.3:                                @ %if.after.i
                                        @   in Loop: Header=BB13_1 Depth=1
	cmp	r2, #11
	beq	.LBB13_5
@ %bb.4:                                @ %if.after.i
                                        @   in Loop: Header=BB13_1 Depth=1
	adds	r2, #1
	cmp	r4, #0
	bne	.LBB13_1
.LBB13_5:                               @ %loop.body.i42.preheader
	ldr	r3, .LCPI13_2
	ldr	r0, .LCPI13_3
	movs	r2, #0
.LPC13_2:
	add	r3, pc
.LPC13_3:
	add	r0, pc
.LBB13_6:                               @ %loop.body.i42
                                        @ =>This Inner Loop Header: Depth=1
	ldrb	r6, [r3, r2]
	ldrb	r4, [r1, r2]
	orrs.w	r5, r4, r6
	beq	.LBB13_28
@ %bb.7:                                @ %if.after.i43
                                        @   in Loop: Header=BB13_6 Depth=1
	cmp	r4, r6
	bne	.LBB13_10
@ %bb.8:                                @ %if.after.i43
                                        @   in Loop: Header=BB13_6 Depth=1
	cmp	r2, #11
	beq	.LBB13_10
@ %bb.9:                                @ %if.after.i43
                                        @   in Loop: Header=BB13_6 Depth=1
	adds	r2, #1
	cmp	r4, #0
	bne	.LBB13_6
.LBB13_10:                              @ %loop.body.i37.preheader
	ldr	r3, .LCPI13_4
	ldr	r0, .LCPI13_5
	movs	r2, #0
.LPC13_4:
	add	r3, pc
.LPC13_5:
	add	r0, pc
.LBB13_11:                              @ %loop.body.i37
                                        @ =>This Inner Loop Header: Depth=1
	ldrb	r6, [r3, r2]
	ldrb	r4, [r1, r2]
	orrs.w	r5, r4, r6
	beq	.LBB13_28
@ %bb.12:                               @ %if.after.i38
                                        @   in Loop: Header=BB13_11 Depth=1
	cmp	r4, r6
	bne	.LBB13_15
@ %bb.13:                               @ %if.after.i38
                                        @   in Loop: Header=BB13_11 Depth=1
	cmp	r2, #15
	beq	.LBB13_15
@ %bb.14:                               @ %if.after.i38
                                        @   in Loop: Header=BB13_11 Depth=1
	adds	r2, #1
	cmp	r4, #0
	bne	.LBB13_11
.LBB13_15:                              @ %loop.body.i32.preheader
	ldr	r3, .LCPI13_6
	ldr	r0, .LCPI13_7
	movs	r2, #0
.LPC13_6:
	add	r3, pc
.LPC13_7:
	add	r0, pc
.LBB13_16:                              @ %loop.body.i32
                                        @ =>This Inner Loop Header: Depth=1
	ldrb	r6, [r3, r2]
	ldrb	r4, [r1, r2]
	orrs.w	r5, r4, r6
	beq	.LBB13_28
@ %bb.17:                               @ %if.after.i33
                                        @   in Loop: Header=BB13_16 Depth=1
	cmp	r4, r6
	bne	.LBB13_20
@ %bb.18:                               @ %if.after.i33
                                        @   in Loop: Header=BB13_16 Depth=1
	cmp	r2, #11
	beq	.LBB13_20
@ %bb.19:                               @ %if.after.i33
                                        @   in Loop: Header=BB13_16 Depth=1
	adds	r2, #1
	cmp	r4, #0
	bne	.LBB13_16
.LBB13_20:                              @ %loop.body.i27.preheader
	ldr	r3, .LCPI13_8
	ldr	r0, .LCPI13_9
	movs	r2, #0
.LPC13_8:
	add	r3, pc
.LPC13_9:
	add	r0, pc
.LBB13_21:                              @ %loop.body.i27
                                        @ =>This Inner Loop Header: Depth=1
	ldrb	r6, [r3, r2]
	ldrb	r4, [r1, r2]
	orrs.w	r5, r4, r6
	beq	.LBB13_28
@ %bb.22:                               @ %if.after.i28
                                        @   in Loop: Header=BB13_21 Depth=1
	cmp	r4, r6
	bne	.LBB13_25
@ %bb.23:                               @ %if.after.i28
                                        @   in Loop: Header=BB13_21 Depth=1
	cmp	r2, #15
	beq	.LBB13_25
@ %bb.24:                               @ %if.after.i28
                                        @   in Loop: Header=BB13_21 Depth=1
	adds	r2, #1
	cmp	r4, #0
	bne	.LBB13_21
.LBB13_25:                              @ %loop.body.i22.preheader
	ldr	r4, .LCPI13_10
	ldr	r7, .LCPI13_11
	ldr	r0, .LCPI13_12
	movs	r2, #0
.LPC13_10:
	add	r4, pc
.LPC13_11:
	add	r7, pc
.LPC13_12:
	add	r0, pc
.LBB13_26:                              @ %loop.body.i22
                                        @ =>This Inner Loop Header: Depth=1
	ldrb	r5, [r4, r2]
	ldrb	r3, [r1, r2]
	orrs.w	r6, r3, r5
	itt	eq
	moveq	r0, r7
	popeq	{r4, r5, r6, r7, pc}
	cmp	r3, r5
	bne	.LBB13_28
@ %bb.27:                               @ %if.after.i23
                                        @   in Loop: Header=BB13_26 Depth=1
	cmp	r2, #3
	it	eq
	popeq	{r4, r5, r6, r7, pc}
	adds	r2, #1
	cmp	r3, #0
	bne	.LBB13_26
.LBB13_28:                              @ %NoMatchBlock
	pop	{r4, r5, r6, r7, pc}
	.p2align	2
@ %bb.29:
.LCPI13_0:
	.long	.L__unnamed_1-(.LPC13_0+4)
.LCPI13_1:
	.long	.L__unnamed_2-(.LPC13_1+4)
.LCPI13_2:
	.long	.L__unnamed_3-(.LPC13_2+4)
.LCPI13_3:
	.long	.L__unnamed_4-(.LPC13_3+4)
.LCPI13_4:
	.long	.L__unnamed_5-(.LPC13_4+4)
.LCPI13_5:
	.long	.L__unnamed_6-(.LPC13_5+4)
.LCPI13_6:
	.long	.L__unnamed_7-(.LPC13_6+4)
.LCPI13_7:
	.long	.L__unnamed_6-(.LPC13_7+4)
.LCPI13_8:
	.long	.L__unnamed_8-(.LPC13_8+4)
.LCPI13_9:
	.long	.L__unnamed_9-(.LPC13_9+4)
.LCPI13_10:
	.long	.L__unnamed_10-(.LPC13_10+4)
.LCPI13_11:
	.long	.L__unnamed_11-(.LPC13_11+4)
.LCPI13_12:
	.long	.L__unnamed_12-(.LPC13_12+4)
.Lfunc_end13:
	.size	mfcc_GetMetadata, .Lfunc_end13-mfcc_GetMetadata
	.cantunwind
	.fnend
                                        @ -- End function
	.type	mfcc_context,%object    @ @mfcc_context
	.local	mfcc_context
	.comm	mfcc_context,4,4
	.type	g_0,%object             @ @g_0
	.local	g_0
	.comm	g_0,2048,16
	.type	g_1,%object             @ @g_1
	.local	g_1
	.comm	g_1,2048,16
	.type	c_0,%object             @ @c_0
	.section	.rodata,"a",%progbits
	.p2align	4
c_0:
	.long	1034147594              @ float 0.0799999982
	.long	1034152261              @ float 0.08003477
	.long	1034166262              @ float 0.0801390857
	.long	1034189594              @ float 0.0803129226
	.long	1034222254              @ float 0.0805562586
	.long	1034264237              @ float 0.0808690562
	.long	1034315537              @ float 0.081251271
	.long	1034376145              @ float 0.0817028358
	.long	1034446054              @ float 0.0822236985
	.long	1034525251              @ float 0.0828137621
	.long	1034613726              @ float 0.0834729522
	.long	1034711464              @ float 0.084201157
	.long	1034818451              @ float 0.0849982723
	.long	1034934672              @ float 0.0858641863
	.long	1035060107              @ float 0.0867987498
	.long	1035194739              @ float 0.0878018364
	.long	1035338547              @ float 0.0888732895
	.long	1035491509              @ float 0.0900129452
	.long	1035653602              @ float 0.0912206322
	.long	1035824801              @ float 0.0924961641
	.long	1036005082              @ float 0.0938393623
	.long	1036194415              @ float 0.095250003
	.long	1036392774              @ float 0.0967278927
	.long	1036600127              @ float 0.0982727929
	.long	1036816444              @ float 0.0998844802
	.long	1037041692              @ float 0.101562709
	.long	1037275836              @ float 0.103307217
	.long	1037518842              @ float 0.105117753
	.long	1037770672              @ float 0.106994033
	.long	1038031289              @ float 0.108935781
	.long	1038300653              @ float 0.110942699
	.long	1038578723              @ float 0.113014482
	.long	1038865458              @ float 0.115150824
	.long	1039160813              @ float 0.11735139
	.long	1039464745              @ float 0.11961586
	.long	1039777207              @ float 0.121943884
	.long	1040098153              @ float 0.124335118
	.long	1040307462              @ float 0.126789182
	.long	1040476345              @ float 0.129305735
	.long	1040649394              @ float 0.131884366
	.long	1040826584              @ float 0.134524703
	.long	1041007888              @ float 0.137226343
	.long	1041193279              @ float 0.139988884
	.long	1041382728              @ float 0.142811894
	.long	1041576207              @ float 0.145694956
	.long	1041773686              @ float 0.148637623
	.long	1041975136              @ float 0.151639462
	.long	1042180527              @ float 0.154700026
	.long	1042389826              @ float 0.157818824
	.long	1042603004              @ float 0.160995424
	.long	1042820026              @ float 0.164229304
	.long	1043040861              @ float 0.167520002
	.long	1043265476              @ float 0.170867026
	.long	1043493835              @ float 0.17426984
	.long	1043725905              @ float 0.177727953
	.long	1043961651              @ float 0.181240842
	.long	1044201037              @ float 0.184807971
	.long	1044444027              @ float 0.188428804
	.long	1044690583              @ float 0.192102775
	.long	1044940669              @ float 0.195829347
	.long	1045194248              @ float 0.199607968
	.long	1045451279              @ float 0.203438029
	.long	1045711726              @ float 0.207318991
	.long	1045975548              @ float 0.211250246
	.long	1046242705              @ float 0.215231195
	.long	1046513158              @ float 0.219261259
	.long	1046786864              @ float 0.223339796
	.long	1047063784              @ float 0.227466226
	.long	1047343874              @ float 0.231639892
	.long	1047627093              @ float 0.235860184
	.long	1047913398              @ float 0.240126461
	.long	1048202745              @ float 0.244438067
	.long	1048495091              @ float 0.248794362
	.long	1048683196              @ float 0.25319469
	.long	1048832301              @ float 0.257638365
	.long	1048982839              @ float 0.262124747
	.long	1049134786              @ float 0.266653121
	.long	1049288120              @ float 0.27122283
	.long	1049442818              @ float 0.275833189
	.long	1049598855              @ float 0.280483454
	.long	1049756210              @ float 0.285172999
	.long	1049914857              @ float 0.289901048
	.long	1050074772              @ float 0.294666886
	.long	1050235932              @ float 0.299469829
	.long	1050398313              @ float 0.30430916
	.long	1050561889              @ float 0.309184104
	.long	1050726636              @ float 0.314093947
	.long	1050892529              @ float 0.319037944
	.long	1051059543              @ float 0.324015349
	.long	1051227652              @ float 0.329025388
	.long	1051396832              @ float 0.334067345
	.long	1051567057              @ float 0.339140445
	.long	1051738300              @ float 0.344243884
	.long	1051910537              @ float 0.349376947
	.long	1052083740              @ float 0.354538798
	.long	1052257885              @ float 0.359728724
	.long	1052432944              @ float 0.364945889
	.long	1052608891              @ float 0.370189518
	.long	1052785699              @ float 0.375458807
	.long	1052963342              @ float 0.380752981
	.long	1053141793              @ float 0.386071235
	.long	1053321025              @ float 0.391412765
	.long	1053501011              @ float 0.396776766
	.long	1053681723              @ float 0.402162403
	.long	1053863135              @ float 0.407568902
	.long	1054045218              @ float 0.412995398
	.long	1054227945              @ float 0.418441087
	.long	1054411290              @ float 0.423905194
	.long	1054595223              @ float 0.429386824
	.long	1054779717              @ float 0.434885174
	.long	1054964745              @ float 0.440399438
	.long	1055150278              @ float 0.445928752
	.long	1055336288              @ float 0.451472282
	.long	1055522747              @ float 0.457029194
	.long	1055709627              @ float 0.462598652
	.long	1055896900              @ float 0.468179822
	.long	1056084537              @ float 0.47377184
	.long	1056272510              @ float 0.479373872
	.long	1056460790              @ float 0.484985054
	.long	1056649350              @ float 0.490604579
	.long	1056838160              @ float 0.496231556
	.long	1056995900              @ float 0.501865149
	.long	1057090513              @ float 0.507504523
	.long	1057185208              @ float 0.513148785
	.long	1057279972              @ float 0.518797159
	.long	1057374789              @ float 0.524448693
	.long	1057469646              @ float 0.530102611
	.long	1057564527              @ float 0.535757959
	.long	1057659420              @ float 0.541414022
	.long	1057754309              @ float 0.547069848
	.long	1057849180              @ float 0.5527246
	.long	1057944019              @ float 0.558377445
	.long	1058038811              @ float 0.564027488
	.long	1058133542              @ float 0.569673896
	.long	1058228198              @ float 0.575315833
	.long	1058322764              @ float 0.580952406
	.long	1058417226              @ float 0.58658278
	.long	1058511571              @ float 0.59220618
	.long	1058605783              @ float 0.597821653
	.long	1058699848              @ float 0.603428363
	.long	1058793752              @ float 0.609025478
	.long	1058887481              @ float 0.614612162
	.long	1058981021              @ float 0.62018758
	.long	1059074358              @ float 0.625750899
	.long	1059167477              @ float 0.631301224
	.long	1059260364              @ float 0.636837721
	.long	1059353006              @ float 0.642359614
	.long	1059445388              @ float 0.647866011
	.long	1059537497              @ float 0.653356134
	.long	1059629318              @ float 0.658829093
	.long	1059720838              @ float 0.66428411
	.long	1059812042              @ float 0.669720292
	.long	1059902918              @ float 0.675136924
	.long	1059993450              @ float 0.680533051
	.long	1060083627              @ float 0.685908019
	.long	1060173433              @ float 0.691260874
	.long	1060262855              @ float 0.69659084
	.long	1060351880              @ float 0.701897144
	.long	1060440495              @ float 0.707179009
	.long	1060528685              @ float 0.712435543
	.long	1060616439              @ float 0.717666089
	.long	1060703741              @ float 0.722869694
	.long	1060790580              @ float 0.728045702
	.long	1060876941              @ float 0.733193218
	.long	1060962813              @ float 0.738311588
	.long	1061048182              @ float 0.743399978
	.long	1061133034              @ float 0.748457551
	.long	1061217358              @ float 0.753483653
	.long	1061301141              @ float 0.758477509
	.long	1061384369              @ float 0.763438284
	.long	1061467031              @ float 0.768365323
	.long	1061549113              @ float 0.773257791
	.long	1061630604              @ float 0.778115034
	.long	1061711490              @ float 0.782936215
	.long	1061791761              @ float 0.787720739
	.long	1061871403              @ float 0.792467772
	.long	1061950405              @ float 0.797176659
	.long	1062028754              @ float 0.801846623
	.long	1062106439              @ float 0.80647701
	.long	1062183449              @ float 0.811067163
	.long	1062259770              @ float 0.81561625
	.long	1062335393              @ float 0.820123732
	.long	1062410305              @ float 0.824588835
	.long	1062484495              @ float 0.829010903
	.long	1062557953              @ float 0.833389341
	.long	1062630666              @ float 0.837723374
	.long	1062702624              @ float 0.842012405
	.long	1062773815              @ float 0.846255719
	.long	1062844230              @ float 0.85045278
	.long	1062913858              @ float 0.854602932
	.long	1062982688              @ float 0.858705521
	.long	1063050709              @ float 0.862759888
	.long	1063117911              @ float 0.866765439
	.long	1063184285              @ float 0.870721638
	.long	1063249820              @ float 0.874627829
	.long	1063314506              @ float 0.878483414
	.long	1063378333              @ float 0.8822878
	.long	1063441292              @ float 0.886040449
	.long	1063503374              @ float 0.889740824
	.long	1063564568              @ float 0.893388271
	.long	1063624866              @ float 0.896982312
	.long	1063684259              @ float 0.90052241
	.long	1063742737              @ float 0.904007971
	.long	1063800292              @ float 0.907438517
	.long	1063856915              @ float 0.91081351
	.long	1063912597              @ float 0.914132416
	.long	1063967330              @ float 0.917394757
	.long	1064021106              @ float 0.920600056
	.long	1064073917              @ float 0.923747837
	.long	1064125754              @ float 0.926837563
	.long	1064176610              @ float 0.929868817
	.long	1064226477              @ float 0.932841122
	.long	1064275348              @ float 0.935754061
	.long	1064323215              @ float 0.938607156
	.long	1064370071              @ float 0.941399991
	.long	1064415908              @ float 0.94413209
	.long	1064460721              @ float 0.946803152
	.long	1064504502              @ float 0.949412703
	.long	1064547244              @ float 0.951960325
	.long	1064588941              @ float 0.95444566
	.long	1064629587              @ float 0.95686835
	.long	1064669176              @ float 0.959228038
	.long	1064707702              @ float 0.961524367
	.long	1064745158              @ float 0.963756918
	.long	1064781539              @ float 0.965925395
	.long	1064816840              @ float 0.968029499
	.long	1064851055              @ float 0.970068871
	.long	1064884180              @ float 0.972043275
	.long	1064916208              @ float 0.973952293
	.long	1064947136              @ float 0.975795745
	.long	1064976959              @ float 0.977573335
	.long	1065005671              @ float 0.979284703
	.long	1065033269              @ float 0.980929672
	.long	1065059749              @ float 0.982508003
	.long	1065085107              @ float 0.984019458
	.long	1065109338              @ float 0.985463738
	.long	1065132439              @ float 0.986840665
	.long	1065154407              @ float 0.98815006
	.long	1065175238              @ float 0.989391684
	.long	1065194930              @ float 0.990565419
	.long	1065213478              @ float 0.991670966
	.long	1065230881              @ float 0.992708265
	.long	1065247135              @ float 0.993677079
	.long	1065262239              @ float 0.994577348
	.long	1065276190              @ float 0.995408892
	.long	1065288986              @ float 0.996171593
	.long	1065300624              @ float 0.996865272
	.long	1065311104              @ float 0.997489929
	.long	1065320423              @ float 0.998045384
	.long	1065328581              @ float 0.998531639
	.long	1065335575              @ float 0.998948514
	.long	1065341405              @ float 0.999296009
	.long	1065346070              @ float 0.999574065
	.long	1065349570              @ float 0.999782681
	.long	1065351903              @ float 0.999921739
	.long	1065353070              @ float 0.999991297
	.long	1065353070              @ float 0.999991297
	.long	1065351903              @ float 0.999921739
	.long	1065349570              @ float 0.999782681
	.long	1065346070              @ float 0.999574065
	.long	1065341405              @ float 0.999296009
	.long	1065335575              @ float 0.998948514
	.long	1065328581              @ float 0.998531639
	.long	1065320423              @ float 0.998045384
	.long	1065311104              @ float 0.997489929
	.long	1065300624              @ float 0.996865272
	.long	1065288986              @ float 0.996171593
	.long	1065276190              @ float 0.995408892
	.long	1065262239              @ float 0.994577348
	.long	1065247135              @ float 0.993677079
	.long	1065230881              @ float 0.992708265
	.long	1065213478              @ float 0.991670966
	.long	1065194930              @ float 0.990565419
	.long	1065175238              @ float 0.989391684
	.long	1065154407              @ float 0.98815006
	.long	1065132439              @ float 0.986840665
	.long	1065109338              @ float 0.985463738
	.long	1065085107              @ float 0.984019458
	.long	1065059749              @ float 0.982508003
	.long	1065033269              @ float 0.980929672
	.long	1065005671              @ float 0.979284703
	.long	1064976959              @ float 0.977573335
	.long	1064947136              @ float 0.975795745
	.long	1064916208              @ float 0.973952293
	.long	1064884180              @ float 0.972043275
	.long	1064851055              @ float 0.970068871
	.long	1064816840              @ float 0.968029499
	.long	1064781539              @ float 0.965925395
	.long	1064745158              @ float 0.963756918
	.long	1064707702              @ float 0.961524367
	.long	1064669176              @ float 0.959228038
	.long	1064629587              @ float 0.95686835
	.long	1064588941              @ float 0.95444566
	.long	1064547244              @ float 0.951960325
	.long	1064504502              @ float 0.949412703
	.long	1064460721              @ float 0.946803152
	.long	1064415908              @ float 0.94413209
	.long	1064370071              @ float 0.941399991
	.long	1064323215              @ float 0.938607156
	.long	1064275348              @ float 0.935754061
	.long	1064226477              @ float 0.932841122
	.long	1064176610              @ float 0.929868817
	.long	1064125754              @ float 0.926837563
	.long	1064073917              @ float 0.923747837
	.long	1064021106              @ float 0.920600056
	.long	1063967330              @ float 0.917394757
	.long	1063912597              @ float 0.914132416
	.long	1063856915              @ float 0.91081351
	.long	1063800292              @ float 0.907438517
	.long	1063742737              @ float 0.904007971
	.long	1063684259              @ float 0.90052241
	.long	1063624866              @ float 0.896982312
	.long	1063564568              @ float 0.893388271
	.long	1063503374              @ float 0.889740824
	.long	1063441292              @ float 0.886040449
	.long	1063378333              @ float 0.8822878
	.long	1063314506              @ float 0.878483414
	.long	1063249820              @ float 0.874627829
	.long	1063184285              @ float 0.870721638
	.long	1063117911              @ float 0.866765439
	.long	1063050709              @ float 0.862759888
	.long	1062982688              @ float 0.858705521
	.long	1062913858              @ float 0.854602932
	.long	1062844230              @ float 0.85045278
	.long	1062773815              @ float 0.846255719
	.long	1062702624              @ float 0.842012405
	.long	1062630666              @ float 0.837723374
	.long	1062557953              @ float 0.833389341
	.long	1062484495              @ float 0.829010903
	.long	1062410305              @ float 0.824588835
	.long	1062335393              @ float 0.820123732
	.long	1062259770              @ float 0.81561625
	.long	1062183449              @ float 0.811067163
	.long	1062106439              @ float 0.80647701
	.long	1062028754              @ float 0.801846623
	.long	1061950405              @ float 0.797176659
	.long	1061871403              @ float 0.792467772
	.long	1061791761              @ float 0.787720739
	.long	1061711490              @ float 0.782936215
	.long	1061630604              @ float 0.778115034
	.long	1061549113              @ float 0.773257791
	.long	1061467031              @ float 0.768365323
	.long	1061384369              @ float 0.763438284
	.long	1061301141              @ float 0.758477509
	.long	1061217358              @ float 0.753483653
	.long	1061133034              @ float 0.748457551
	.long	1061048182              @ float 0.743399978
	.long	1060962813              @ float 0.738311588
	.long	1060876941              @ float 0.733193218
	.long	1060790580              @ float 0.728045702
	.long	1060703741              @ float 0.722869694
	.long	1060616439              @ float 0.717666089
	.long	1060528685              @ float 0.712435543
	.long	1060440495              @ float 0.707179009
	.long	1060351880              @ float 0.701897144
	.long	1060262855              @ float 0.69659084
	.long	1060173433              @ float 0.691260874
	.long	1060083627              @ float 0.685908019
	.long	1059993450              @ float 0.680533051
	.long	1059902918              @ float 0.675136924
	.long	1059812042              @ float 0.669720292
	.long	1059720838              @ float 0.66428411
	.long	1059629318              @ float 0.658829093
	.long	1059537497              @ float 0.653356134
	.long	1059445388              @ float 0.647866011
	.long	1059353006              @ float 0.642359614
	.long	1059260364              @ float 0.636837721
	.long	1059167477              @ float 0.631301224
	.long	1059074358              @ float 0.625750899
	.long	1058981021              @ float 0.62018758
	.long	1058887481              @ float 0.614612162
	.long	1058793752              @ float 0.609025478
	.long	1058699848              @ float 0.603428363
	.long	1058605783              @ float 0.597821653
	.long	1058511571              @ float 0.59220618
	.long	1058417226              @ float 0.58658278
	.long	1058322764              @ float 0.580952406
	.long	1058228198              @ float 0.575315833
	.long	1058133542              @ float 0.569673896
	.long	1058038811              @ float 0.564027488
	.long	1057944019              @ float 0.558377445
	.long	1057849180              @ float 0.5527246
	.long	1057754309              @ float 0.547069848
	.long	1057659420              @ float 0.541414022
	.long	1057564527              @ float 0.535757959
	.long	1057469646              @ float 0.530102611
	.long	1057374789              @ float 0.524448693
	.long	1057279972              @ float 0.518797159
	.long	1057185208              @ float 0.513148785
	.long	1057090513              @ float 0.507504523
	.long	1056995900              @ float 0.501865149
	.long	1056838160              @ float 0.496231556
	.long	1056649350              @ float 0.490604579
	.long	1056460790              @ float 0.484985054
	.long	1056272510              @ float 0.479373872
	.long	1056084537              @ float 0.47377184
	.long	1055896900              @ float 0.468179822
	.long	1055709627              @ float 0.462598652
	.long	1055522747              @ float 0.457029194
	.long	1055336288              @ float 0.451472282
	.long	1055150278              @ float 0.445928752
	.long	1054964745              @ float 0.440399438
	.long	1054779717              @ float 0.434885174
	.long	1054595223              @ float 0.429386824
	.long	1054411290              @ float 0.423905194
	.long	1054227945              @ float 0.418441087
	.long	1054045218              @ float 0.412995398
	.long	1053863135              @ float 0.407568902
	.long	1053681723              @ float 0.402162403
	.long	1053501011              @ float 0.396776766
	.long	1053321025              @ float 0.391412765
	.long	1053141793              @ float 0.386071235
	.long	1052963342              @ float 0.380752981
	.long	1052785699              @ float 0.375458807
	.long	1052608891              @ float 0.370189518
	.long	1052432944              @ float 0.364945889
	.long	1052257885              @ float 0.359728724
	.long	1052083740              @ float 0.354538798
	.long	1051910537              @ float 0.349376947
	.long	1051738300              @ float 0.344243884
	.long	1051567057              @ float 0.339140445
	.long	1051396832              @ float 0.334067345
	.long	1051227652              @ float 0.329025388
	.long	1051059543              @ float 0.324015349
	.long	1050892529              @ float 0.319037944
	.long	1050726636              @ float 0.314093947
	.long	1050561889              @ float 0.309184104
	.long	1050398313              @ float 0.30430916
	.long	1050235932              @ float 0.299469829
	.long	1050074772              @ float 0.294666886
	.long	1049914857              @ float 0.289901048
	.long	1049756210              @ float 0.285172999
	.long	1049598855              @ float 0.280483454
	.long	1049442818              @ float 0.275833189
	.long	1049288120              @ float 0.27122283
	.long	1049134786              @ float 0.266653121
	.long	1048982839              @ float 0.262124747
	.long	1048832301              @ float 0.257638365
	.long	1048683196              @ float 0.25319469
	.long	1048495091              @ float 0.248794362
	.long	1048202745              @ float 0.244438067
	.long	1047913398              @ float 0.240126461
	.long	1047627093              @ float 0.235860184
	.long	1047343874              @ float 0.231639892
	.long	1047063784              @ float 0.227466226
	.long	1046786864              @ float 0.223339796
	.long	1046513158              @ float 0.219261259
	.long	1046242705              @ float 0.215231195
	.long	1045975548              @ float 0.211250246
	.long	1045711726              @ float 0.207318991
	.long	1045451279              @ float 0.203438029
	.long	1045194248              @ float 0.199607968
	.long	1044940669              @ float 0.195829347
	.long	1044690583              @ float 0.192102775
	.long	1044444027              @ float 0.188428804
	.long	1044201037              @ float 0.184807971
	.long	1043961651              @ float 0.181240842
	.long	1043725905              @ float 0.177727953
	.long	1043493835              @ float 0.17426984
	.long	1043265476              @ float 0.170867026
	.long	1043040861              @ float 0.167520002
	.long	1042820026              @ float 0.164229304
	.long	1042603004              @ float 0.160995424
	.long	1042389826              @ float 0.157818824
	.long	1042180527              @ float 0.154700026
	.long	1041975136              @ float 0.151639462
	.long	1041773686              @ float 0.148637623
	.long	1041576207              @ float 0.145694956
	.long	1041382728              @ float 0.142811894
	.long	1041193279              @ float 0.139988884
	.long	1041007888              @ float 0.137226343
	.long	1040826584              @ float 0.134524703
	.long	1040649394              @ float 0.131884366
	.long	1040476345              @ float 0.129305735
	.long	1040307462              @ float 0.126789182
	.long	1040098153              @ float 0.124335118
	.long	1039777207              @ float 0.121943884
	.long	1039464745              @ float 0.11961586
	.long	1039160813              @ float 0.11735139
	.long	1038865458              @ float 0.115150824
	.long	1038578723              @ float 0.113014482
	.long	1038300653              @ float 0.110942699
	.long	1038031289              @ float 0.108935781
	.long	1037770672              @ float 0.106994033
	.long	1037518842              @ float 0.105117753
	.long	1037275836              @ float 0.103307217
	.long	1037041692              @ float 0.101562709
	.long	1036816444              @ float 0.0998844802
	.long	1036600127              @ float 0.0982727929
	.long	1036392774              @ float 0.0967278927
	.long	1036194415              @ float 0.095250003
	.long	1036005082              @ float 0.0938393623
	.long	1035824801              @ float 0.0924961641
	.long	1035653602              @ float 0.0912206322
	.long	1035491509              @ float 0.0900129452
	.long	1035338547              @ float 0.0888732895
	.long	1035194739              @ float 0.0878018364
	.long	1035060107              @ float 0.0867987498
	.long	1034934672              @ float 0.0858641863
	.long	1034818451              @ float 0.0849982723
	.long	1034711464              @ float 0.084201157
	.long	1034613726              @ float 0.0834729522
	.long	1034525251              @ float 0.0828137621
	.long	1034446054              @ float 0.0822236985
	.long	1034376145              @ float 0.0817028358
	.long	1034315537              @ float 0.081251271
	.long	1034264237              @ float 0.0808690562
	.long	1034222254              @ float 0.0805562586
	.long	1034189594              @ float 0.0803129226
	.long	1034166262              @ float 0.0801390857
	.long	1034152261              @ float 0.08003477
	.long	1034147594              @ float 0.0799999982
	.size	c_0, 2048

	.type	g_2,%object             @ @g_2
	.local	g_2
	.comm	g_2,2048,16
	.type	twiddles_16,%object     @ @twiddles_16
	.p2align	4
twiddles_16:
	.long	1065353216              @ float 1
	.long	0                       @ float 0
	.long	1065030846              @ float 0.98078525
	.long	1044891074              @ float 0.195090324
	.long	1064076126              @ float 0.923879504
	.long	1053028118              @ float 0.382683456
	.long	1062525745              @ float 0.831469595
	.long	1057896922              @ float 0.555570245
	.long	1060439283              @ float 0.707106769
	.long	1060439283              @ float 0.707106769
	.long	1057896921              @ float 0.555570185
	.long	1062525746              @ float 0.831469655
	.long	1053028117              @ float 0.382683426
	.long	1064076126              @ float 0.923879504
	.long	1044891068              @ float 0.195090234
	.long	1065030847              @ float 0.98078531
	.long	3007036718              @ float -4.37113883E-8
	.long	1065353216              @ float 1
	.long	3192374722              @ float -0.195090324
	.long	1065030846              @ float 0.98078525
	.long	3200511768              @ float -0.382683516
	.long	1064076126              @ float 0.923879504
	.long	3205380572              @ float -0.555570364
	.long	1062525744              @ float 0.831469535
	.long	3207922931              @ float -0.707106769
	.long	1060439283              @ float 0.707106769
	.long	3210009394              @ float -0.831469655
	.long	1057896921              @ float 0.555570185
	.long	3211559776              @ float -0.923879623
	.long	1053028112              @ float 0.382683277
	.long	3212514495              @ float -0.98078531
	.long	1044891073              @ float 0.195090309
	.size	twiddles_16, 128

	.type	twiddles_32,%object     @ @twiddles_32
	.p2align	4
twiddles_32:
	.long	1065353216              @ float 1
	.long	0                       @ float 0
	.long	1065272429              @ float 0.995184719
	.long	1036565814              @ float 0.0980171412
	.long	1065030846              @ float 0.98078525
	.long	1044891074              @ float 0.195090324
	.long	1064630795              @ float 0.956940352
	.long	1049927729              @ float 0.290284663
	.long	1064076126              @ float 0.923879504
	.long	1053028118              @ float 0.382683456
	.long	1063372183              @ float 0.881921231
	.long	1056004842              @ float 0.471396744
	.long	1062525745              @ float 0.831469595
	.long	1057896922              @ float 0.555570245
	.long	1061544963              @ float 0.773010432
	.long	1059219354              @ float 0.634393334
	.long	1060439283              @ float 0.707106769
	.long	1060439283              @ float 0.707106769
	.long	1059219353              @ float 0.634393274
	.long	1061544963              @ float 0.773010432
	.long	1057896921              @ float 0.555570185
	.long	1062525746              @ float 0.831469655
	.long	1056004839              @ float 0.471396655
	.long	1063372184              @ float 0.881921291
	.long	1053028117              @ float 0.382683426
	.long	1064076126              @ float 0.923879504
	.long	1049927728              @ float 0.290284634
	.long	1064630795              @ float 0.956940352
	.long	1044891068              @ float 0.195090234
	.long	1065030847              @ float 0.98078531
	.long	1036565813              @ float 0.0980171337
	.long	1065272429              @ float 0.995184719
	.long	3007036718              @ float -4.37113883E-8
	.long	1065353216              @ float 1
	.long	3184049473              @ float -0.0980172231
	.long	1065272429              @ float 0.995184719
	.long	3192374722              @ float -0.195090324
	.long	1065030846              @ float 0.98078525
	.long	3197411379              @ float -0.290284723
	.long	1064630794              @ float 0.956940293
	.long	3200511768              @ float -0.382683516
	.long	1064076126              @ float 0.923879504
	.long	3203488493              @ float -0.471396834
	.long	1063372183              @ float 0.881921231
	.long	3205380572              @ float -0.555570364
	.long	1062525744              @ float 0.831469535
	.long	3206703001              @ float -0.634393274
	.long	1061544964              @ float 0.773010492
	.long	3207922931              @ float -0.707106769
	.long	1060439283              @ float 0.707106769
	.long	3209028612              @ float -0.773010492
	.long	1059219353              @ float 0.634393274
	.long	3210009394              @ float -0.831469655
	.long	1057896921              @ float 0.555570185
	.long	3210855833              @ float -0.88192135
	.long	1056004838              @ float 0.471396625
	.long	3211559776              @ float -0.923879623
	.long	1053028112              @ float 0.382683277
	.long	3212114443              @ float -0.956940352
	.long	1049927731              @ float 0.290284723
	.long	3212514495              @ float -0.98078531
	.long	1044891073              @ float 0.195090309
	.long	3212756077              @ float -0.995184719
	.long	1036565808              @ float 0.0980170965
	.size	twiddles_32, 256

	.type	twiddles_64,%object     @ @twiddles_64
	.p2align	4
twiddles_64:
	.long	1065353216              @ float 1
	.long	0                       @ float 0
	.long	1065333007              @ float 0.998795449
	.long	1028193072              @ float 0.0490676761
	.long	1065272429              @ float 0.995184719
	.long	1036565814              @ float 0.0980171412
	.long	1065171628              @ float 0.989176511
	.long	1041645699              @ float 0.146730468
	.long	1065030846              @ float 0.98078525
	.long	1044891074              @ float 0.195090324
	.long	1064850424              @ float 0.970031261
	.long	1048104909              @ float 0.242980197
	.long	1064630795              @ float 0.956940352
	.long	1049927729              @ float 0.290284663
	.long	1064372488              @ float 0.941544055
	.long	1051491540              @ float 0.336889863
	.long	1064076126              @ float 0.923879504
	.long	1053028118              @ float 0.382683456
	.long	1063742424              @ float 0.903989315
	.long	1054533760              @ float 0.427555084
	.long	1063372183              @ float 0.881921231
	.long	1056004842              @ float 0.471396744
	.long	1062966298              @ float 0.8577286
	.long	1057201213              @ float 0.514102757
	.long	1062525745              @ float 0.831469595
	.long	1057896922              @ float 0.555570245
	.long	1062051586              @ float 0.803207516
	.long	1058570176              @ float 0.59569931
	.long	1061544963              @ float 0.773010432
	.long	1059219354              @ float 0.634393334
	.long	1061007097              @ float 0.74095112
	.long	1059842890              @ float 0.671558976
	.long	1060439283              @ float 0.707106769
	.long	1060439283              @ float 0.707106769
	.long	1059842889              @ float 0.671558916
	.long	1061007098              @ float 0.74095118
	.long	1059219353              @ float 0.634393274
	.long	1061544963              @ float 0.773010432
	.long	1058570176              @ float 0.59569931
	.long	1062051586              @ float 0.803207516
	.long	1057896921              @ float 0.555570185
	.long	1062525746              @ float 0.831469655
	.long	1057201212              @ float 0.514102697
	.long	1062966299              @ float 0.85772866
	.long	1056004839              @ float 0.471396655
	.long	1063372184              @ float 0.881921291
	.long	1054533761              @ float 0.427555114
	.long	1063742424              @ float 0.903989315
	.long	1053028117              @ float 0.382683426
	.long	1064076126              @ float 0.923879504
	.long	1051491539              @ float 0.336889833
	.long	1064372488              @ float 0.941544055
	.long	1049927728              @ float 0.290284634
	.long	1064630795              @ float 0.956940352
	.long	1048104904              @ float 0.242980123
	.long	1064850424              @ float 0.970031261
	.long	1044891068              @ float 0.195090234
	.long	1065030847              @ float 0.98078531
	.long	1041645701              @ float 0.146730497
	.long	1065171628              @ float 0.989176511
	.long	1036565813              @ float 0.0980171337
	.long	1065272429              @ float 0.995184719
	.long	1028193065              @ float 0.04906765
	.long	1065333007              @ float 0.998795449
	.long	3007036718              @ float -4.37113883E-8
	.long	1065353216              @ float 1
	.long	3175676737              @ float -0.0490677394
	.long	1065333007              @ float 0.998795449
	.long	3184049473              @ float -0.0980172231
	.long	1065272429              @ float 0.995184719
	.long	3189129354              @ float -0.146730572
	.long	1065171628              @ float 0.989176511
	.long	3192374722              @ float -0.195090324
	.long	1065030846              @ float 0.98078525
	.long	3195588557              @ float -0.242980197
	.long	1064850424              @ float 0.970031261
	.long	3197411379              @ float -0.290284723
	.long	1064630794              @ float 0.956940293
	.long	3198975190              @ float -0.336889923
	.long	1064372488              @ float 0.941544055
	.long	3200511768              @ float -0.382683516
	.long	1064076126              @ float 0.923879504
	.long	3202017408              @ float -0.427555084
	.long	1063742424              @ float 0.903989315
	.long	3203488493              @ float -0.471396834
	.long	1063372183              @ float 0.881921231
	.long	3204684861              @ float -0.514102757
	.long	1062966298              @ float 0.8577286
	.long	3205380572              @ float -0.555570364
	.long	1062525744              @ float 0.831469535
	.long	3206053825              @ float -0.59569937
	.long	1062051586              @ float 0.803207516
	.long	3206703001              @ float -0.634393274
	.long	1061544964              @ float 0.773010492
	.long	3207326539              @ float -0.671559035
	.long	1061007096              @ float 0.740951061
	.long	3207922931              @ float -0.707106769
	.long	1060439283              @ float 0.707106769
	.long	3208490747              @ float -0.74095124
	.long	1059842888              @ float 0.671558856
	.long	3209028612              @ float -0.773010492
	.long	1059219353              @ float 0.634393274
	.long	3209535236              @ float -0.803207636
	.long	1058570173              @ float 0.595699131
	.long	3210009394              @ float -0.831469655
	.long	1057896921              @ float 0.555570185
	.long	3210449946              @ float -0.8577286
	.long	1057201213              @ float 0.514102757
	.long	3210855833              @ float -0.88192135
	.long	1056004838              @ float 0.471396625
	.long	3211226072              @ float -0.903989315
	.long	1054533759              @ float 0.427555054
	.long	3211559776              @ float -0.923879623
	.long	1053028112              @ float 0.382683277
	.long	3211856137              @ float -0.941544115
	.long	1051491538              @ float 0.336889803
	.long	3212114443              @ float -0.956940352
	.long	1049927731              @ float 0.290284723
	.long	3212334072              @ float -0.970031261
	.long	1048104901              @ float 0.242980078
	.long	3212514495              @ float -0.98078531
	.long	1044891073              @ float 0.195090309
	.long	3212655276              @ float -0.989176511
	.long	1041645690              @ float 0.146730334
	.long	3212756077              @ float -0.995184719
	.long	1036565808              @ float 0.0980170965
	.long	3212816655              @ float -0.998795449
	.long	1028193021              @ float 0.0490674861
	.size	twiddles_64, 512

	.type	twiddles_128,%object    @ @twiddles_128
	.p2align	4
twiddles_128:
	.long	1065353216              @ float 1
	.long	0                       @ float 0
	.long	1065348163              @ float 0.999698817
	.long	1019808432              @ float 0.024541229
	.long	1065333007              @ float 0.998795449
	.long	1028193072              @ float 0.0490676761
	.long	1065307757              @ float 0.997290432
	.long	1033283845              @ float 0.0735645667
	.long	1065272429              @ float 0.995184719
	.long	1036565814              @ float 0.0980171412
	.long	1065227044              @ float 0.992479562
	.long	1039839859              @ float 0.122410677
	.long	1065171628              @ float 0.989176511
	.long	1041645699              @ float 0.146730468
	.long	1065106216              @ float 0.985277652
	.long	1043271843              @ float 0.170961902
	.long	1065030846              @ float 0.98078525
	.long	1044891074              @ float 0.195090324
	.long	1064945565              @ float 0.975702106
	.long	1046502419              @ float 0.219101235
	.long	1064850424              @ float 0.970031261
	.long	1048104909              @ float 0.242980197
	.long	1064745479              @ float 0.963776051
	.long	1049136788              @ float 0.266712785
	.long	1064630795              @ float 0.956940352
	.long	1049927729              @ float 0.290284663
	.long	1064506439              @ float 0.949528157
	.long	1050712805              @ float 0.313681751
	.long	1064372488              @ float 0.941544055
	.long	1051491540              @ float 0.336889863
	.long	1064229022              @ float 0.932992815
	.long	1052263466              @ float 0.359895051
	.long	1064076126              @ float 0.923879504
	.long	1053028118              @ float 0.382683456
	.long	1063913894              @ float 0.914209723
	.long	1053785035              @ float 0.40524134
	.long	1063742424              @ float 0.903989315
	.long	1054533760              @ float 0.427555084
	.long	1063561817              @ float 0.893224298
	.long	1055273845              @ float 0.449611336
	.long	1063372183              @ float 0.881921231
	.long	1056004842              @ float 0.471396744
	.long	1063173637              @ float 0.870086967
	.long	1056726312              @ float 0.492898226
	.long	1062966298              @ float 0.8577286
	.long	1057201213              @ float 0.514102757
	.long	1062750291              @ float 0.844853579
	.long	1057551771              @ float 0.534997642
	.long	1062525745              @ float 0.831469595
	.long	1057896922              @ float 0.555570245
	.long	1062292797              @ float 0.817584812
	.long	1058236459              @ float 0.575808227
	.long	1062051586              @ float 0.803207516
	.long	1058570176              @ float 0.59569931
	.long	1061802258              @ float 0.788346409
	.long	1058897874              @ float 0.615231633
	.long	1061544963              @ float 0.773010432
	.long	1059219354              @ float 0.634393334
	.long	1061279856              @ float 0.757208824
	.long	1059534422              @ float 0.653172851
	.long	1061007097              @ float 0.74095112
	.long	1059842890              @ float 0.671558976
	.long	1060726850              @ float 0.724247098
	.long	1060144571              @ float 0.689540565
	.long	1060439283              @ float 0.707106769
	.long	1060439283              @ float 0.707106769
	.long	1060144570              @ float 0.689540505
	.long	1060726850              @ float 0.724247098
	.long	1059842889              @ float 0.671558916
	.long	1061007098              @ float 0.74095118
	.long	1059534421              @ float 0.653172791
	.long	1061279857              @ float 0.757208883
	.long	1059219353              @ float 0.634393274
	.long	1061544963              @ float 0.773010432
	.long	1058897873              @ float 0.615231573
	.long	1061802258              @ float 0.788346409
	.long	1058570176              @ float 0.59569931
	.long	1062051586              @ float 0.803207516
	.long	1058236458              @ float 0.575808167
	.long	1062292797              @ float 0.817584812
	.long	1057896921              @ float 0.555570185
	.long	1062525746              @ float 0.831469655
	.long	1057551771              @ float 0.534997642
	.long	1062750291              @ float 0.844853579
	.long	1057201212              @ float 0.514102697
	.long	1062966299              @ float 0.85772866
	.long	1056726311              @ float 0.492898196
	.long	1063173637              @ float 0.870086967
	.long	1056004839              @ float 0.471396655
	.long	1063372184              @ float 0.881921291
	.long	1055273844              @ float 0.449611306
	.long	1063561817              @ float 0.893224298
	.long	1054533761              @ float 0.427555114
	.long	1063742424              @ float 0.903989315
	.long	1053785033              @ float 0.405241281
	.long	1063913895              @ float 0.914209783
	.long	1053028117              @ float 0.382683426
	.long	1064076126              @ float 0.923879504
	.long	1052263463              @ float 0.359894961
	.long	1064229022              @ float 0.932992815
	.long	1051491539              @ float 0.336889833
	.long	1064372488              @ float 0.941544055
	.long	1050712802              @ float 0.313681662
	.long	1064506440              @ float 0.949528217
	.long	1049927728              @ float 0.290284634
	.long	1064630795              @ float 0.956940352
	.long	1049136787              @ float 0.266712755
	.long	1064745479              @ float 0.963776051
	.long	1048104904              @ float 0.242980123
	.long	1064850424              @ float 0.970031261
	.long	1046502418              @ float 0.21910122
	.long	1064945565              @ float 0.975702106
	.long	1044891068              @ float 0.195090234
	.long	1065030847              @ float 0.98078531
	.long	1043271840              @ float 0.170961857
	.long	1065106216              @ float 0.985277652
	.long	1041645701              @ float 0.146730497
	.long	1065171628              @ float 0.989176511
	.long	1039839852              @ float 0.122410625
	.long	1065227044              @ float 0.992479562
	.long	1036565813              @ float 0.0980171337
	.long	1065272429              @ float 0.995184719
	.long	1033283835              @ float 0.0735644922
	.long	1065307757              @ float 0.997290432
	.long	1028193065              @ float 0.04906765
	.long	1065333007              @ float 0.998795449
	.long	1019808382              @ float 0.0245411359
	.long	1065348163              @ float 0.999698817
	.long	3007036718              @ float -4.37113883E-8
	.long	1065353216              @ float 1
	.long	3167292077              @ float -0.0245412234
	.long	1065348163              @ float 0.999698817
	.long	3175676737              @ float -0.0490677394
	.long	1065333007              @ float 0.998795449
	.long	3180767494              @ float -0.0735645741
	.long	1065307757              @ float 0.997290432
	.long	3184049473              @ float -0.0980172231
	.long	1065272429              @ float 0.995184719
	.long	3187323511              @ float -0.122410707
	.long	1065227043              @ float 0.992479503
	.long	3189129354              @ float -0.146730572
	.long	1065171628              @ float 0.989176511
	.long	3190755494              @ float -0.170961946
	.long	1065106216              @ float 0.985277652
	.long	3192374722              @ float -0.195090324
	.long	1065030846              @ float 0.98078525
	.long	3193986072              @ float -0.21910131
	.long	1064945565              @ float 0.975702106
	.long	3195588557              @ float -0.242980197
	.long	1064850424              @ float 0.970031261
	.long	3196620438              @ float -0.266712844
	.long	1064745479              @ float 0.963776051
	.long	3197411379              @ float -0.290284723
	.long	1064630794              @ float 0.956940293
	.long	3198196452              @ float -0.313681722
	.long	1064506439              @ float 0.949528157
	.long	3198975190              @ float -0.336889923
	.long	1064372488              @ float 0.941544055
	.long	3199747114              @ float -0.359895051
	.long	1064229022              @ float 0.932992815
	.long	3200511768              @ float -0.382683516
	.long	1064076126              @ float 0.923879504
	.long	3201268683              @ float -0.40524134
	.long	1063913894              @ float 0.914209723
	.long	3202017408              @ float -0.427555084
	.long	1063742424              @ float 0.903989315
	.long	3202757494              @ float -0.449611366
	.long	1063561817              @ float 0.893224298
	.long	3203488493              @ float -0.471396834
	.long	1063372183              @ float 0.881921231
	.long	3204209958              @ float -0.492898166
	.long	1063173638              @ float 0.870087027
	.long	3204684861              @ float -0.514102757
	.long	1062966298              @ float 0.8577286
	.long	3205035420              @ float -0.534997702
	.long	1062750290              @ float 0.84485352
	.long	3205380572              @ float -0.555570364
	.long	1062525744              @ float 0.831469535
	.long	3205720106              @ float -0.575808167
	.long	1062292797              @ float 0.817584812
	.long	3206053825              @ float -0.59569937
	.long	1062051586              @ float 0.803207516
	.long	3206381523              @ float -0.615231692
	.long	1061802257              @ float 0.78834635
	.long	3206703001              @ float -0.634393274
	.long	1061544964              @ float 0.773010492
	.long	3207018070              @ float -0.653172851
	.long	1061279856              @ float 0.757208824
	.long	3207326539              @ float -0.671559035
	.long	1061007096              @ float 0.740951061
	.long	3207628221              @ float -0.689540684
	.long	1060726848              @ float 0.724246978
	.long	3207922931              @ float -0.707106769
	.long	1060439283              @ float 0.707106769
	.long	3208210499              @ float -0.724247157
	.long	1060144570              @ float 0.689540505
	.long	3208490747              @ float -0.74095124
	.long	1059842888              @ float 0.671558856
	.long	3208763504              @ float -0.757208824
	.long	1059534422              @ float 0.653172851
	.long	3209028612              @ float -0.773010492
	.long	1059219353              @ float 0.634393274
	.long	3209285907              @ float -0.788346469
	.long	1058897872              @ float 0.615231514
	.long	3209535236              @ float -0.803207636
	.long	1058570173              @ float 0.595699131
	.long	3209776445              @ float -0.817584812
	.long	1058236458              @ float 0.575808167
	.long	3210009394              @ float -0.831469655
	.long	1057896921              @ float 0.555570185
	.long	3210233940              @ float -0.84485364
	.long	1057551768              @ float 0.534997463
	.long	3210449946              @ float -0.8577286
	.long	1057201213              @ float 0.514102757
	.long	3210657286              @ float -0.870087027
	.long	1056726309              @ float 0.492898136
	.long	3210855833              @ float -0.88192135
	.long	1056004838              @ float 0.471396625
	.long	3211045465              @ float -0.893224298
	.long	1055273846              @ float 0.449611366
	.long	3211226072              @ float -0.903989315
	.long	1054533759              @ float 0.427555054
	.long	3211397543              @ float -0.914209783
	.long	1053785031              @ float 0.405241221
	.long	3211559776              @ float -0.923879623
	.long	1053028112              @ float 0.382683277
	.long	3211712670              @ float -0.932992815
	.long	1052263466              @ float 0.359895051
	.long	3211856137              @ float -0.941544115
	.long	1051491538              @ float 0.336889803
	.long	3211990088              @ float -0.949528217
	.long	1050712800              @ float 0.313681602
	.long	3212114443              @ float -0.956940352
	.long	1049927731              @ float 0.290284723
	.long	3212229127              @ float -0.963776051
	.long	1049136786              @ float 0.266712725
	.long	3212334072              @ float -0.970031261
	.long	1048104901              @ float 0.242980078
	.long	3212429214              @ float -0.975702166
	.long	1046502408              @ float 0.219101071
	.long	3212514495              @ float -0.98078531
	.long	1044891073              @ float 0.195090309
	.long	3212589864              @ float -0.985277652
	.long	1043271837              @ float 0.170961812
	.long	3212655276              @ float -0.989176511
	.long	1041645690              @ float 0.146730334
	.long	3212710691              @ float -0.992479503
	.long	1039839862              @ float 0.1224107
	.long	3212756077              @ float -0.995184719
	.long	1036565808              @ float 0.0980170965
	.long	3212791406              @ float -0.997290492
	.long	1033283829              @ float 0.0735644475
	.long	3212816655              @ float -0.998795449
	.long	1028193021              @ float 0.0490674861
	.long	3212831811              @ float -0.999698817
	.long	1019808422              @ float 0.0245412104
	.size	twiddles_128, 1024

	.type	twiddles_256,%object    @ @twiddles_256
	.p2align	4
twiddles_256:
	.long	1065353216              @ float 1
	.long	0                       @ float 0
	.long	1065351953              @ float 0.999924719
	.long	1011420816              @ float 0.0122715384
	.long	1065348163              @ float 0.999698817
	.long	1019808432              @ float 0.024541229
	.long	1065341847              @ float 0.999322354
	.long	1024901932              @ float 0.0368072242
	.long	1065333007              @ float 0.998795449
	.long	1028193072              @ float 0.0490676761
	.long	1065321643              @ float 0.998118102
	.long	1031482229              @ float 0.0613207407
	.long	1065307757              @ float 0.997290432
	.long	1033283845              @ float 0.0735645667
	.long	1065291352              @ float 0.996312618
	.long	1034925697              @ float 0.0857973173
	.long	1065272429              @ float 0.995184719
	.long	1036565814              @ float 0.0980171412
	.long	1065250992              @ float 0.993906974
	.long	1038203950              @ float 0.110222206
	.long	1065227044              @ float 0.992479562
	.long	1039839859              @ float 0.122410677
	.long	1065200588              @ float 0.990902662
	.long	1040830343              @ float 0.134580716
	.long	1065171628              @ float 0.989176511
	.long	1041645699              @ float 0.146730468
	.long	1065140169              @ float 0.987301409
	.long	1042459574              @ float 0.15885815
	.long	1065106216              @ float 0.985277652
	.long	1043271843              @ float 0.170961902
	.long	1065069773              @ float 0.98310548
	.long	1044082383              @ float 0.183039889
	.long	1065030846              @ float 0.98078525
	.long	1044891074              @ float 0.195090324
	.long	1064989442              @ float 0.978317379
	.long	1045697794              @ float 0.207111388
	.long	1064945565              @ float 0.975702106
	.long	1046502419              @ float 0.219101235
	.long	1064899224              @ float 0.972939968
	.long	1047304832              @ float 0.231058121
	.long	1064850424              @ float 0.970031261
	.long	1048104909              @ float 0.242980197
	.long	1064799173              @ float 0.966976463
	.long	1048739265              @ float 0.254865676
	.long	1064745479              @ float 0.963776051
	.long	1049136788              @ float 0.266712785
	.long	1064689350              @ float 0.960430502
	.long	1049532962              @ float 0.27851969
	.long	1064630795              @ float 0.956940352
	.long	1049927729              @ float 0.290284663
	.long	1064569821              @ float 0.953306019
	.long	1050321030              @ float 0.302005947
	.long	1064506439              @ float 0.949528157
	.long	1050712805              @ float 0.313681751
	.long	1064440658              @ float 0.945607304
	.long	1051102995              @ float 0.32531032
	.long	1064372488              @ float 0.941544055
	.long	1051491540              @ float 0.336889863
	.long	1064301939              @ float 0.937339007
	.long	1051878383              @ float 0.348418683
	.long	1064229022              @ float 0.932992815
	.long	1052263466              @ float 0.359895051
	.long	1064153747              @ float 0.928506076
	.long	1052646730              @ float 0.371317208
	.long	1064076126              @ float 0.923879504
	.long	1053028118              @ float 0.382683456
	.long	1063996172              @ float 0.919113874
	.long	1053407572              @ float 0.393992066
	.long	1063913894              @ float 0.914209723
	.long	1053785035              @ float 0.40524134
	.long	1063829307              @ float 0.909167945
	.long	1054160450              @ float 0.416429579
	.long	1063742424              @ float 0.903989315
	.long	1054533760              @ float 0.427555084
	.long	1063653256              @ float 0.898674488
	.long	1054904911              @ float 0.438616246
	.long	1063561817              @ float 0.893224298
	.long	1055273845              @ float 0.449611336
	.long	1063468122              @ float 0.887639641
	.long	1055640507              @ float 0.460538715
	.long	1063372183              @ float 0.881921231
	.long	1056004842              @ float 0.471396744
	.long	1063274017              @ float 0.876070082
	.long	1056366794              @ float 0.482183754
	.long	1063173637              @ float 0.870086967
	.long	1056726312              @ float 0.492898226
	.long	1063071059              @ float 0.863972842
	.long	1057023972              @ float 0.50353837
	.long	1062966298              @ float 0.8577286
	.long	1057201213              @ float 0.514102757
	.long	1062859370              @ float 0.851355195
	.long	1057377155              @ float 0.524589717
	.long	1062750291              @ float 0.844853579
	.long	1057551771              @ float 0.534997642
	.long	1062639077              @ float 0.838224709
	.long	1057725035              @ float 0.545324981
	.long	1062525745              @ float 0.831469595
	.long	1057896922              @ float 0.555570245
	.long	1062410312              @ float 0.824589252
	.long	1058067405              @ float 0.565731823
	.long	1062292797              @ float 0.817584812
	.long	1058236459              @ float 0.575808227
	.long	1062173215              @ float 0.81045717
	.long	1058404058              @ float 0.585797906
	.long	1062051586              @ float 0.803207516
	.long	1058570176              @ float 0.59569931
	.long	1061927928              @ float 0.795836925
	.long	1058734789              @ float 0.605511009
	.long	1061802258              @ float 0.788346409
	.long	1058897874              @ float 0.615231633
	.long	1061674597              @ float 0.780737221
	.long	1059059403              @ float 0.624859511
	.long	1061544963              @ float 0.773010432
	.long	1059219354              @ float 0.634393334
	.long	1061413376              @ float 0.765167236
	.long	1059377701              @ float 0.643831551
	.long	1061279856              @ float 0.757208824
	.long	1059534422              @ float 0.653172851
	.long	1061144423              @ float 0.749136388
	.long	1059689493              @ float 0.662415802
	.long	1061007097              @ float 0.74095112
	.long	1059842890              @ float 0.671558976
	.long	1060867899              @ float 0.732654273
	.long	1059994590              @ float 0.680601001
	.long	1060726850              @ float 0.724247098
	.long	1060144571              @ float 0.689540565
	.long	1060583970              @ float 0.715730786
	.long	1060292810              @ float 0.698376298
	.long	1060439283              @ float 0.707106769
	.long	1060439283              @ float 0.707106769
	.long	1060292809              @ float 0.698376238
	.long	1060583971              @ float 0.715730845
	.long	1060144570              @ float 0.689540505
	.long	1060726850              @ float 0.724247098
	.long	1059994590              @ float 0.680601001
	.long	1060867899              @ float 0.732654273
	.long	1059842889              @ float 0.671558916
	.long	1061007098              @ float 0.74095118
	.long	1059689492              @ float 0.662415743
	.long	1061144423              @ float 0.749136388
	.long	1059534421              @ float 0.653172791
	.long	1061279857              @ float 0.757208883
	.long	1059377701              @ float 0.643831551
	.long	1061413377              @ float 0.765167295
	.long	1059219353              @ float 0.634393274
	.long	1061544963              @ float 0.773010432
	.long	1059059402              @ float 0.624859452
	.long	1061674598              @ float 0.78073728
	.long	1058897873              @ float 0.615231573
	.long	1061802258              @ float 0.788346409
	.long	1058734789              @ float 0.605511009
	.long	1061927928              @ float 0.795836925
	.long	1058570176              @ float 0.59569931
	.long	1062051586              @ float 0.803207516
	.long	1058404057              @ float 0.585797846
	.long	1062173215              @ float 0.81045717
	.long	1058236458              @ float 0.575808167
	.long	1062292797              @ float 0.817584812
	.long	1058067405              @ float 0.565731823
	.long	1062410313              @ float 0.824589312
	.long	1057896921              @ float 0.555570185
	.long	1062525746              @ float 0.831469655
	.long	1057725035              @ float 0.545324981
	.long	1062639077              @ float 0.838224709
	.long	1057551771              @ float 0.534997642
	.long	1062750291              @ float 0.844853579
	.long	1057377154              @ float 0.524589658
	.long	1062859370              @ float 0.851355195
	.long	1057201212              @ float 0.514102697
	.long	1062966299              @ float 0.85772866
	.long	1057023973              @ float 0.50353843
	.long	1063071059              @ float 0.863972842
	.long	1056726311              @ float 0.492898196
	.long	1063173637              @ float 0.870086967
	.long	1056366793              @ float 0.482183725
	.long	1063274018              @ float 0.876070141
	.long	1056004839              @ float 0.471396655
	.long	1063372184              @ float 0.881921291
	.long	1055640507              @ float 0.460538715
	.long	1063468122              @ float 0.887639641
	.long	1055273844              @ float 0.449611306
	.long	1063561817              @ float 0.893224298
	.long	1054904909              @ float 0.438616186
	.long	1063653256              @ float 0.898674488
	.long	1054533761              @ float 0.427555114
	.long	1063742424              @ float 0.903989315
	.long	1054160449              @ float 0.416429549
	.long	1063829308              @ float 0.909168005
	.long	1053785033              @ float 0.405241281
	.long	1063913895              @ float 0.914209783
	.long	1053407568              @ float 0.393991947
	.long	1063996172              @ float 0.919113874
	.long	1053028117              @ float 0.382683426
	.long	1064076126              @ float 0.923879504
	.long	1052646728              @ float 0.371317148
	.long	1064153747              @ float 0.928506076
	.long	1052263463              @ float 0.359894961
	.long	1064229022              @ float 0.932992815
	.long	1051878383              @ float 0.348418683
	.long	1064301939              @ float 0.937339007
	.long	1051491539              @ float 0.336889833
	.long	1064372488              @ float 0.941544055
	.long	1051102992              @ float 0.32531023
	.long	1064440659              @ float 0.945607364
	.long	1050712802              @ float 0.313681662
	.long	1064506440              @ float 0.949528217
	.long	1050321030              @ float 0.302005947
	.long	1064569821              @ float 0.953306019
	.long	1049927728              @ float 0.290284634
	.long	1064630795              @ float 0.956940352
	.long	1049532959              @ float 0.278519601
	.long	1064689351              @ float 0.960430562
	.long	1049136787              @ float 0.266712755
	.long	1064745479              @ float 0.963776051
	.long	1048739264              @ float 0.254865646
	.long	1064799173              @ float 0.966976463
	.long	1048104904              @ float 0.242980123
	.long	1064850424              @ float 0.970031261
	.long	1047304833              @ float 0.231058136
	.long	1064899224              @ float 0.972939968
	.long	1046502418              @ float 0.21910122
	.long	1064945565              @ float 0.975702106
	.long	1045697790              @ float 0.207111329
	.long	1064989442              @ float 0.978317379
	.long	1044891068              @ float 0.195090234
	.long	1065030847              @ float 0.98078531
	.long	1044082383              @ float 0.183039889
	.long	1065069773              @ float 0.98310548
	.long	1043271840              @ float 0.170961857
	.long	1065106216              @ float 0.985277652
	.long	1042459569              @ float 0.158858076
	.long	1065140169              @ float 0.987301409
	.long	1041645701              @ float 0.146730497
	.long	1065171628              @ float 0.989176511
	.long	1040830341              @ float 0.134580687
	.long	1065200588              @ float 0.990902662
	.long	1039839852              @ float 0.122410625
	.long	1065227044              @ float 0.992479562
	.long	1038203938              @ float 0.110222116
	.long	1065250992              @ float 0.993906974
	.long	1036565813              @ float 0.0980171337
	.long	1065272429              @ float 0.995184719
	.long	1034925691              @ float 0.0857972726
	.long	1065291352              @ float 0.996312618
	.long	1033283835              @ float 0.0735644922
	.long	1065307757              @ float 0.997290432
	.long	1031482231              @ float 0.0613207482
	.long	1065321643              @ float 0.998118102
	.long	1028193065              @ float 0.04906765
	.long	1065333007              @ float 0.998795449
	.long	1024901916              @ float 0.0368071645
	.long	1065341848              @ float 0.999322414
	.long	1019808382              @ float 0.0245411359
	.long	1065348163              @ float 0.999698817
	.long	1011420806              @ float 0.0122715291
	.long	1065351953              @ float 0.999924719
	.long	3007036718              @ float -4.37113883E-8
	.long	1065353216              @ float 1
	.long	3158904548              @ float -0.0122716166
	.long	1065351953              @ float 0.999924719
	.long	3167292077              @ float -0.0245412234
	.long	1065348163              @ float 0.999698817
	.long	3172385587              @ float -0.0368072502
	.long	1065341847              @ float 0.999322354
	.long	3175676737              @ float -0.0490677394
	.long	1065333007              @ float 0.998795449
	.long	3178965902              @ float -0.0613208339
	.long	1065321643              @ float 0.998118102
	.long	3180767494              @ float -0.0735645741
	.long	1065307757              @ float 0.997290432
	.long	3182409351              @ float -0.085797362
	.long	1065291352              @ float 0.996312618
	.long	3184049473              @ float -0.0980172231
	.long	1065272429              @ float 0.995184719
	.long	3185687598              @ float -0.110222206
	.long	1065250992              @ float 0.993906974
	.long	3187323511              @ float -0.122410707
	.long	1065227043              @ float 0.992479503
	.long	3188313995              @ float -0.134580776
	.long	1065200587              @ float 0.990902602
	.long	3189129354              @ float -0.146730572
	.long	1065171628              @ float 0.989176511
	.long	3189943223              @ float -0.158858165
	.long	1065140169              @ float 0.987301409
	.long	3190755494              @ float -0.170961946
	.long	1065106216              @ float 0.985277652
	.long	3191566037              @ float -0.183039978
	.long	1065069773              @ float 0.98310548
	.long	3192374722              @ float -0.195090324
	.long	1065030846              @ float 0.98078525
	.long	3193181444              @ float -0.207111418
	.long	1064989442              @ float 0.978317379
	.long	3193986072              @ float -0.21910131
	.long	1064945565              @ float 0.975702106
	.long	3194788486              @ float -0.23105821
	.long	1064899223              @ float 0.972939908
	.long	3195588557              @ float -0.242980197
	.long	1064850424              @ float 0.970031261
	.long	3196222914              @ float -0.254865706
	.long	1064799173              @ float 0.966976463
	.long	3196620438              @ float -0.266712844
	.long	1064745479              @ float 0.963776051
	.long	3197016610              @ float -0.27851969
	.long	1064689350              @ float 0.960430502
	.long	3197411379              @ float -0.290284723
	.long	1064630794              @ float 0.956940293
	.long	3197804681              @ float -0.302006036
	.long	1064569821              @ float 0.953306019
	.long	3198196452              @ float -0.313681722
	.long	1064506439              @ float 0.949528157
	.long	3198586643              @ float -0.32531032
	.long	1064440658              @ float 0.945607304
	.long	3198975190              @ float -0.336889923
	.long	1064372488              @ float 0.941544055
	.long	3199362034              @ float -0.348418772
	.long	1064301938              @ float 0.937338948
	.long	3199747114              @ float -0.359895051
	.long	1064229022              @ float 0.932992815
	.long	3200130379              @ float -0.371317238
	.long	1064153747              @ float 0.928506076
	.long	3200511768              @ float -0.382683516
	.long	1064076126              @ float 0.923879504
	.long	3200891219              @ float -0.393992037
	.long	1063996172              @ float 0.919113874
	.long	3201268683              @ float -0.40524134
	.long	1063913894              @ float 0.914209723
	.long	3201644096              @ float -0.41642952
	.long	1063829308              @ float 0.909168005
	.long	3202017408              @ float -0.427555084
	.long	1063742424              @ float 0.903989315
	.long	3202388559              @ float -0.438616246
	.long	1063653255              @ float 0.898674428
	.long	3202757494              @ float -0.449611366
	.long	1063561817              @ float 0.893224298
	.long	3203124158              @ float -0.460538805
	.long	1063468121              @ float 0.887639582
	.long	3203488493              @ float -0.471396834
	.long	1063372183              @ float 0.881921231
	.long	3203850447              @ float -0.482183903
	.long	1063274016              @ float 0.876070023
	.long	3204209958              @ float -0.492898166
	.long	1063173638              @ float 0.870087027
	.long	3204507620              @ float -0.50353837
	.long	1063071059              @ float 0.863972842
	.long	3204684861              @ float -0.514102757
	.long	1062966298              @ float 0.8577286
	.long	3204860803              @ float -0.524589717
	.long	1062859369              @ float 0.851355135
	.long	3205035420              @ float -0.534997702
	.long	1062750290              @ float 0.84485352
	.long	3205208685              @ float -0.5453251
	.long	1062639076              @ float 0.838224649
	.long	3205380572              @ float -0.555570364
	.long	1062525744              @ float 0.831469535
	.long	3205551052              @ float -0.565731764
	.long	1062410313              @ float 0.824589312
	.long	3205720106              @ float -0.575808167
	.long	1062292797              @ float 0.817584812
	.long	3205887706              @ float -0.585797906
	.long	1062173215              @ float 0.81045717
	.long	3206053825              @ float -0.59569937
	.long	1062051586              @ float 0.803207516
	.long	3206218439              @ float -0.605511128
	.long	1061927927              @ float 0.795836865
	.long	3206381523              @ float -0.615231692
	.long	1061802257              @ float 0.78834635
	.long	3206543053              @ float -0.624859631
	.long	1061674595              @ float 0.780737102
	.long	3206703001              @ float -0.634393274
	.long	1061544964              @ float 0.773010492
	.long	3206861349              @ float -0.643831551
	.long	1061413376              @ float 0.765167236
	.long	3207018070              @ float -0.653172851
	.long	1061279856              @ float 0.757208824
	.long	3207173141              @ float -0.662415802
	.long	1061144422              @ float 0.749136329
	.long	3207326539              @ float -0.671559035
	.long	1061007096              @ float 0.740951061
	.long	3207478240              @ float -0.68060112
	.long	1060867897              @ float 0.732654154
	.long	3207628221              @ float -0.689540684
	.long	1060726848              @ float 0.724246978
	.long	3207776457              @ float -0.698376238
	.long	1060583971              @ float 0.715730845
	.long	3207922931              @ float -0.707106769
	.long	1060439283              @ float 0.707106769
	.long	3208067619              @ float -0.715730845
	.long	1060292809              @ float 0.698376238
	.long	3208210499              @ float -0.724247157
	.long	1060144570              @ float 0.689540505
	.long	3208351548              @ float -0.732654333
	.long	1059994589              @ float 0.680600941
	.long	3208490747              @ float -0.74095124
	.long	1059842888              @ float 0.671558856
	.long	3208628073              @ float -0.749136507
	.long	1059689490              @ float 0.662415624
	.long	3208763504              @ float -0.757208824
	.long	1059534422              @ float 0.653172851
	.long	3208897025              @ float -0.765167295
	.long	1059377701              @ float 0.643831551
	.long	3209028612              @ float -0.773010492
	.long	1059219353              @ float 0.634393274
	.long	3209158246              @ float -0.78073728
	.long	1059059402              @ float 0.624859452
	.long	3209285907              @ float -0.788346469
	.long	1058897872              @ float 0.615231514
	.long	3209411577              @ float -0.795836985
	.long	1058734788              @ float 0.60551095
	.long	3209535236              @ float -0.803207636
	.long	1058570173              @ float 0.595699131
	.long	3209656863              @ float -0.81045717
	.long	1058404057              @ float 0.585797846
	.long	3209776445              @ float -0.817584812
	.long	1058236458              @ float 0.575808167
	.long	3209893961              @ float -0.824589312
	.long	1058067404              @ float 0.565731764
	.long	3210009394              @ float -0.831469655
	.long	1057896921              @ float 0.555570185
	.long	3210122726              @ float -0.838224768
	.long	1057725033              @ float 0.545324862
	.long	3210233940              @ float -0.84485364
	.long	1057551768              @ float 0.534997463
	.long	3210343020              @ float -0.851355314
	.long	1057377152              @ float 0.524589539
	.long	3210449946              @ float -0.8577286
	.long	1057201213              @ float 0.514102757
	.long	3210554707              @ float -0.863972842
	.long	1057023972              @ float 0.50353837
	.long	3210657286              @ float -0.870087027
	.long	1056726309              @ float 0.492898136
	.long	3210757666              @ float -0.876070141
	.long	1056366792              @ float 0.482183695
	.long	3210855833              @ float -0.88192135
	.long	1056004838              @ float 0.471396625
	.long	3210951771              @ float -0.887639701
	.long	1055640502              @ float 0.460538566
	.long	3211045465              @ float -0.893224298
	.long	1055273846              @ float 0.449611366
	.long	3211136904              @ float -0.898674488
	.long	1054904911              @ float 0.438616246
	.long	3211226072              @ float -0.903989315
	.long	1054533759              @ float 0.427555054
	.long	3211312956              @ float -0.909168005
	.long	1054160447              @ float 0.41642949
	.long	3211397543              @ float -0.914209783
	.long	1053785031              @ float 0.405241221
	.long	3211479820              @ float -0.919113874
	.long	1053407567              @ float 0.393991917
	.long	3211559776              @ float -0.923879623
	.long	1053028112              @ float 0.382683277
	.long	3211637395              @ float -0.928506076
	.long	1052646731              @ float 0.371317238
	.long	3211712670              @ float -0.932992815
	.long	1052263466              @ float 0.359895051
	.long	3211785587              @ float -0.937339007
	.long	1051878382              @ float 0.348418653
	.long	3211856137              @ float -0.941544115
	.long	1051491538              @ float 0.336889803
	.long	3211924307              @ float -0.945607364
	.long	1051102991              @ float 0.3253102
	.long	3211990088              @ float -0.949528217
	.long	1050712800              @ float 0.313681602
	.long	3212053470              @ float -0.953306078
	.long	1050321025              @ float 0.302005798
	.long	3212114443              @ float -0.956940352
	.long	1049927731              @ float 0.290284723
	.long	3212172998              @ float -0.960430502
	.long	1049532962              @ float 0.27851969
	.long	3212229127              @ float -0.963776051
	.long	1049136786              @ float 0.266712725
	.long	3212282821              @ float -0.966976463
	.long	1048739262              @ float 0.254865587
	.long	3212334072              @ float -0.970031261
	.long	1048104901              @ float 0.242980078
	.long	3212382872              @ float -0.972939968
	.long	1047304822              @ float 0.231057972
	.long	3212429214              @ float -0.975702166
	.long	1046502408              @ float 0.219101071
	.long	3212473090              @ float -0.978317379
	.long	1045697795              @ float 0.207111403
	.long	3212514495              @ float -0.98078531
	.long	1044891073              @ float 0.195090309
	.long	3212553421              @ float -0.98310548
	.long	1044082380              @ float 0.183039844
	.long	3212589864              @ float -0.985277652
	.long	1043271837              @ float 0.170961812
	.long	3212623817              @ float -0.987301409
	.long	1042459566              @ float 0.158858031
	.long	3212655276              @ float -0.989176511
	.long	1041645690              @ float 0.146730334
	.long	3212684236              @ float -0.990902662
	.long	1040830330              @ float 0.134580523
	.long	3212710691              @ float -0.992479503
	.long	1039839862              @ float 0.1224107
	.long	3212734640              @ float -0.993906974
	.long	1038203949              @ float 0.110222198
	.long	3212756077              @ float -0.995184719
	.long	1036565808              @ float 0.0980170965
	.long	3212775000              @ float -0.996312618
	.long	1034925685              @ float 0.0857972279
	.long	3212791406              @ float -0.997290492
	.long	1033283829              @ float 0.0735644475
	.long	3212805291              @ float -0.998118102
	.long	1031482187              @ float 0.0613205843
	.long	3212816655              @ float -0.998795449
	.long	1028193021              @ float 0.0490674861
	.long	3212825495              @ float -0.999322354
	.long	1024901936              @ float 0.0368072391
	.long	3212831811              @ float -0.999698817
	.long	1019808422              @ float 0.0245412104
	.long	3212835601              @ float -0.999924719
	.long	1011420759              @ float 0.0122714853
	.size	twiddles_256, 2048

	.type	g_3,%object             @ @g_3
	.local	g_3
	.comm	g_3,1024,16
	.type	filterStart_Node_1150,%object @ @filterStart_Node_1150
	.p2align	4
filterStart_Node_1150:
	.long	0                       @ 0x0
	.long	0                       @ 0x0
	.long	0                       @ 0x0
	.long	1                       @ 0x1
	.long	1                       @ 0x1
	.long	1                       @ 0x1
	.long	2                       @ 0x2
	.long	2                       @ 0x2
	.long	3                       @ 0x3
	.long	3                       @ 0x3
	.long	4                       @ 0x4
	.long	4                       @ 0x4
	.long	5                       @ 0x5
	.long	5                       @ 0x5
	.long	6                       @ 0x6
	.long	6                       @ 0x6
	.long	7                       @ 0x7
	.long	7                       @ 0x7
	.long	8                       @ 0x8
	.long	9                       @ 0x9
	.long	9                       @ 0x9
	.long	10                      @ 0xa
	.long	11                      @ 0xb
	.long	11                      @ 0xb
	.long	12                      @ 0xc
	.long	13                      @ 0xd
	.long	14                      @ 0xe
	.long	14                      @ 0xe
	.long	15                      @ 0xf
	.long	16                      @ 0x10
	.long	17                      @ 0x11
	.long	18                      @ 0x12
	.long	19                      @ 0x13
	.long	20                      @ 0x14
	.long	21                      @ 0x15
	.long	22                      @ 0x16
	.long	23                      @ 0x17
	.long	24                      @ 0x18
	.long	25                      @ 0x19
	.long	26                      @ 0x1a
	.long	27                      @ 0x1b
	.long	29                      @ 0x1d
	.long	30                      @ 0x1e
	.long	31                      @ 0x1f
	.long	32                      @ 0x20
	.long	34                      @ 0x22
	.long	35                      @ 0x23
	.long	37                      @ 0x25
	.long	38                      @ 0x26
	.long	40                      @ 0x28
	.long	42                      @ 0x2a
	.long	43                      @ 0x2b
	.long	45                      @ 0x2d
	.long	47                      @ 0x2f
	.long	49                      @ 0x31
	.long	50                      @ 0x32
	.long	52                      @ 0x34
	.long	54                      @ 0x36
	.long	57                      @ 0x39
	.long	59                      @ 0x3b
	.long	61                      @ 0x3d
	.long	63                      @ 0x3f
	.long	66                      @ 0x42
	.long	68                      @ 0x44
	.long	71                      @ 0x47
	.long	73                      @ 0x49
	.long	76                      @ 0x4c
	.long	79                      @ 0x4f
	.long	82                      @ 0x52
	.long	84                      @ 0x54
	.long	88                      @ 0x58
	.long	91                      @ 0x5b
	.long	94                      @ 0x5e
	.long	97                      @ 0x61
	.long	101                     @ 0x65
	.long	104                     @ 0x68
	.long	108                     @ 0x6c
	.long	112                     @ 0x70
	.long	116                     @ 0x74
	.long	120                     @ 0x78
	.size	filterStart_Node_1150, 320

	.type	filterCenter_Node_1150,%object @ @filterCenter_Node_1150
	.p2align	4
filterCenter_Node_1150:
	.long	0                       @ 0x0
	.long	0                       @ 0x0
	.long	1                       @ 0x1
	.long	1                       @ 0x1
	.long	1                       @ 0x1
	.long	2                       @ 0x2
	.long	2                       @ 0x2
	.long	3                       @ 0x3
	.long	3                       @ 0x3
	.long	4                       @ 0x4
	.long	4                       @ 0x4
	.long	5                       @ 0x5
	.long	5                       @ 0x5
	.long	6                       @ 0x6
	.long	6                       @ 0x6
	.long	7                       @ 0x7
	.long	7                       @ 0x7
	.long	8                       @ 0x8
	.long	9                       @ 0x9
	.long	9                       @ 0x9
	.long	10                      @ 0xa
	.long	11                      @ 0xb
	.long	11                      @ 0xb
	.long	12                      @ 0xc
	.long	13                      @ 0xd
	.long	14                      @ 0xe
	.long	14                      @ 0xe
	.long	15                      @ 0xf
	.long	16                      @ 0x10
	.long	17                      @ 0x11
	.long	18                      @ 0x12
	.long	19                      @ 0x13
	.long	20                      @ 0x14
	.long	21                      @ 0x15
	.long	22                      @ 0x16
	.long	23                      @ 0x17
	.long	24                      @ 0x18
	.long	25                      @ 0x19
	.long	26                      @ 0x1a
	.long	27                      @ 0x1b
	.long	29                      @ 0x1d
	.long	30                      @ 0x1e
	.long	31                      @ 0x1f
	.long	32                      @ 0x20
	.long	34                      @ 0x22
	.long	35                      @ 0x23
	.long	37                      @ 0x25
	.long	38                      @ 0x26
	.long	40                      @ 0x28
	.long	42                      @ 0x2a
	.long	43                      @ 0x2b
	.long	45                      @ 0x2d
	.long	47                      @ 0x2f
	.long	49                      @ 0x31
	.long	50                      @ 0x32
	.long	52                      @ 0x34
	.long	54                      @ 0x36
	.long	57                      @ 0x39
	.long	59                      @ 0x3b
	.long	61                      @ 0x3d
	.long	63                      @ 0x3f
	.long	66                      @ 0x42
	.long	68                      @ 0x44
	.long	71                      @ 0x47
	.long	73                      @ 0x49
	.long	76                      @ 0x4c
	.long	79                      @ 0x4f
	.long	82                      @ 0x52
	.long	84                      @ 0x54
	.long	88                      @ 0x58
	.long	91                      @ 0x5b
	.long	94                      @ 0x5e
	.long	97                      @ 0x61
	.long	101                     @ 0x65
	.long	104                     @ 0x68
	.long	108                     @ 0x6c
	.long	112                     @ 0x70
	.long	116                     @ 0x74
	.long	120                     @ 0x78
	.long	124                     @ 0x7c
	.size	filterCenter_Node_1150, 320

	.type	filterEnd_Node_1150,%object @ @filterEnd_Node_1150
	.p2align	4
filterEnd_Node_1150:
	.long	0                       @ 0x0
	.long	1                       @ 0x1
	.long	1                       @ 0x1
	.long	1                       @ 0x1
	.long	2                       @ 0x2
	.long	2                       @ 0x2
	.long	3                       @ 0x3
	.long	3                       @ 0x3
	.long	4                       @ 0x4
	.long	4                       @ 0x4
	.long	5                       @ 0x5
	.long	5                       @ 0x5
	.long	6                       @ 0x6
	.long	6                       @ 0x6
	.long	7                       @ 0x7
	.long	7                       @ 0x7
	.long	8                       @ 0x8
	.long	9                       @ 0x9
	.long	9                       @ 0x9
	.long	10                      @ 0xa
	.long	11                      @ 0xb
	.long	11                      @ 0xb
	.long	12                      @ 0xc
	.long	13                      @ 0xd
	.long	14                      @ 0xe
	.long	14                      @ 0xe
	.long	15                      @ 0xf
	.long	16                      @ 0x10
	.long	17                      @ 0x11
	.long	18                      @ 0x12
	.long	19                      @ 0x13
	.long	20                      @ 0x14
	.long	21                      @ 0x15
	.long	22                      @ 0x16
	.long	23                      @ 0x17
	.long	24                      @ 0x18
	.long	25                      @ 0x19
	.long	26                      @ 0x1a
	.long	27                      @ 0x1b
	.long	29                      @ 0x1d
	.long	30                      @ 0x1e
	.long	31                      @ 0x1f
	.long	32                      @ 0x20
	.long	34                      @ 0x22
	.long	35                      @ 0x23
	.long	37                      @ 0x25
	.long	38                      @ 0x26
	.long	40                      @ 0x28
	.long	42                      @ 0x2a
	.long	43                      @ 0x2b
	.long	45                      @ 0x2d
	.long	47                      @ 0x2f
	.long	49                      @ 0x31
	.long	50                      @ 0x32
	.long	52                      @ 0x34
	.long	54                      @ 0x36
	.long	57                      @ 0x39
	.long	59                      @ 0x3b
	.long	61                      @ 0x3d
	.long	63                      @ 0x3f
	.long	66                      @ 0x42
	.long	68                      @ 0x44
	.long	71                      @ 0x47
	.long	73                      @ 0x49
	.long	76                      @ 0x4c
	.long	79                      @ 0x4f
	.long	82                      @ 0x52
	.long	84                      @ 0x54
	.long	88                      @ 0x58
	.long	91                      @ 0x5b
	.long	94                      @ 0x5e
	.long	97                      @ 0x61
	.long	101                     @ 0x65
	.long	104                     @ 0x68
	.long	108                     @ 0x6c
	.long	112                     @ 0x70
	.long	116                     @ 0x74
	.long	120                     @ 0x78
	.long	124                     @ 0x7c
	.long	128                     @ 0x80
	.size	filterEnd_Node_1150, 320

	.type	g_4,%object             @ @g_4
	.local	g_4
	.comm	g_4,320,16
	.type	c_1,%object             @ @c_1
	.p2align	4
c_1:
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.long	1065353216              @ float 1
	.size	c_1, 320

	.type	g_5,%object             @ @g_5
	.local	g_5
	.comm	g_5,320,16
	.type	g_6,%object             @ @g_6
	.local	g_6
	.comm	g_6,320,16
	.type	.L__unnamed_12,%object  @ @0
	.section	.rodata.str1.1,"aMS",%progbits,1
.L__unnamed_12:
	.zero	1
	.size	.L__unnamed_12, 1

	.type	.L__unnamed_2,%object   @ @1
.L__unnamed_2:
	.asciz	"512"
	.size	.L__unnamed_2, 4

	.type	.L__unnamed_1,%object   @ @2
.L__unnamed_1:
	.asciz	"window_size"
	.size	.L__unnamed_1, 12

	.type	.L__unnamed_4,%object   @ @3
.L__unnamed_4:
	.asciz	"16000"
	.size	.L__unnamed_4, 6

	.type	.L__unnamed_3,%object   @ @4
.L__unnamed_3:
	.asciz	"sample_rate"
	.size	.L__unnamed_3, 12

	.type	.L__unnamed_6,%object   @ @5
.L__unnamed_6:
	.asciz	"80"
	.size	.L__unnamed_6, 3

	.type	.L__unnamed_5,%object   @ @6
.L__unnamed_5:
	.asciz	"filterbank_size"
	.size	.L__unnamed_5, 16

	.type	.L__unnamed_7,%object   @ @7
.L__unnamed_7:
	.asciz	"num_filters"
	.size	.L__unnamed_7, 12

	.type	.L__unnamed_9,%object   @ @8
.L__unnamed_9:
	.asciz	"mel"
	.size	.L__unnamed_9, 4

	.type	.L__unnamed_8,%object   @ @9
.L__unnamed_8:
	.asciz	"filterbank_type"
	.size	.L__unnamed_8, 16

	.type	.L__unnamed_11,%object  @ @10
.L__unnamed_11:
	.asciz	"true"
	.size	.L__unnamed_11, 5

	.type	.L__unnamed_10,%object  @ @11
.L__unnamed_10:
	.asciz	"log"
	.size	.L__unnamed_10, 4


	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 2	@ Tag_ABI_optimization_goals
