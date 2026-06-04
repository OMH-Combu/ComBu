*select1
[cm]
;カウント
[eval exp="count=count+1"]

;-------------ハート-------------
;ハート消
[layopt layer="1" visible=false]
;ハート１
[image layer="1" x="950" y="5" storage="koukando.ichi.png"]
[layopt layer="1" visible=true time="1000"]
;効果音
[playse storage="otologic heart.mp3"] 
;------------------------------

@jump storage=61koutei.main.ks target=*common2


*select2
[cm]
;カウント
[eval exp="count=count+1"]

;-------------ハート-------------
;ハート消
[layopt layer="1" visible=false]

[if exp="count==2"]
 ;ハート２
 [image layer="1" x="950" y="5" storage="koukando.ni.png"]
[else]
 ;ハート１
 [image layer="1" x="950" y="5" storage="koukando.ichi.png"]
[endif]

;ハート再表示
[layopt layer="1" visible=true time="1000"]

;効果音
[playse storage="otologic heart.mp3"] 
;------------------------------

;コウテイsmile
[chara_mod name="koutei" face="smile" wait=false]
;キングsmile
[chara_mod name="king" face="smile"]
#koutei
「ハハッ、そうであろう。[l][r]
我が民は変わり者が多くてな」[l][cm]

@jump storage=62koutei.bunki-main.ks target=*common3


*select3
[cm]
;カウント
[eval exp="count=count+1"]

;-------------ハート-------------
;ハート消
[layopt layer="1" visible=false]

[if exp="count==3"] 
 ;ハート３
 [image layer="1" x="950" y="5" storage="koukando.san.png"]
[elsif exp="count==2"] 
 ;ハート２
 [image layer="1" x="950" y="5" storage="koukando.ni.png"]
[else]
 ;ハート１
 [image layer="1" x="950" y="5" storage="koukando.ichi.png"]
[endif]

;ハート再表示
[layopt layer="1" visible=true time="1000"]

;効果音
[playse storage="otologic heart.mp3"] 
;------------------------------

;コウテイsmile
[chara_mod name="koutei" face="smile" wait=false]
;キングsmile
[chara_mod name="king" face="smile"]
#koutei
「そうか。それは良かった。[l][r]
これからも好きでいてくれたらうれしい」[l][cm]

#
コウテイは嬉しそうにそう言った。[l][cm]
#
@jump storage=61koutei.main.ks target=*common3
