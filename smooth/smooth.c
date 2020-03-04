#include <stdint.h>
#define VRAM_OFFSET   0x900
#define VARS_OFFSET   0x800

uint16_t usr_calc(uint16_t val, uint8_t* mem) {
    uint8_t* vram_addr = mem + VRAM_OFFSET;
    uint16_t* vars_addr = mem + VARS_OFFSET;
    
    uint16_t* x_addr = mem + 0x8fa;
    uint16_t* y_addr = mem + 0x8fc; 
    uint16_t x = *(x_addr);
    uint16_t y = *(y_addr);
    uint16_t c = 224 + x % 8;
    uint16_t flag = 0;

    for(int i = 0; i < 2; i++){
        if (*(vram_addr + x / 8 + y * 32 + i) == 0) {
            *(vram_addr + x / 8 + y * 32 + i) = c + i * 8;
            flag += (0xff<<(8*(1-i))); // if left #ff00 || if right #00ff
        }
    }
    flag = ~flag & (0xff00 >> x % 8); //rev flag
    return flag;
}


<<<<<<< HEAD
uint16_t build_patterns(uint16_t val, uint8_t* mem){

}


=======
>>>>>>> 7f9af141ea2a129f6a04ad9c987db78ff83cc4df

/*
$ arm-none-eabi-gcc -c -mthumb -mcpu=cortex-m0 -mlittle-endian -mno-unaligned-access -Os -g -o smooth.o -c smooth.c
$ arm-none-eabi-objdump -d smooth.o

smooth.o:     file format elf32-littlearm


Disassembly of section .text:

00000000 <usr_calc>:
   0:	2207      	movs	r2, #7
   2:	2090      	movs	r0, #144	; 0x90
   4:	b530      	push	{r4, r5, lr}
   6:	2400      	movs	r4, #0
   8:	4b10      	ldr	r3, [pc, #64]	; (4c <usr_calc+0x4c>)
   a:	0100      	lsls	r0, r0, #4
   c:	5ccb      	ldrb	r3, [r1, r3]
   e:	401a      	ands	r2, r3
  10:	10db      	asrs	r3, r3, #3
  12:	181b      	adds	r3, r3, r0
  14:	480e      	ldr	r0, [pc, #56]	; (50 <usr_calc+0x50>)
  16:	5c08      	ldrb	r0, [r1, r0]
  18:	0140      	lsls	r0, r0, #5
  1a:	181b      	adds	r3, r3, r0
  1c:	18c8      	adds	r0, r1, r3
  1e:	7805      	ldrb	r5, [r0, #0]
  20:	42a5      	cmp	r5, r4
  22:	d104      	bne.n	2e <usr_calc+0x2e>
  24:	0014      	movs	r4, r2
  26:	3c20      	subs	r4, #32
  28:	7004      	strb	r4, [r0, #0]
  2a:	24ff      	movs	r4, #255	; 0xff
  2c:	0224      	lsls	r4, r4, #8
  2e:	3301      	adds	r3, #1
  30:	18cb      	adds	r3, r1, r3
  32:	7819      	ldrb	r1, [r3, #0]
  34:	2900      	cmp	r1, #0
  36:	d103      	bne.n	40 <usr_calc+0x40>
  38:	0011      	movs	r1, r2
  3a:	3918      	subs	r1, #24
  3c:	7019      	strb	r1, [r3, #0]
  3e:	34ff      	adds	r4, #255	; 0xff
  40:	20ff      	movs	r0, #255	; 0xff
  42:	0200      	lsls	r0, r0, #8
  44:	4110      	asrs	r0, r2
  46:	43a0      	bics	r0, r4
  48:	b200      	sxth	r0, r0
  4a:	bd30      	pop	{r4, r5, pc}
  4c:	000008fa 	.word	0x000008fa
  50:	000008fb 	.word	0x000008fb
  
  
$ cat smooth.bas
100 let[0],#2207,#2090,#b530,#2400,#4b10,#0100,#5ccb,#401a
110 let[8],#10db,#181b,#480e,#5c08,#0140,#181b,#18c8,#7805
120 let[16],#42a5,#d104,#0014,#3c20,#7004,#24ff,#0224,#3301
130 let[24],#18cb,#7819,#2900,#d103,#0011,#3918,#7019,#34ff
140 let[32],#20ff,#0200,#4110,#43a0,#b200,#bd30,#08fa,#0000
150 let[40],#08fb,#0000

*/
