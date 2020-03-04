1 'H@BCD@@@AK@A@HAHL@AHOHBCO@KE@@BB@CBDILDF@@HH@EKBBN@@BK@@IGALCNDAACDACG@@BCD@@JCCEK@A@EDNBGD@LKAHMKAIIKAIFFDF@DCBANG@A@BJNLMAO@KM@J@I@@@@
2 O=#C04:FORI=0TO68:POKE#700+I,(PEEK(O+I*2)-64)<<4+PEEK(O+1+I*2)-64:NEXT
<<<<<<< HEAD
=======
190 LET[0],#1596,#4596,#526A,#4156,#159A,#4856,#126A,#4526,#1592,#456A,#926A,#456,#156A,#8596,#156A,#8596,#5926,#156,#5926,#156,#159D,#89AB,#159D,#89AB,#596A,#596A,#596A,#596A
200 FOR J=0 TO 6:FOR I=0 TO 3
210 U=USR(#700,J<<2+I)
220 LC10,15:?J;"(";I;")";
310 WAIT15:CLS:NEXT:NEXT
320 GOTO 200

ブロックパターンを配列に置いて、それをマシン語側から読み出してVRAM更新するバージョンの習作
マシン語部分は、 https://github.com/inuro/IchigoJam_bin2poke/tree/base16 を用いて、

$ arm-none-eabi-gcc -c -mthumb -mcpu=cortex-m0 -mlittle-endian -mno-unaligned-access -Os -g -o tetris_test5.o -c tetris_test5.c
$ arm-none-eabi-ld -T bin2poke.ld -o tetris_test5.elf tetris_test5.o -Map linkmap.map
$ arm-none-eabi-objcopy -O binary tetris_test5.elf tetris_test5.bin
$ python bin2poke.py -b -c 96 -a 0x800 -s 1 -d 1 tetris_test5.bin tetris_test5.bas
$ cat tetris_test5.bas

として得た。





>>>>>>> 7f9af141ea2a129f6a04ad9c987db78ff83cc4df
