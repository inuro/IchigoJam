1 'P°xdRE<wTBP 
10 O=#C04:I=0:b=0:c=0:R=#800
20 @LOOP:S=I%8:A=PEEK(O+I):
25 A=A-(1+(A>#AA))*#30:
30 B=A>>(7-S):
40 V=B|C:
50 C=(A&(#7F>>S))<<(S+1)
55 POKE R+I*2,V>>4,V&#FF
60 I=I+1:
70 IF I<11 goto@LOOP
