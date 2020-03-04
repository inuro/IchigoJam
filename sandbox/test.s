	.cpu cortex-m0
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"test.c"
	.text
	.align	1
	.global	usr_calc
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	usr_calc, %function
usr_calc:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	movs	r2, r0
	str	r1, [r7]
	adds	r3, r7, #6
	strh	r2, [r3]
	ldr	r3, [r7]
	movs	r2, #128
	lsls	r2, r2, #4
	mov	ip, r2
	add	r3, r3, ip
	str	r3, [r7, #12]
	adds	r3, r7, #6
	movs	r2, #0
	ldrsh	r3, [r3, r2]
	lsls	r3, r3, #1
	ldr	r2, [r7, #12]
	adds	r2, r2, r3
	movs	r1, #10
	adds	r3, r7, r1
	ldrh	r2, [r2]
	strh	r2, [r3]
	adds	r3, r7, r1
	movs	r2, #0
	ldrsh	r3, [r3, r2]
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
	.size	usr_calc, .-usr_calc
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 7-2017-q4-major) 7.2.1 20170904 (release) [ARM/embedded-7-branch revision 255204]"
