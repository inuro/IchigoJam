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
	.file	"asm.c"
	.text
	.align	1
	.global	func1
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	func1, %function
func1:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, [r0]
	.syntax divided
@ 6 "asm.c" 1
	mov r1, #99;str r1, [r0];mov r0, #88;
@ 0 "" 2
	.thumb
	.syntax unified
	@ sp needed
	bx	lr
	.size	func1, .-func1
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 7-2017-q4-major) 7.2.1 20170904 (release) [ARM/embedded-7-branch revision 255204]"
