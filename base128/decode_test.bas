1 'P°xdRE<wTBP 
10 O=#C04:I=0:b=0:c=0:
20 @LOOP:S=I%8:A=PEEK(O+I):?CHR$(A);" ";
25 A=A-(1+(A>#AA))*#30:?BIN$(A,7);" ";
30 B=A>>(7-S):
40 V=B|C:
50 C=(A&(#7F>>S))<<(S+1)
55 '?BIN$(B,8);" ";BIN$(C,8)
56 ?BIN$(V,8);" ";CHR$(V)
60 I=I+1:
70 IF I<11 goto@LOOP

