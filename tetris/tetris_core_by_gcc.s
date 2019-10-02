	.cpu cortex-m0
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 4
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"tetris_core.c"
	.text
	.align	1
	.global	usr_calc
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	usr_calc, %function
usr_calc:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ r0 - parameter from USR()
	@ r1 - memory offset for IchigoJam
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	ldr	r3, .L5				@load 0x8fa (X_OFFSET) to R3
	ldr	r2, .L5+4			@load 0x8ee (R_OFFSET) to R2
	ldrb	r3, [r1, r3]	@load_byte X to R3
	ldrb	r2, [r1, r2]	@load_byte R to R2
	str	r3, [sp]			@store R3 to SP+0 = R0??
	ldr	r3, .L5+8			@load 0x8fc (Y_OFFSET) to R3
	ldrb	r3, [r1, r3]	@load_byte Y to R3
	str	r3, [sp, #4]		@store R3 to SP+4 = R5??
	ldr	r3, .L5+12			@load 0x8ce (B_OFFSET) to R3
	ldrb	r3, [r1, r3]	@load_byte B to R3
	lsls	r3, r3, #2		@R3<<2
	adds	r3, r3, r2		@R3+=R2 -> R3 = B<<2 + R
	movs	r2, #129		@R2 = 129 (0x81)??
	lsls	r3, r3, #1
	lsls	r2, r2, #4
	adds	r3, r1, r3
	adds	r3, r3, r2
	ldrh	r5, [r3]
	movs	r2, #0
	movs	r3, #3
	movs	r4, r2
	mov	ip, r3
.L3:
	movs	r3, r5
	mov	r6, ip
	asrs	r3, r3, r2
	ands	r3, r6
	ldr	r6, [sp, #4]
	adds	r7, r2, #2
	adds	r3, r3, r6
	movs	r6, #144
	lsls	r3, r3, #5
	lsls	r6, r6, #4
	adds	r3, r3, r6
	movs	r6, r5
	asrs	r6, r6, r7
	movs	r7, r6
	mov	r6, ip
	ands	r7, r6
	ldr	r6, [sp]
	adds	r7, r7, r6
	adds	r3, r3, r7
	adds	r3, r1, r3
	ldrb	r7, [r3]
	subs	r6, r7, #1
	sbcs	r7, r7, r6
	orrs	r4, r7
	cmp	r0, #0
	blt	.L2
	strb	r0, [r3]
.L2:
	adds	r2, r2, #4
	cmp	r2, #16
	bne	.L3
	sxth	r0, r4
	@ sp needed
	pop	{r1, r2, r3, r4, r5, r6, r7, pc}
.L6:
	.align	2
.L5:
	.word	2298	@0x000008fa
	.word	2286	@0x000008ee
	.word	2300	@0x000008fc
	.word	2254	@0x000008ce
	.size	usr_calc, .-usr_calc
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 7-2017-q4-major) 7.2.1 20170904 (release) [ARM/embedded-7-branch revision 255204]"
