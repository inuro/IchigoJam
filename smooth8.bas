10 'Smooth scroll 8
20 LET[0],24,24,36,52,189,189,255,90
30 CLP:FOR J=0 TO 7:FOR I=0 TO 7
40 POKE#700+I+J*8,[I]>>(J)
50 POKE#740+I+J*8,[I]<<(8-J)
60 NEXT:NEXT
70 '
80 CLS:CLT:X=64:Y=10:A=#900:B=0
90 B=BTN(RIGHT)-BTN(LEFT)
95 IF B=0 GOTO 90
110 POKEA,0,0
120 X=X+B
125 A=#900+X/8+Y*32
130 C=224+X%8
140 POKEA,C,C+8
150 GOTO 90