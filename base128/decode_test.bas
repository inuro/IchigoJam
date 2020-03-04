1 'P°xdRE<wTBP 
10 O=#C04:I=0:K=0:
20 @LOOP:S=I%8:A=PEEK(O+I):?S,CHR$(A)
25 A=A-(1+(A>#AA))*#30:
30 B=A>>(7-S):
40 V=B|C
50 C=(A&(#7F>>S))<<(S+1)
55 IF S POKE#800+K*2,V&#FF,V>>4:K=K+1
60 I=I+1:
70 IF I<11 goto@LOOP
80 FOR I=0 TO 8:?CHR$([I]);:NEXT



'
テストのためにPOKEの書き込みバイトは上下逆にしてある

