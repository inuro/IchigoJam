10 I=0:CLS
20 K=(IN(1)=0)*1+(IN(2)=0)*2+(IN(3)=0)*4+(IN(4)=0)*8
30 IF K<>I I=K:LC0,0:?BIN$(K,4)
40 GOTO 20



'IN(1)からIN(4)までの入力をチェック
'IN(1)を1ビット目、IN(4)を4ビット目として二進数でフラグ状態を表示する
