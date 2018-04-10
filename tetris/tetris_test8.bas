1 'OGKEAKDKAKDJLKELHJEL@@ICAJDKLKEL@AICAJDKLKELIK@@IKAHH@BBEK@@AB@ALKAHIKAHAMHH@@BB@CBCAD@@ILDFBK@@FFDFACDACCD@@AINIGALIKAII@BFEK@ACF@AIKAIBN@@CNDACG@@FFDFCGD@@@INKOAIMKAILKAHAOGHGNANKGDACLDC@@BH
2 '@@MKAHG@@DCBA@BJNAMAB@KBONKML@DFOJ@H@@@@NN@H@@@@OL@H@@@@LN@H@@@@
3 O=#C04:D=0:FORJ=0TO1:N=PEEK(O-2):FORI=0TON/2-2:POKE#700+D,(PEEK(O+i*2)-64)<<4+PEEK(O+1+i*2)-64:D=D+1:NEXT:O=O+N+4:NEXT
190 LET[0],#1596,#4596,#526A,#4156,#159A,#4856,#126A,#4526,#1592,#456A,#926A,#456,#156A,#8596,#156A,#8596,#5926,#156,#5926,#156,#159D,#89AB,#159D,#89AB,#596A,#596A,#596A,#596A
200 T=60:CLS:FORI=0TO21:LC9,I:?"":LC20,I:?"":NEXT:COPY#BAA,#BA9,10
210 @A:X=14:Y=0:B=RND(7):R=0:U=1:CLT
220 @B:W=248:GSB@Z
230 @LOOP:IF TICK()>T CLT:V=1 ELSE H=BTN(29)-BTN(28):V=BTN(31):S=BTN(32):IF IF H|V|S^U=0 CONT
240 U=S:W=0:GSB@Z:X=X+H:Y=Y+V:R=(R+S)%4:W=-1:GSB@Z:IF !Z GOTO@B
250 X=X-H:Y=Y-V:R=(R-S)%4:IF !V GOTO@B
260 W=2:GSB@Z:FORJ=YTOY+3:L=0:FORI=9TO18:L=L+SCR(I,J)>0:NEXT:COPY#91F+I*32,#91F+(I-(L=10))*32,-I*32:NEXT:GOTO@A
400 @Z:Z=USR(#700,W):RTN


210 @A: 新規ブロックの生成
220 @B: ブロックの描画
230 @LOOP:  移動入力のチェック：時間経過で下、でなければボタン3方向と回転。もし入力がなければこのループを無限に繰り返す
240 現在のブロックを消去。移動先の座標を計算して衝突判定。衝突していなければ@Bに戻って新しい位置にブロックを描画する
250 衝突したため移動は行わないのでX/Y/Rを元の値に戻す。下方向の入力でなければ元の位置にブロックを書き直すために@Bに戻る。
260 石化ブロックを描画。ライン消しのチェック。Yの位置から下にスキャンしていき、全部埋まっている行は1つ上の行というかVRAMを丸ごとコピーする。
400 描画サブルーチン。X,Y,Rの位置に、キャラWを描画する

- 衝突チェックロジックの組み込み
- フィールドの描画
- ライン消し

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
