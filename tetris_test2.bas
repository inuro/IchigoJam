BASIC版

1 'TETRIS1
10 let[0],#1596,#4596,#526A,#4156
100 LC0,18:?BIN$([R],16)
108 FOR R=0 TO 3:cls
109 LC0,18:?BIN$([R],16)
110 for i=0 to 3
120 b=([r]>>(i*4))&3
130 a=([r]>>(i*4+2))&3
140 LC0,19+I:?BIN$(A,2);",";BIN$(B,2);" ";a;",";b
145 LC X+A,Y+B:?"Ǹ";
150 next
160 WAIT30:NEXT
200 LC0,10


マシン語版

1 'TETRIS2
100 let[0],#b573,#4b0e,#0040,#9300,#4b0d,#2200,#9301,#466b
110 let[8],#25f8,#5ec4,#2003,#0026,#1c93,#411e,#0023,#4113
120 let[16],#4003,#330a,#015b,#4006,#18cb,#199b,#4e05,#3204
130 let[24],#199b,#701d,#2a10,#d1ee,#2000,#bd76,#1596,#4596
140 let[32],#526a,#4156,#090a,#0000
150 CLS
160 I=0
200 U=USR(#800,I%4)
210 I=I+1:WAIT15:CLS:GOTO200
