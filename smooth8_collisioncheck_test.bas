10   [0]=`1111111100000000
20   [1]=`0111111100000000
30   [2]=`0011111100000000
40   [3]=`0001111100000000
50   [4]=`0000111100000000
60   [5]=`0000011100000000
70   [6]=`0000001100000000
80   [7]=`0000000100000000
110  [8]=`0000000000000000
120  [9]=`0000000010000000
130 [10]=`0000000011000000
140 [11]=`0000000011100000
150 [12]=`0000000011110000
160 [13]=`0000000011111000
170 [14]=`0000000011111100
180 [15]=`0000000011111110
200 CLS:FORI=0TO15
210 ?BIN$([I],16);" D:";([I]&#7E0>0);"+";([I]&#F81F<>0);" " 
220 NEXT
