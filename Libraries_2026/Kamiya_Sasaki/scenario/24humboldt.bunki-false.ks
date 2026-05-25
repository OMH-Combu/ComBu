*select1

[cm]
;フンボルトangry
[chara_mod name="humboldt" face="angry"] 
#humboldt
「ひぃ。な、なんですか」[l][cm]

@jump storage=22humboldt.bunki-main.ks target=*common2


*betonamu
[cm]

;ベトナム画像
[layopt layer="2" visible=false]
[image layer="2"  x="800" y="50" height="400" storage="betonamu.png"]
[layopt layer="2" visible=true time="1000"]

「あ、あれチリだよね！[l][r]
私チリ好きなんだ。[l]モアイ像渋くていいよね」[l][cm]

#humboldt
「それベトナムだけど……」[l][cm]
#

;ベトナム消
[layopt layer="2" visible=false]

@jump storage=21humboldt.main.ks target=*common2