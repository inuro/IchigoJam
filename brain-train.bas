1 'BRAIN-TRAIN
10 H=0:D=1000:L=10
20 @TTL:CLS:LC10,8:?"BRAIN-TRAIN":LC9,10:?"HIGH SCORE:";H:LC6,15:?"PUSH ANY KEY TO START"
30 @STT:IF INKEY()=0 GOTO @STT
40 N=0:S=0:CLS:CLT
50 @CDN:Z=TICK():LC 16,10:?(180-Z)/60+1:IF Z<180 GOTO @CDN ELSE CLS
60 @Q:A=RND(100):B=RND(100):I=-1:R=-1:CLT
70 LC0,N:?A:LC3,N:?"+":LC5,N:?B:LC8,N:?"="
80 @KEY:K=INKEY():IF K=10 && I>=0 GOTO @CHK
90 IF (K=8 || K=127) && I>=0 LC10+I,N:?" ":I=I-1
100 T=D-TICK():LC20,N:?T;"pts   ":IF T<=0 GOTO @SCR
110 IF K<48 || K>57 GOTO @KEY
120 IF I<2 I=I+1:[I]=K-48:LC10+I,N:?[I]
130 GOTO @KEY
140 @CHK:R=0:M=1:FOR J=0 TO I
150 R=R+[I-J]*M:M=M*10:NEXT
160 @SCR:LC18,N:IF R=A+B S=S+T:?"♪":PLAY"O4E24C24E24C12" ELSE ?"* 0pts   ":PLAY"O3D24R24D8"
170 N=N+1:IF N<L GOTO @Q
180 LC14,N+1:?"SCORE:";S;"pts"
190 LC9,N+2:?"HIGH SCORE:";H;"pts"
200 IF S>H H=S:LC7,N+4:?"NEW HIGH SCORE!"
210 LC8,N+8:?"PUSH ANY KEY"
220 @END:IF INKEY()<>0 GOTO @TTL ELSE GOTO @END
