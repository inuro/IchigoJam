1 '000@08030100X0<0ｳyｴﾕcﾍvﾇYZﾄﾆjﾅﾖSKｵｴbcﾍ\ﾛｱｹﾂｷｹJｯFmyｴﾙaｽｴﾇ9=ﾍVhzﾞgｵﾂgﾓm^BﾛeNﾍWｻYﾖﾊ
2 O=#C04:I=0:K=0:M=70
3 S=I%8:A=PEEK(O+I):A=A-(1+(A>#AA))*#30:IFSV=A>>(7-S)|C:POKE#800+K,V:K=K+1
4 C=(A&(#7F>>S))<<(S+1):I=I+1:IFK<MGOTO3



' compiled tetris_data.bin
' bytes-to-write:70
'
' $ python bin2poke.py -x -c 96 -a 0x800 -s 1 -d 1 tetris_data.bin tetris_data.bas
