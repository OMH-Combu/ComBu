*select1
[cm]
;ドアオープン登録
[chara_new name="door_open" storage="door-open.png"]

ドアを開けた。[l][cm]

;ドア消
[chara_hide name="door"]

;ドアオープン出現
[wait time="0"]
[chara_show name="door_open"]
[chara_mod name="door_open" scale=200 time=1000]

[wait time=2000]

;ドアオープン消
[chara_hide name="door_open"]

;背景黒
[bg storage="bg.bl.jpg"]

「わっ」[l][cm]

強い風が吹きつけてきた。[l][cm]
すぐに風は弱まりドアの先を見ると、[l][r]
そこには真っ暗闇が広がっていた。[l][r]
風が吹いているということは、どこかにつながっているのだろうが……[l][cm]
風の吹いてくる方向を確かめようと、おそるおそる覗き込んだとき、[l][cm]

;ペンギンの手
[freeimage layer="2"]
[layopt layer="2" visible=false]
[image layer="2"  x="400" y="50" height="800" storage="push-pen.png" time="1000"]
[layopt layer="2" visible=true time="1000"]

[wait time="800"]

[layopt layer="2" visible=false]

「えっ」[l][cm]

落ちた。[l][cm]

　　　・・・・・
いや、落とされた

;背景ビル
[bg storage="ochiteru.jpg" time="20"]

ドアの先に地面はなかった。[l][cm]

落ちている……。[l][cm]

周りにはビルが立ち並んでいる。[l][cm]

見知ったビル街だ。[l][cm]

徐々に今までのことが蘇ってきた。[l][cm]

;暗転
[mask time=2000]
;背景灰
[bg storage="yamiochi.jpg"]
;背景全面透かし
[layopt layer="3" visible=false]
[image layer="3"  x="0" y="0" height="800" width="1500" storage="sukasi.png"]
[layopt layer="3" visible=true]
[mask_off]

;人生回想
;幼稚園生
[chara_show name="youchien" x="500" y="0" height="620"]
#少年
「ついてくんなよ。[r]
[emb exp="f.player_name"]とはもう遊ばねーから」[l][cm]
#
;幼稚園生消
[chara_hide name="youchien"]

;小学生
[chara_show name="shougaku" x="500" y="0" height="650"]
#小学生
「くすくす……」[l][cm]
#
;小学生消
[chara_hide name="shougaku"]

;母
[chara_show name="haha" x="700" height="700"]
#お母さん
「どうしてこんなこともできないの‼[r]
どうして上手にできないの‼[r]
ねえ！　どうして⁉」[l][cm]
#
;母消
[chara_hide name="haha"]

;高校生
[chara_show name="joshigakusei" x="350" y="0" height="700" wait=false]
[chara_show name="dannshigakusei" x="700" y="0" height="700"]
#女子
「[emb exp="f.player_name"]ってずれてるよね」[l][cm]
#男子
「今、そういうのじゃないから。[r]
空気読めよ」[l][cm]
#
;高校生消
[chara_hide name="joshigakusei" wait=false]
[chara_hide name="dannshigakusei"]

;上司
[chara_show name="joushi" x="500" height="700"]
#上司
「はあ。お前そんなこともできないのかよ。[r]
逆に何ができんだよ」[l][cm]
#
;上司消
[chara_hide name="joushi"]

;ペンギン回想
;ジェンツーangry
[chara_show name="gentoo" face="angry"]
#gentoo
「キミって空気読めないよね。」
[wait time="500"]
[cm]
#
;ジェンツー消
[chara_hide name="gentoo"]

;フンボルト
[chara_show name="humboldt" face="angry" width=600 height=900 top=1]
#humboldt
「さ、さっきからなんなんですか。[r]
ボクは誰とも話したくないんです。[r]
空気よんでください」
[wait time="500"]
[cm]
#
;フンボルト消
[chara_hide name="humboldt"]

;アデリーangry
[chara_show name="adeliae" face="angry" width=600 height=900 top=1]
#adeliae
「お前、嫌なヤツだな。[r]
人の気にさわることばっか言いやがって。[r]
もっと空気読めよ、バーカ」
[wait time="500"]
[cm]
#
;アデリー消
[chara_hide name="adeliae"]

;イワトビangry
[chara_show name="iwatobi" face="angry" width=600 top=10]
#iwatobi
「お前、手抜いてんだろ。[r]
つまんねーことすんなよ。[r]
もういいわ」
[wait time="500"]
[cm]
#
;イワトビ消
[chara_hide name="iwatobi"]

;キガシラangry
[chara_show name="kigashira" face="angry" top=20]
#kigashira
「嘘をつくような人間は信じられないな。[r]
もう僕に関わらないでくれ」
[wait time="500"]
[cm]
#
;キガシラ消
[chara_hide name="kigashira"]

;コウテイ・キング
[chara_show name="koutei" face="angry" wait=false]
[chara_show name="king" face="angry" height=750 top=70]
#コウテイたち
「………」
[wait time="1500"]
[cm]
#
;コウテイ・キング消
[chara_hide name="koutei" wait=false]
[chara_hide name="king"]

;暗転
[mask time=2000]
;背景ビル
[bg storage="ochiteru.jpg"]
[freeimage layer="3"]
[mask_off]

ああ、[l][cm]

;黒背景
[bg storage="bg.bl.jpg" time="0"]

ろくな人生じゃなかったな。[l][cm]

;メッセージレイヤを非表示にしておく
@layopt layer=message0 visible=false

;血
[wait time="0"]
[freeimage layer="2"]
[layopt layer="2" visible=false]
[image layer="2"  x="0" y="0" height="750" width="1850" storage="chishibuki.png"]
[layopt layer="2" visible=true time="1000"]

;効果音
[playse storage="otologic siren.mp3"] 

[wait time="1500"]

;メッセージレイヤを表示
@layopt layer=message0 visible=true

end[r]
「次は上手にできるといいね」[l][cm]
[wait time="3000"]

[freeimage layer="2"]
;メッセージレイヤを非表示にしておく
@layopt layer=message0 visible=false

@jump storage=credit2.ks target=*common
