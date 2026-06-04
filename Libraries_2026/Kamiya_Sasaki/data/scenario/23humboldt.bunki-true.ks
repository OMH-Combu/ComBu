*select1

[cm]
;カウント
[eval exp="count=count+1"]

#humboldt
「…………」[l][cm]
#

;暗転
[mask time=1500] 
;ドア消
[chara_hide name="door"]
[wait time=1000]
[mask_off]


５分後[l][cm]

;フンボルトangry
[chara_mod name="humboldt" face="angry"] 

;-------------ハート-------------
;ハート消
[layopt layer="1" visible=false]
;ハート１
[image layer="1" x="950" y="5" storage="koukando.ni.ichi.png"]
[layopt layer="1" visible=true time="1000"]
;効果音
[playse storage="otologic heart.mp3"] 
;------------------------------

#humboldt
「どちら様ですか」[l][cm]

@jump storage=22humboldt.bunki-main.ks target=*common2


*chiri
[cm]
;カウント
[eval exp="count=count+1"]

;-------------ハート-------------
;ハート消
[layopt layer="1" visible=false]

[if exp="count==2"]
 ;ハート２
 [image layer="1" x="950" y="5" storage="koukando.ni.ni.png"]
[else]
 ;ハート１
 [image layer="1" x="950" y="5" storage="koukando.ni.ichi.png"]
[endif]
;ハート再表示
[layopt layer="1" visible=true time="1000"]

;効果音
[playse storage="otologic heart.mp3"] 
;------------------------------

;チリ画像
[layopt layer="2" visible=false]
[image layer="2"  x="150" y="50" height="400" storage="chiri.png"]
[layopt layer="2" visible=true time="1000"]

「あ、あれチリだよね！[l][r]
私チリ好きなんだ。[l]モアイ像渋くていいよね」[l][cm]

;フンボルトsmile
[chara_mod name="humboldt" face="smile"]

#humboldt
「ホ、ホント！？[l][r]
ボクの故郷のこと、そういってもらって嬉しいな」[l][cm]
#

;チリ消
[layopt layer="2" visible=false]

@jump storage=21humboldt.main.ks target=*common2
