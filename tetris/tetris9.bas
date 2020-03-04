1 'ﾛﾍaﾒ@x3:<TﾏP4ｬVﾛ0ﾄﾒgxｱﾕK06ﾃEｸ3pjﾊｶp2@<vD0W8ﾂｸ1ｬv9ｰVd06mG>VﾃI1If1K0cayh0nPｭﾀ6bHﾎp0Wｷﾑｮﾌcｫ<7ﾏ7ﾐﾚﾎqN@ﾀ2p3fHh16Q1[sｱ@\ｿﾋﾎ1<
2 'ｳyｴﾕcﾍvﾇYZﾄﾆjﾅﾖSKｵｴbcﾍ\ﾛｱｹﾂｷｹJｯFmyｴﾙaｽｴﾇ9=ﾍVhzﾞgｵﾂgﾓm^BﾛeNﾍWｻYﾖﾊqQﾐXｼZ72vﾂ@ﾘﾄbE5
3 CLV:O=#C04:D=#700
4 S=I%8:[S]=S:A=PEEK(O+I):A=A-(1+(A>#AA))*#30:IFSV=A>>(7-S)|C:POKED,V:D=D+1:IFD=#768O=#C80:D=#810:I=0:GOTO4
5 C=(A&(#7F>>S))<<(S+1):I=I+1:IFD<#856GOTO4
6 T=20:GSB90:CLS:FORI=0TO21:POKE#909+I*32,1:POKE#914+I*32,1:NEXT:COPY#BAA,#BA9,10
7 X=14:Y=0:V=[R]:IFSCR(15,2)ENDELSER=(R+1)%7:IF!RGSB90
8 LC6,23:J=[R]:I=[36+J]:?"NEXT:";CHR$(I);CHR$(I>>8),"SCORE:";N;
9 C=248:GSB80:IFAWAIT3
10 A=0:S=0:IF!IN(4)||TICK()>T+3CLT:B=1:ELSEB=0:A=IN(3)-IN(1):S=BTN():IFA|S^U=0CONT
11 U=S:C=0:GSB80:I=W:X=X+A:Y=Y+B:W=(W+S)%4:C=-1:GSB80:IF!ZGOTO9
12 X=X-A:Y=Y-B:W=I:IF!BGOTO9
13 C=2:GSB80:FORJ=YTOY+3:L=0:FORI=10TO19:L=L+!!SCR(I,J):NEXT:M=L=10:COPY#91F+J*32,#91F+(J-M)*32,-J*32:U=U+M:NEXT:N=N+10*U*U*U+1:T=T-1*(T*U>0):GOTO7
80 Z=USR(#700,C):RTN
90 FORI=6TO0STEP-1:J=RND(I):K=[I]:[I]=[J]:[J]=K:NEXT:RTN


'QRcode転送対応（機種依存文字レス版）
'ジョイスティックバージョン
'      IN(2)
' 　　　　↑
' IN(3)←　→IN(1)
' 　　　　↓
'      IN(4)


'マシン語書き込み部分
1行目はマシン語描画コード。tetris_core_mod.sをmakeしたもの
2行目はブロックパターン（実表示用とテキスト表示用）をBASE128エンコードしたもの。tetris_data.binから生成
1行目のバイト数は104バイト。エンコードされた文字数は119文字（7x17)よってD=#700+104=#768に達したら1行目の書き込みは完了。
乱数用の配列[0]〜[7]分の16バイトをオフセットして、#810にライトヘッドを移す。
1行目の文字数は、?PEEK(#C02)が120になる。従って行番号2バイト、スペース、コメント記号の4バイトを足して2行目のリードヘッド位置オフセットは124。
#C04+124=#C80
2行目のバイト数は70バイト。よって、D=#810+70=#856に達したら2行目の書き込みも完了。
ロジック部分は#700から書かれているので、USRの呼び出しも#700に。

'プログラム
1 コアエンジンのマシン語のBASE128エンコード文字列。104バイト分。
2 ブロックパターンのBASE128エンコード文字列。70バイト分。
3-5　デコード＆メモリ書き込み。ついでに[0]-[7]も初期化
6 ゲーム初期化、フィールドの描画。POKE#909,1 = LC9,0:?"■"
7 新規ブロックの生成と終了判定（15,2に何か描かれているか否か）、乱数のシャッフル
8 NEXTブロックとスコアの表示
9 ブロックの描画
10 移動入力のチェック：時間経過あるいはカーソル下で下、でなければカーソル左右とスペースで回転。もし入力がなければこのループを無限に繰り返す
11 現在のブロックを消去。移動先の座標を計算して衝突判定。衝突していなければ9に戻って新しい位置にブロックを描画する
12 衝突したため移動は行わないのでX/Y/Wを元の値に戻す。下方向の入力でなければ元の位置にブロックを書き直すために9に戻る。
13 石化ブロックを描画。ライン消しのチェック。Yの位置から下にスキャンしていき、全部埋まっている行は1つ上の行というかVRAMを丸ごとコピーする。スコアの加算。新規ブロック7に戻る
80 描画サブルーチン。X,Yの位置に、ブロックパターンVの回転状態WをキャラCで描画する
90 シャッフルサブルーチン。[0]-[6]の値をシャッフルする

'変数
R:  現在のブロックの種類
C:  表示するキャラクターパターン（248:ブロック、0:消去）
V:  ブロックの種類（0〜7）
W:  現在の回転方向（0〜3）
X:  ブロックエリア（4x4）左上のX座標
Y:  ブロックエリア（4x4）左上のY座標
A:  水平方向移動量
B:  垂直方向移動量
S:  回転ボタンの押し下げ状態
U:  直前の回転ボタンの状態の保護
T:  1段降下するまでのタイマー値（初期値60=1秒）
N:  スコア
Z:  USR関数戻り値

'配列
[0]-[7]     乱数用（1つ余り）
[8]-[35]    ブロックパターン（実表示用）
[36]-[42]   ブロックパターン（テキスト表示用）