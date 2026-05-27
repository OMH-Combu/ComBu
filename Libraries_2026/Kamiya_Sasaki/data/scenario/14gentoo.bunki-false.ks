*select1

;分岐３、フンボルト用名前のカウント
[eval exp="name=0"]

[cm]
;ジェンツーangry
[chara_mod name="gentoo" face="angry"]
「フーン、名前教えてくれないんだ[l][r]
まあ、いいよ」[l][cm]

;ジェンツーdefault
[chara_mod name="gentoo" face="default"]

「キミは何が好きなの？」[l][cm]
#

@jump storage=12gentoo.bunki-main.ks target=*common2



*select2

[cm]
#gentoo
;ジェンツーangry
[chara_mod name="gentoo" face="angry"]
「フーン、あざらしって[r]
ボクの天敵ナンダケドネ」[l][cm]

@jump storage=12gentoo.bunki-main.ks target=*common3



*select3

[cm]
#gentoo
;ジェンツーangry
[chara_mod name="gentoo" face="angry"]
「ソンナワケナイジャン。」[l][cm]
#

@jump storage=11gentoo.main.ks target=*common2