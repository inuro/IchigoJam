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
	.text
	.align	1
	.global	usr_calc
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	entrypoint, %function
entrypoint:
    @ value of Y is passed via R0
    @   r0  Y
    @   r1  memory offset
    @   r2  physical VRAM head
    @   r3  VRAM address for load
    @   r4  VRAM address for store
    @   r5  flushed line counter
    @   r6  loop counter for Y
    @   r7  loop counter for X
	movs	r2, 0x90		@r2=0x90
	lsls	r2, r2, #4		@r2=0x900
	adds	r2, r1, r2		@r2=offset + 0x900
	push	{r0, r1, r2, r3, r4, r5, r6, r7, lr}
    movs    r5, #0          @flushed line count(will be return value)

    movs    r6, #3          @for I=3 to 0 step -1 
.loop1:
    movs    r7, #9          @for X_OFFSET=9 to 0 step -1。10+X_OFFSETが10〜19の範囲に収まるようにしている
.check:
    bl      .loady          @gosub loady
    cmp     r3, #0          @SCR(X,Y)==0?
    beq     .break          @もし1回でも0:空白が見つかったらラインは消えないので即座に次の段のチェックへ移る
    subs    r7, r7, #1      @R9--   Xのオフセット位置をデクリメント
    bge     .check          @if R9>=0 .check

    push    {r6}            @r6の値を退避
    movs    r6, #3          @r5=3      Y loop counter
.loop2:
    movs    r7, #9          @r11=9      X loop counter
.scroll:    
    bl      .loady          @gosub loady
    movs    r4, r3          @r4 = r3
    subs    r4, #32         @r4 = 1 line up from r3
    strb    r3, [r4]        @(X, Y)にコピー
    subs    r7, r7, #1      @r7--   Xのオフセット位置をデクリメント
    bge     .scroll         @if r7>=0 .scroll
    subs    r6, r6, #1      @r6--
    bge     .loop2          @if r6>=0 .loop2
    pop     {r6}            @r6の値を復帰
    adds    r5, r5, #1      @r3++(flushed line count)    

.break:
    subs    r6, r6, #1      @I=I-1
    bge     .loop1           @if I>=0 .loop
.finally:
    sxth	r0, r5
    pop     {r1, r2, r3, r4, r5, r6, r7, pc}

.loady:
    adds    r3, r2, r7      @r4 = #900 + X_OFFSET
    adds    r3, r3, #10     @r4 = #900 + 10 + X_OFFSET
    adds    r1, r0, r6      @r1 = Y + I
    lsls    r1, r1, #5      @r1 = (Y+I)*32
    adds    r3, r3, r1      @r3 = #900 + 10 + X_OFFSET + (Y+I)*32
    ldrb	r3, [r3]        @(X, Y-1)のVRAMの値をロード
    BX      lr              @return
