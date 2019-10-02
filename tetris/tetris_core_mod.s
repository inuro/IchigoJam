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
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	movs	r2,0x8f			@r2=0x8f
	lsls	r2,r2,#4		@r2=0x8f0
	adds	r2, r1, r2		@r2=r2+r1
	ldrb	r3, [r2,0xa]	@load byte from 0x8fa(X) to R3
	str		r3, [sp]		@store R3=X to SP+0 = R0??
	ldrb	r3, [r2,0xc]	@load byte from 0x8fc(Y) to R3
	str		r3, [sp, #4]	@store R3=Y to SP+4 = R5??
	ldrb	r3, [r2,0x6]	@load_byte from 0x8f6(V=B) to R3
	ldrb	r4, [r2,0x8]	@load_byte from 0x8f8(W=R) to R4
	lsls	r3, r3, #2		@R3<<2
	adds	r3, r3, r4		@R3+=R4 -> R3 = B<<2 + R = BLOCK
	lsls	r3, r3, #1		@R3<<1 -> BLOCK*2(word offset)
    subs    r2, 0xe0        @shift R2 from 0x8f0 to 0x810
	ldrh	r5, [r2,r3]     @load r5=block
	movs	r2, #0          @R2=0 -> shift value
	movs	r3, #3          @R3=3
	movs	r4, r2          @R4=0 -> collision flag
	mov	ip, r3              @IP=3
.L3:
	movs	r3, r5          @R3=block
	mov	r6, ip              @R6=3
	asrs	r3, r3, r2      @block >> (i*4)
	ands	r3, r6          @R3 = b = (block >> (i*4)) & 3
	ldr	r6, [sp, #4]        @R6=Y
	adds	r7, r2, #2      @R7=(i*4)+2
	adds	r3, r3, r6      @R3 = (y + b)
	movs	r6, #144        @R6=0x90
	lsls	r3, r3, #5      @R3 = (y + b)*32
	lsls	r6, r6, #4      @R6=0x900
	adds	r3, r3, r6      @R6=0x900 + (y+b)*32
	movs	r6, r5          @R6=block
	asrs	r6, r6, r7      @block >> ((i*4)+2)
	movs	r7, r6          @R7 = (block >> ((i*4)+2))
	mov	r6, ip              @R6=3
	ands	r7, r6          @R7 = a = (block >> ((i*4)+2)) & 3
	ldr	r6, [sp]            @R6=X
	adds	r7, r7, r6      @R7 = (x + a)
	adds	r3, r3, r7      @R3 = 0x900 + (x + a) + (y+b)*32
	adds	r3, r1, r3      @R3 += memory offset
	ldrb	r7, [r3]        @R7 = vram value = [R3]
	subs	r6, r7, #1      @R6=R7-1
	sbcs	r7, r7, r6      @R7=R7-R6 these 2 lines means (R7 != 0)
	orrs	r4, r7          @R4 |= R7
	cmp	r0, #0              @if R0 < 0
	blt	.L2                 @   goto .L2
	strb	r0, [r3]        @Write R0 to vram[R3]
.L2:
	adds	r2, r2, #4      @R2 = R2 + 4
	cmp	r2, #16             @if R2 <> 16 (means i <> 4)
	bne	.L3                 @   goto .L3
	sxth	r0, r4          @R0=(int16_t)collision
	@ sp needed
	pop	{r1, r2, r3, r4, r5, r6, r7, pc}
.L6:
	.align	2
	.size	usr_calc, .-usr_calc
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 7-2017-q4-major) 7.2.1 20170904 (release) [ARM/embedded-7-branch revision 255204]"
