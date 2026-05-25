*common1
[cm]

;分岐１
[link storage=13gentoo.bunki-true.ks target=*select1]【１】本名を名乗る[endlink][r]
[link storage=14gentoo.bunki-false.ks target=*select1]【２】「ペンギン博士だよ」[endlink][r]
[s][cm]


*common2

;分岐２
[link storage=13gentoo.bunki-true.ks target=*select2]【１】「もちろん、ペンギン！」[endlink][r]
[link storage=14gentoo.bunki-false.ks target=*select2]【２】「アザラシかな」[endlink][r]
[s][cm]


*common3

[cm]
;ジェンツーdefault
[chara_mod name="gentoo" face="default"]
「じゃあ、ボクは何が好きでしょう！」[l][cm]

#
;分岐３
[link storage=13gentoo.bunki-true.ks target=*select3]【１】「ホッケ」[endlink][r]
[link storage=14gentoo.bunki-false.ks target=*select3]【２】「サメ」[endlink][r]
[s][cm]