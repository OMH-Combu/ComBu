*select1
[cm]
;ドア消
[chara_hide name="door"]
しばらくするとドアは消えた。[l][cm]

;リスタートドア出現
[chara_show name="restart.door" wait=false]
そのかわりに『リスタートはこちら』と書かれた看板と[r]
水色のドアが出てきた。[l][cm]


「リスタート……？」[l][cm]

もう一度[l][r]
やり直せるかもしれない。[l][cm]

でも、[l][cm]

;暗転
[mask time=2000]
;リスタートドア消
; 画面に出ている全キャラを消す
[chara_hide_all]
;背景全面透かし
[layopt layer="3" visible=false]
[image layer="3"  x="0" y="0" height="800" width="1500" storage="sukasi.png"]
[layopt layer="3" visible=true]
[mask_off]



;ペンギン回想
;ジェンツーangry
[chara_show name="gentoo" face="angry"]
#gentoo
「キミって空気読めないよね。」[l][cm]
#
;ジェンツー消
[chara_hide name="gentoo"]

;フンボルトangry
[chara_show name="humboldt" face="angry" width=600 height=900 top=1]
#humboldt
「さ、さっきからなんなんですか。[r]
 ボクは誰とも話したくないんです。[r]
 空気よんでください」[l][cm]
#
;フンボルト消
[chara_hide name="humboldt"]

;アデリーangry
[chara_show name="adeliae" face="angry" width=600 height=900 top=1]
#adeliae
「お前、嫌なヤツだな。[r]
 人の気にさわることばっか言いやがって。[r]
 もっと空気読めよ、バーカ」[l][cm]
#
;アデリー消
[chara_hide name="adeliae"]

;イワトビangry
[chara_show name="iwatobi" face="angry" width=600 top=10]
#iwatobi
「お前、手抜いてんだろ。[r]
 つまんねーことすんなよ。[r]
 もういいわ」[l][cm]
#
;イワトビ
[chara_hide name="iwatobi"]

;キガシラangry
[chara_show name="kigashira" face="angry" top=20]
#kigashira
「嘘をつくような人間は信じられないな。[r]
 もう僕に関わらないでくれ」[l][cm]
#
;キガシラ
[chara_hide name="kigashira"]

;コウテイsad・キングangry
[chara_show name="koutei" face="sad" height=700 wait=false]
[chara_show name="king" face="angry" height=750 top=70]
#コウテイたち
「……。」[l][cm]
[wait time=3000]
#
;コウテイ・キング消
[chara_hide name="koutei" wait=false]
[chara_hide name="king"]

;暗転
[mask time=2000]
[layopt layer="3" visible=false]
;リスタートドア出現
[chara_show name="restart.door"]
[mask_off]

私はそこから動けなかった。[l][r]
しばらくするとそのドアも消えた。[l][cm]
;リスタートドア消
; 画面に出ている全キャラを消す
[chara_hide_all]

;黒背景
[bg storage="bg.bl.jpg" time="3000"][l]
end[r]
「結局ひとりぼっち」[l][r]
[wait time="3000"]

;メッセージレイヤを非表示にしておく
@layopt layer=message0 visible=false

@jump storage=credit2.ks target=*common