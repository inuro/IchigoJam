TARGET_ARCH=arm-none-eabi-
CC=$(TARGET_ARCH)gcc
OBJCOPY=$(TARGET_ARCH)objcopy
OBJDUMP=$(TARGET_ARCH)objdump
LD=$(TARGET_ARCH)ld
RM=rm
PYTHON=python
BIN2POKE=bin2poke.py
CFLAGS=-c -mthumb -mcpu=cortex-m0 -mlittle-endian -mno-unaligned-access -Os -g

#700番地からpoke形式。開始行番号100、行番号増分10
#BIN2POKE_OPT=-a 0x700 -s 100 -d 10 

# pokeのデータ部を10進数で出力(生成コードサイズ削減用)
#BIN2POKE_OPT=-o dec

# pokeのデータ部を1行に16データ出力(桁数の多い環境で見やすい)
#BIN2POKE_OPT=-c 16

# pokeのデータ部を2進数で出力。1行に2データ出力。
#BIN2POKE_OPT=-o bin -c 2

# pokeの代わりに配列形式で16進数で出力。IchigoJamの仕様上、配列は800番地からに固定。
#BIN2POKE_OPT+=-a 0

# pokeの代わりに配列形式で出力2進数、1行に1データ(配列時の1データは16ビット)。
# 以下の組み合わせでの出力を指定した場合に限り、コメント部に逆アセンブルコードを出力
#BIN2POKE_OPT+=-a 0 -o bin -c 1

#BIN2POKE_OPT=-o dec -c 32 -a 0x700
BIN2POKE_OPT=-b -c 96 -a 0x800 -s 1 -d 1


all:
	@echo "IchigoJam_bin2poke"
	@echo "Usage: make <targetfile>.bas"
	@echo "e.g. $$ make usr_sample.bas"

%.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $<

%.elf: %.o
	$(LD) -T bin2poke.ld -o $@ $< -Map linkmap.map

%.bin: %.elf
	$(OBJCOPY) -O binary $< $@

%.bas: %.bin
	$(PYTHON) $(BIN2POKE) $(BIN2POKE_OPT) $< $@

%.s: %.elf
	$(OBJDUMP) -d -S -l $< > $@

%.asm: %.o
	$(OBJDUMP) -d -S -l $< > $@

clean:
	@$(RM) -rf *.elf *.o *.bin *.bas

#.PRECIOUS: %.elf %.o %.bin
