1 'IFAEIFDEFJEBEFDAIJAEEFDHFJABBFDEIBAEFJDEFJIBEF@DFJAEIFHEFJAEIFHEBFEIEF@ABFEIEF@AIMAEJKHIIMAEJKHIFJEIFJEIFJEIFJEI  
2 '
3 FORI=0 TO27
4 '?HEX$(PEEK(#800+I*2)+PEEK(#801+I*2)<<8);",";
5 NEXT:?" "
10 LET[0],#1596,#4596,#526A,#4156,#159A,#4856,#126A,#4526,#1592,#456A,#926A,#456,#156A,#8596,#156A,#8596,#5926,#156,#5926,#156,#159D,#89AB,#159D,#89AB,#596A,#596A,#596A,#596A
15 ?"1 '";
20 for i=#800 to#800+55
30 a=peek(i):?chr$(64+(a>>4));chr$(64+(a&#f));
40 next
50 ?" ":?" "
55 'END
60 FORI=0 TO27
65 A=(peek(#c04+i*4)-64)<<4+peek(#c05+i*4)-64
66 B=(peek(#c06+i*4)-64)<<4+peek(#c07+i*4)-64
70 ?HEX$(A+B<<8); ",";
80 NEXT
90 ?" "



'7*4種類のパターンを直接バイト列として書き込み、BASE16形式にエンコードする。
'エンコードされたパターンは56バイトなので、この1行目をプログラムの先頭に置き、bin2pokeから出力されたコードはその次の行から配置。
'なのでデコーダのループカウントを1つ増やしておく。
'また、USRでの呼び出しもUSR(#800)ではなくUSR(#800+56)を呼び出すようにする。
'マシン語側でも、PCから56バイト分戻ったところをルートとしてデータを直接メモリコピーするようにして使う。
'具体的には、block[0]=0x1596;としていたところを、
' int16_t* bp = (int16_t*) mem;
' int16_t block = bp[0x800+val]
'とすれば良いはず。

