*start
*title
;メッセージレイヤを非表示にしておく
@layopt layer=message0 visible=false

;背景画像を設定
[image layer="base" page="fore" storage=titlele.jpg]

;はじめからボタン
[locate x=130 y=500 ]
[button graphic="start.toumei.png" enterimg="start.iroari.png" target=*first]

;つづきからボタン
[locate x=660 y=500 ]
[button graphic="conti.toumei.png" enterimg="conti.iroari.png" target=*loadmenu]

[s]

;つづきからボタンが押された場合。ロード画面を表示
*loadmenu
[cm]
[showload]

[jump target=*title]
[s]

;ストーリー最初から
*first
[cm]
[mask time=2000]
[bg storage="bg.white.jpg"]
[mask_off]

@layopt layer=message0 visible=true
[position layer=message0 height=190 top=500 left=180 margint=25]
[cm]

目が覚めると、真っ白な世界にいた。[l][cm]

[mask_off]

あたりを見回すと、看板が一つ立っていた。[l][r]

[chara_new name="kanban" storage="kanban.png" jname="看板"]
[chara_show name="kanban" top=30]

近づいてみると、そこには何やら書かれている。[l][cm]

[position height=400 top=150 left=180]
ペンギンと仲良くなりましょう。[l][cm]

[position height=190 top=500 left=180]
「ペンギンと仲良くなる……？」[l][cm]

[chara_hide name="kanban"]

気付くと目の前に白いドアがあった。[l][r]

[chara_new name="door" storage="door.png" jname="ドア"]
[chara_show name="door" ]

入ってみよう。[l][cm]

;暗転
[mask time=2000] 
[chara_hide name="door"]
[mask_off]


;全体カウント
[eval exp="allcount=0"]

;ジェンツー入場
@jump storage=11gentoo.main.ks target=*common1

*common1
;ジェンツー退場
;暗転
[mask time=1000] 
;ドア消
[chara_hide name="door"]
;ハート全消し
[layopt layer="1" visible=false]
[freeimage layer="1"]
[mask_off]


;フンボルト入場
@jump storage=21humboldt.main.ks target=*common1

*common2
;フンボルト退場
;暗転
[mask time=1000] 
;ドア消
[chara_hide name="door"]
;ハート全消し
[layopt layer="1" visible=false]
[freeimage layer="1"]
[mask_off]


;アデリー入場
@jump storage=31adeliae.main.ks target=*common1

*common3
;アデリー退場
;暗転
[mask time=1000] 
;ドア消
[chara_hide name="door"]
;ハート全消し
[layopt layer="1" visible=false]
[freeimage layer="1"]
[mask_off]


;イワトビ入場
@jump storage=41iwatobi.main.ks target=*common1

*common4
;イワトビ退場
;暗転
[mask time=1000] 
;ドア消
[chara_hide name="door"]
;ハート全消し
[layopt layer="1" visible=false]
[freeimage layer="1"]
[mask_off]


;キガシラ入場
@jump storage=51kigashira.main.ks target=*common1

*common5
;キガシラ退場
;暗転
[mask time=1000] 
;ドア消
[chara_hide name="door"]
;ハート全消し
[layopt layer="1" visible=false]
[freeimage layer="1"]
[mask_off]


;コウテイ入場
@jump storage=61koutei.main.ks target=*common1

*common6
;コウテイ退場
;暗転
[mask time=1000] 
;ドア消
[chara_hide name="door"]
;ハート全消し
[layopt layer="1" visible=false]
[freeimage layer="1"]
[mask_off]


;エンディング前
@jump storage=71before.ending.ks target=*common1