*common1
[cm]

;分岐１
[link storage=64koutei.bunki-false.ks target=*select1]【１】寝転がる[endlink][r]
[link storage=63koutei.bunki-true.ks target=*select1]【２】いつのまにか用意されていたイスに座る[endlink][r]
[link storage=64koutei.bunki-false.ks target=*select2]【３】動かない[endlink][r]
[s][cm]


*common2
[cm]

;分岐２
[link storage=63koutei.bunki-true.ks target=*select2]【１】個性豊か[endlink][r]
[link storage=64koutei.bunki-false.ks target=*select3]【２】生意気[endlink][r]
[link storage=64koutei.bunki-false.ks target=*select4]【３】特に何も[endlink][r]
[s][cm]


*common3
[cm]
;コウテイdefault
[chara_mod name="koutei" face="default" wait=false]
;キングdefault
[chara_mod name="king" face="default"]
「では最後に１つ聞こう。[l][r]
[emb exp="f.player_name"]。ペンギンは好きか？」[l][cm]
#
[link storage=63koutei.bunki-true.ks target=*select3]【１】好き[endlink][r]
[link storage=64koutei.bunki-false.ks target=*select5]【２】嫌い[endlink][r]
[s][cm]



