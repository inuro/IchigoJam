1 'OGKEAKDKAKDJLKELHJEL@@ICAJDKLKEL@AICAJDKLKELIK@@IKAHH@BBEK@@AB@ALKAHIKAHAMHH@@BB@CBCAD@@ILDFBK@@FFDFACDACCD@@AINIGALIKAII@BFEK@ACF@AIKAIBN@@CNDACG@@FFDFCGD@@@INKOAIMKAILKAHAOGHGNANKGDACLDC@@BH
2 '@@MKAHG@@DCBA@BJNAMAB@KBONKML@DFOJ@H@@@@NN@H@@@@OL@H@@@@LN@H@@@@
3 O=#C04:D=0:FORJ=0TO1:N=PEEK(O-2):FORI=0TON/2-2:POKE#700+D,(PEEK(O+i*2)-64)<<4+PEEK(O+1+i*2)-64:D=D+1:NEXT:O=O+N+4:NEXT
190 LET[0],#1596,#4596,#526A,#4156,#159A,#4856,#126A,#4526,#1592,#456A,#926A,#456,#156A,#8596,#156A,#8596,#5926,#156,#5926,#156,#159D,#89AB,#159D,#89AB,#596A,#596A,#596A,#596A
200 CLS:T=60:CLT
210 X=14:Y=0:B=RND(7):R=0:U=1
220 IFTICK()>T CLT:V=1:GOTO@C
230 H=BTN(29)-BTN(28):V=BTN(31):S=BTN(32)
240 @C:IF H|V|S^U W=-1:GSB@D
250 IF Z=0 W=0:GSB@D:R=(R+S)%4:X=X+H:Y=Y+V:W=248:GSB@D:U=S:GOTO220
ELSE IF V W=255:GSB@D:U=S:GOTO210
ELSE GOTO220
400 @D:Z=USR(#700,W):RTN

  
  
  250 衝突フラグZ=0、つまり衝突していない場合、現在のブロックを消して、回転あるいは移動先のブロックを描画し、ループへ戻る
  Z>0、つまり衝突している場合、
    それがもし下方向（V>0）なら現在のブロックを壁の色に書き換える。（ライン消し判定、ライン移動、スコア加算）新規ブロックへ
    もしそれ以外なら、動けないので何もせずループへ戻る
  
  

衝突チェックロジックの組み込み

変数
X:  ブロックエリア（4x4）左上のX座標
Y:  ブロックエリア（4x4）左上のY座標
B:  ブロックの種類（0〜7）
R:  現在の回転方向（0〜3）
H:  水平方向移動量
V:  垂直方向移動量
S:  回転ボタンの押し下げ状態
U:  直前の回転ボタンの状態の保護
W:  表示するキャラクターパターン（248:ブロック、0:消去）
T:  1段降下するまでのタイマー値（初期値60=1秒）
Z:  USR関数戻り値
