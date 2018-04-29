1 CLS
2 OUT1,-1:OUT4,-1
10 V=ANA(2)/10:LC0,0:?V;:FORI=0TOV/3:?"ǡ";:NEXT:FORI=0TO29-V/3:?" ";:NEXT
20 V=ANA(5)/10:LC0,1:?V;:FORI=0TOV/3:?"ǡ";:NEXT:FORI=0TO29-V/3:?" ";:NEXT
30 V=ANA(8)/10:LC0,2:?V;:FORI=0TOV/3:?"ǡ";:NEXT:FORI=0TO29-V/3:?" ";:NEXT
40 V=ANA(0)/10:LC0,3:?V;:FORI=0TOV/3:?"ǡ";:NEXT:FORI=0TO29-V/3:?" ";:NEXT
49 LC0,4:?"          ";
50 X=(V>30)*((V/63>0)*63+!(V/63)*V-30):LC0,4:?(X*X)/10;
100 GOTO10



'
アナログ入力(ANA)に使えるのは
BTN	ANA() or ANA(0)	ピン番号13
IN2		ANA(2)			ピン番号4
OUT1	ANA(5)			ピン番号9
OUT2	ANA(6)			ピン番号10	
OUT3	ANA(7)			ピン番号11	
OUT4	ANA(8)			ピン番号12	

このうち、
BTN	ANA() or ANA(0)	ピン番号13
IN2		ANA(2)			ピン番号4
OUT1	ANA(5)			ピン番号9
OUT4	ANA(8)			ピン番号12	
を使っている。
このうち、ANA5と8は通常OUTに使われているので、OUT1,-1/OUT4,-1としてIN側に使うように宣言する必要がある。

