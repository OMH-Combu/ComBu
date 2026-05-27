*select1
[cm]
#キガシラ
「不正解だ。[l][r]
嘘はつかないほうがいいぞ」[l][cm]
#
ペンギンは去っていった。[l][cm]

;end
#
;キガシラ消
[chara_hide name="kigashira"]
;ハート消
[layopt layer="1" visible=false]
;黒背景
[bg storage="bg.bl.jpg" time="3000"][l]
end[r]
「嘘つきはあざらしのはじまり」[l][cm]
[wait time="3000"]
@jump storage=first.ks target=*start


*select2
[cm]
#キガシラ
「不正解。[l][r]
さっきはやっぱりまぐれだったんだな」[l][cm]
@jump storage=52kigashira.bunki-main.ks target=*common3


*select3
[cm]
#キガシラ
「不正解。[l][r]
私に媚びを売ればいいわけではないんだよ」[l][cm]
#
@jump storage=51kigashira.main.ks target=*common2


*select4
[cm]
#キガシラ
「不正解。[l][r]
危うく君に騙されるところだったよ」[l][cm]
#
@jump storage=51kigashira.main.ks target=*common2