00000000 <usr_calc>:
   0:	b570      	push	{r4, r5, r6, lr}
   2:	4b19      	ldr	r3, [pc, #100]	; (68 <usr_calc+0x68>)
   4:	b08e      	sub	sp, #56	; 0x38
   6:	9300      	str	r3, [sp, #0]
   8:	4b18      	ldr	r3, [pc, #96]	; (6c <usr_calc+0x6c>)
   a:	0040      	lsls	r0, r0, #1
   c:	9301      	str	r3, [sp, #4]
   e:	4b18      	ldr	r3, [pc, #96]	; (70 <usr_calc+0x70>)
  10:	2200      	movs	r2, #0
  12:	9302      	str	r3, [sp, #8]
  14:	4b17      	ldr	r3, [pc, #92]	; (74 <usr_calc+0x74>)
  16:	25f8      	movs	r5, #248	; 0xf8
  18:	9303      	str	r3, [sp, #12]
  1a:	4b17      	ldr	r3, [pc, #92]	; (78 <usr_calc+0x78>)
  1c:	9304      	str	r3, [sp, #16]
  1e:	4b17      	ldr	r3, [pc, #92]	; (7c <usr_calc+0x7c>)
  20:	9305      	str	r3, [sp, #20]
  22:	4b17      	ldr	r3, [pc, #92]	; (80 <usr_calc+0x80>)
  24:	9306      	str	r3, [sp, #24]
  26:	9307      	str	r3, [sp, #28]
  28:	4b16      	ldr	r3, [pc, #88]	; (84 <usr_calc+0x84>)
  2a:	9308      	str	r3, [sp, #32]
  2c:	9309      	str	r3, [sp, #36]	; 0x24
  2e:	4b16      	ldr	r3, [pc, #88]	; (88 <usr_calc+0x88>)
  30:	930a      	str	r3, [sp, #40]	; 0x28
  32:	930b      	str	r3, [sp, #44]	; 0x2c
  34:	4b15      	ldr	r3, [pc, #84]	; (8c <usr_calc+0x8c>)
  36:	930c      	str	r3, [sp, #48]	; 0x30
  38:	930d      	str	r3, [sp, #52]	; 0x34
  3a:	466b      	mov	r3, sp
  3c:	5ec4      	ldrsh	r4, [r0, r3]
  3e:	2003      	movs	r0, #3
  40:	0026      	movs	r6, r4
  42:	1c93      	adds	r3, r2, #2
  44:	411e      	asrs	r6, r3
  46:	0023      	movs	r3, r4
  48:	4113      	asrs	r3, r2
  4a:	4003      	ands	r3, r0
  4c:	330a      	adds	r3, #10
  4e:	015b      	lsls	r3, r3, #5
  50:	4006      	ands	r6, r0
  52:	18cb      	adds	r3, r1, r3
  54:	199b      	adds	r3, r3, r6
  56:	4e0e      	ldr	r6, [pc, #56]	; (90 <usr_calc+0x90>)
  58:	3204      	adds	r2, #4
  5a:	199b      	adds	r3, r3, r6
  5c:	701d      	strb	r5, [r3, #0]
  5e:	2a10      	cmp	r2, #16
  60:	d1ee      	bne.n	40 <usr_calc+0x40>
  62:	2000      	movs	r0, #0
  64:	b00e      	add	sp, #56	; 0x38
  66:	bd70      	pop	{r4, r5, r6, pc}
  68:	45961596 	.word	0x45961596
  6c:	4156526a 	.word	0x4156526a
  70:	4856159a 	.word	0x4856159a
  74:	4526126a 	.word	0x4526126a
  78:	456a1592 	.word	0x456a1592
  7c:	0456926a 	.word	0x0456926a
  80:	8596156a 	.word	0x8596156a
  84:	01565926 	.word	0x01565926
  88:	89ab159d 	.word	0x89ab159d
  8c:	596a596a 	.word	0x596a596a
  90:	0000090a 	.word	0x0000090a
