*common
[cm]

;メッセージレイヤ大
[position height=400 top=150 left=180]
;効果音
[playse storage="otologic fanfare.mp3" wait=false]
Congratulations![l][r]
全てのペンギンと仲良くなるなんて！！[l][r]
君は本当にペンギンが好きなんだね。[l][r]
これからも好きでいてね。[l][r]
帰るためのドアは向こうだよ。[l][r]
後悔のない選択をしてね。[l][r]
応援してるよ。[l][cm]

;メッセージレイヤ小
[position height=190 top=500 left=180]
そこまで出ると看板は動かなくなった。[l][r]
背後にはいつから出ていたのか[r]
;看板消
[chara_hide name="kanban"]
;ドア出現
[chara_show name="door" wait=false]
今まで通ってきたものと同じ白いドアがあった。[l][cm]

ドアを開けようと、ドアノブに手をかけたとき
[l][cm]

#hatena
「まって！」[l][cm]
#
誰かに呼び止められた。[l][r] 
振り返ると、[l][cm]

そこには仲良くなったペンギンたちがいた。[l][cm]

;ドア消
[chara_hide name="door"]
;ジェンツーsune
[chara_show name="gentoo" face="sune"]
#gentoo
「ふーん、ボクをおいていくんだ」[l][cm]
#
;ジェンツー消
[chara_hide name="gentoo"]

;フンボルトangry
[chara_show name="humboldt" face="angry" width=600 height=900 top=1]
#humboldt
「い、いかないでほしいです……」[l][cm]
#
;フンボルト消
[chara_hide name="humboldt"] 

;アデリーsmile
[chara_show name="adeliae" face="smile" width=600 height=900 top=1]
#adeliae
「[emb exp="f.player_name"]、もっと語り合おうぜ」[l][cm]
#
;アデリー消
[chara_hide name="adeliae"]

;イワトビangry
[chara_show name="iwatobi" face="angry" width=600 top=10]
#iwatobi
「お前、勝ち逃げなんて許さねーぞ！」[l][cm]
#
;イワトビ消
[chara_hide name="iwatobi"]

;キガシラread
[chara_show name="kigashira" face="read" top=20] 
#kigashira
「君に読んで欲しい本があるんだけど」[l][cm]
#
;キガシラ消
[chara_hide name="kigashira"]

;キングlast
[chara_show name="king" face="last" height=750 top=70]
#king
「別に私はどちらでも構わなくてよ。[r]
あなたの好きにしたら良いのではなくて？」[l][cm]
#
;キング消
[chara_hide name="king"]

;コウテイsmile
[chara_show name="koutei" face="smile"]
#koutei
「[emb exp="f.player_name"]。[r]
[emb exp="f.player_name"]がいたいなら好きなだけいてくれて良い」[l][cm]
「君ならいつだって大歓迎だ」[l][cm]
;コウテイdefault
[chara_mod name="koutei" face="default"]
「[emb exp="f.player_name"]はどうしたい？」[l][cm]
#
「私は[l][cm]
@jump storage=82ending.allt-bunki.ks target=*common
