*common1
[cm]

;分岐１
[link storage=44iwatobi.bunki-false.ks target=*select1]【１】左に避ける[endlink][r]
[link storage=43iwatobi.bunki-true.ks target=*select1]【２】右に避ける[endlink][r]
[s][cm]


*common2
[cm]
#
そう言って、イワトビは金属バットを振りかざしてきた。[l][cm]
;イワトビバット
[chara_mod name="iwatobi" face="right"]

;分岐２
[link storage=44iwatobi.bunki-false.ks target=*select2]【１】しゃがむ[endlink][r]
[link storage=43iwatobi.bunki-true.ks target=*select2]【２】受け止める[endlink][r]
[s][cm]


*common3
[cm]
;イワトビdefault
[chara_mod name="iwatobi" face="default" width=600 top=10]

「これでサイゴだ！」[l][cm]
#
イワトビはクチバシでつつこうとしている。[l][cm]

;分岐３
[link storage=43iwatobi.bunki-true.ks target=*select3]【１】うしろに反る[endlink][r]
[link storage=44iwatobi.bunki-false.ks target=*select3]【２】ジャンプ[endlink][r]
[s][cm]
