1 'P°xdRE<wTBP 
10 O=#C04:I=0:K=0:
20 @LOOP:S=I%8:A=PEEK(O+I):?S,CHR$(A)
25 A=A-(1+(A>#AA))*#30:
30 B=A>>(7-S):
40 V=B|C
50 C=(A&(#7F>>S))<<(S+1)
55 IF S POKE R+K*2,V>>4,V&#FF:K=K+1
60 I=I+1:
70 IF I<11 goto@LOOP


'
55 イテレータの関係上、8行毎にNULLな結果が発生するのでその書き込みは行わない。
