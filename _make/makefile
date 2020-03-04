# makefile for IchigoJam
#
#   [usage]
#   C -> ASM :      $ make hoge.s (from hoge.c)
#   C -> bin :      $ make hoge.bin (from hoge.c)
#   ASM -> bin :    $ make hoge.bin (from hoge.s)
#   Dump :          $ make hoge.dump (from hoge.c)
#   Dump :          $ make hoge.dump (from hoge.s)

PYTHON=python
CC=arm-none-eabi-gcc
AS=arm-none-eabi-as
OBJCOPY=arm-none-eabi-objcopy
OBJDUMP=arm-none-eabi-objdump
LD=arm-none-eabi-ld
BAS=$(PYTHON) bin2poke.py 

%.o: %.c
	$(CC) -c -mthumb -mcpu=cortex-m0 -mlittle-endian -mno-unaligned-access -Os -o $@ -c $<

%.s: %.c
	$(CC) -c -mthumb -mcpu=cortex-m0 -mlittle-endian -mno-unaligned-access -Os -S -o $@ -c $<

%.o: %.s
	$(AS) -mthumb -mcpu=cortex-m0 -mlittle-endian -o $@ $<

%.elf: %.o
	$(LD) --entry 0x700 -o $@ $<

%.bin: %.elf
	$(OBJCOPY) -O binary $< $@

%.bas: %.bin
	$(BAS) -x -c 168 -a 0x700 -s 1 -d 1 $< $@
	cat $@

%.bas128: %.bin
	$(BAS) -x -c 168 -a 0x700 -s 1 -d 1 $< $@
	cat $@

%.bas16: %.bin
	$(BAS) -b -c 96 -a 0x700 -s 1 -d 1 $< $@
	cat $@

%.dump: %.o
	$(OBJDUMP) -S $<
