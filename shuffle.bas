10 LET[0],0,1,2,3,4,5,6
20 FOR M=1 TO 10
30 GOSUB@PRINT:?" -> ";
40 GOSUB@SHUFFLE
50 GOSUB@PRINT:?""
60 NEXT:END
100 ' 
110 @PRINT:FORL=0TO6:?[L];:NEXT:RTN
120 @SHUFFLE:I=7
130 IFII=I-1:J=RND(I):K=[I]:[I]=[J]:[J]=K:CONTELSERTN


'shuffle subrootine
'based on Sattolo's algorithm
'https://ja.wikipedia.org/wiki/フィッシャー–イェーツのシャッフル
