*select1
[cm]

「うわっ」[l][cm]
飛び蹴りをくらってしまった。[l][cm]

;イワトビsmile
[chara_show name="iwatobi" face="smile" top=20] 

#iwatobi
「ハハッ。[r]
まだまだこれからだぜ」[l][cm]

@jump storage=42iwatobi.bunki-main.ks target=*common2


*select2
[cm]

「ぐわっ」[l][r]
ホームラン！[l][cm]

;イワトビsmile
[chara_show name="iwatobi" face="smile" top=20] 

#iwatobi
「お、だいぶ飛んだな（笑）」[l][cm]

@jump storage=42iwatobi.bunki-main.ks target=*common3


*select3
[cm]

;イワトビ消
[chara_hide name="iwatobi"]

イワトビもジャンプして[r]
クチバシが[emb exp="f.player_name"]にクリーンヒット！[l][cm]

;イワトビsmile
[chara_show name="iwatobi" face="smile" top=20] 

#iwatobi
「ペンギンだって跳べるんだぜ」[l][cm]
#

@jump storage=41iwatobi.main.ks target=*common2