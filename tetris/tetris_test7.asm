00000000 <usr_calc>:
   0:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
   2:	4b1b      	ldr	r3, [pc, #108]	; (70 <usr_calc+0x70>)
   4:	4a1b      	ldr	r2, [pc, #108]	; (74 <usr_calc+0x74>)
   6:	5ccb      	ldrb	r3, [r1, r3]
   8:	5c8a      	ldrb	r2, [r1, r2]
   a:	9300      	str	r3, [sp, #0]
   c:	4b1a      	ldr	r3, [pc, #104]	; (78 <usr_calc+0x78>)
   e:	5ccb      	ldrb	r3, [r1, r3]
  10:	9301      	str	r3, [sp, #4]
  12:	4b1a      	ldr	r3, [pc, #104]	; (7c <usr_calc+0x7c>)
  14:	5ccb      	ldrb	r3, [r1, r3]
  16:	009b      	lsls	r3, r3, #2
  18:	189b      	adds	r3, r3, r2
  1a:	2280      	movs	r2, #128	; 0x80
  1c:	005b      	lsls	r3, r3, #1
  1e:	0112      	lsls	r2, r2, #4
  20:	18cb      	adds	r3, r1, r3
  22:	189b      	adds	r3, r3, r2
  24:	881d      	ldrh	r5, [r3, #0]
  26:	2200      	movs	r2, #0
  28:	2303      	movs	r3, #3
  2a:	0014      	movs	r4, r2
  2c:	469c      	mov	ip, r3
  2e:	002b      	movs	r3, r5
  30:	4666      	mov	r6, ip
  32:	4113      	asrs	r3, r2
  34:	4033      	ands	r3, r6
  36:	9e01      	ldr	r6, [sp, #4]
  38:	1c97      	adds	r7, r2, #2
  3a:	199b      	adds	r3, r3, r6
  3c:	2690      	movs	r6, #144	; 0x90
  3e:	015b      	lsls	r3, r3, #5
  40:	0136      	lsls	r6, r6, #4
  42:	199b      	adds	r3, r3, r6
  44:	002e      	movs	r6, r5
  46:	413e      	asrs	r6, r7
  48:	0037      	movs	r7, r6
  4a:	4666      	mov	r6, ip
  4c:	4037      	ands	r7, r6
  4e:	9e00      	ldr	r6, [sp, #0]
  50:	19bf      	adds	r7, r7, r6
  52:	19db      	adds	r3, r3, r7
  54:	18cb      	adds	r3, r1, r3
  56:	781f      	ldrb	r7, [r3, #0]
  58:	1e7e      	subs	r6, r7, #1
  5a:	41b7      	sbcs	r7, r6
  5c:	433c      	orrs	r4, r7
  5e:	2800      	cmp	r0, #0
  60:	db00      	blt.n	64 <usr_calc+0x64>
  62:	7018      	strb	r0, [r3, #0]
  64:	3204      	adds	r2, #4
  66:	2a10      	cmp	r2, #16
  68:	d1e1      	bne.n	2e <usr_calc+0x2e>
  6a:	b220      	sxth	r0, r4
  6c:	bdfe      	pop	{r1, r2, r3, r4, r5, r6, r7, pc}
  6e:	46c0      	nop			; (mov r8, r8)
  70:	000008fa 	.word	0x000008fa
  74:	000008ee 	.word	0x000008ee
  78:	000008fc 	.word	0x000008fc
  7c:	000008ce 	.word	0x000008ce
