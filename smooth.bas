10 'Smooth scroll
20 LET[0],24,24,36,52,189,189,255,90
30 CLP:FOR J=0 TO 3:FOR I=0 TO 7
40 POKE#700+I+J*8,[I]>>(J*2)
50 POKE#720+I+J*8,[I]<<(8-J*2)
60 NEXT:NEXT
70 '
80 CLS:CLT:X=64:Y=15:A=0:B=0
90 @LOOP:IF TICK()<0 GOTO@BTN
100 IF VPEEK((X+1)/4,Y-1)||VPEEK((X+2)/4,Y-1) BEEP1:END
110 CLT:POKE #900+RND(32),ASC("*"):SCROLL2
120 @BTN:B=BTN(RIGHT)-BTN(LEFT)
130 IF B A=A+B*(ABS(A)+1) ELSE IF A!=0 A=A/2
140 IF A<-8 A=-8 ELSE IF A>8 A=8
150 'GOSUB@DEL
160 X=X+A:IF X<4 X=4 ELSE IF X>124 X=124
170 GOSUB@POS
180 IF PEEK(Z)=0 POKE Z,224+X%4
190 IF PEEK(Z+1)=0 POKE Z+1,228+X%4
200 GOTO @LOOP
210 @POS:Z=#900+X/4+Y*#20:RTN
220 @DEL:GOSUB@POS:POKE Z,0,0:RTN
