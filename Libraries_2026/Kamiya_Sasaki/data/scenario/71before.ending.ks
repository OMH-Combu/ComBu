*common1
[cm]

ドアを開けると、そこには看板が一つ立っていた。[l][cm]

;看板出現
[chara_show name="kanban" top=30]

近づいてみると、そこには[l][cm]

;メッセージレイヤ大
[position height=400 top=150 left=180]
ここにタッチ！[l][cm]
;メッセージレイヤ小
[position height=190 top=500 left=180]
とかいてある。[l][cm]

おそるおそる看板にさわってみると、[l][cm]

;効果音
[playse storage="ooatari.mp3"]

突然音楽が流れ、看板の文字が出始めた。[l][cm]

;メッセージレイヤ大
[position height=400 top=150 left=180]
おつかれさま！[l][r]
よくここまでたどりついたね。[l][r]
ペンギンとは仲良くなれたかな。[l][r]
結果をみてみよう！[l][cm]

タッチしてね！[l][cm]

;メッセージレイヤ小
[position height=190 top=500 left=180]

;分岐
[link target=*select1]【１】タッチする[endlink][r]
[link target=*select2]【２】タッチしない[endlink][r]
[s][cm]

*select1
[cm]
ドキドキしながら看板に触った。[l][cm]

@jump target=*common2

*select2
[cm]
タッチしないとどうなるのか気になったので、[r]
少し待ってみることにした。[l][cm]

;暗転
[mask time=2000] 
[mask_off]

５分後[l][cm]

何も起こらない。[l][cm]

;暗転
[mask time=2000] 
[mask_off]

さらに５分後[l][cm]

何も起こらない。[l][cm]

そろそろ進もうと思ったそのとき[l][cm]

;メッセージレイヤ大
[position height=400 top=150 left=180]
警告[l][cm]

;効果音
[playse storage="otologic 警告音.mp3" wait=false]

;メッセージレイヤ小
[position height=190 top=500 left=180]
突然看板に警告が表示された。[l][cm]

;メッセージレイヤ大
[position height=400 top=150 left=180]
警告[l][cm]
一定時間操作がない場合、この看板は消失します。[l][cm]

;メッセージレイヤ小
[position height=190 top=500 left=180]
「え？」[l][cm]

;効果音
[playse storage="otologic カウントダウン.mp3" wait=false]

;メッセージレイヤ大
[position height=400 top=150 left=180]
残り１０秒[l][cm]

;メッセージレイヤ小
[position height=190 top=500 left=180]
やばいと思い、急いで看板にタッチした。[l][cm]

;効果音消
[stopse]
@jump target=*common2


*common2
[cm]
;メッセージレイヤ大
[position height=400 top=150 left=180]
【結果】[l][r]
仲良くなったペンギンの数[l]_　　　[emb exp="allcount"]羽[l][cm]


[if exp="allcount==6"]
 ;全T
 @jump storage=81ending.allt.ks target=*common
[elsif exp="allcount >= 4 && allcount <= 5"]
 ;4T以上
 @jump storage=91ending.4t.ks target=*common
[elsif exp="allcount >= 1 && allcount <= 3"]
 ;3T以下
 @jump storage=101ending.3t.ks target=*common
[elsif exp="allcount==0"]
 ;全F
 @jump storage=111ending.allf.ks target=*common
[endif]
