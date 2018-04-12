'M: デコードする総バイト数

' エンコード文字列が1行に収まる場合
' デコーダサイズ：150バイト
1 'P°xdRE<wTBP 
2 O=#C04:I=0:K=0:M=9
3 S=I%8:A=PEEK(O+I):A=A-(1+(A>#AA))*#30:IFSV=A>>(7-S)|C:POKE#800+K*2,V>>4,V&#FF:K=K+1
4 C=(A&(#7F>>S))<<(S+1):I=I+1:IFK<MGOTO3
