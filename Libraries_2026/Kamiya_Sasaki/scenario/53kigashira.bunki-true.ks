*select1
[cm]
;カウント
[eval exp="count=count+1"]

;-------------ハート-------------
;ハート０消
[layopt layer="1" visible=false]
;ハート１
[image layer="1" x="950" y="5" storage="koukando.ichi.png"]
[layopt layer="1" visible=true time="1000"]
;効果音
[playse storage="ハート otologic.mp3"] 
;------------------------------

#キガシラ
「正解だ……。[l][r]
まぁまぐれでしょ」[l][cm]

@jump storage=52kigashira.bunki-main.ks target=*common2


*select2
[cm]
;カウント
[eval exp="count=count+1"]

;-------------ハート-------------
;ハート１消
[layopt layer="1" visible=false]
;ハート２
[image layer="1" x="950" y="5" storage="koukando.ni.png"]
[layopt layer="1" visible=true time="1000"]
;効果音
[playse storage="ハート otologic.mp3"] 
;------------------------------

#キガシラ
「正解……。[l][r]
本当に君は知っていたのか……」[l][cm]

@jump storage=52kigashira.bunki-main.ks target=*common3


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
[else]
 ;ハート２
 [image layer="1" x="950" y="5" storage="koukando.ni.png"]
[endif]

;ハート再表示
[layopt layer="1" visible=true time="1000"]

;効果音
[playse storage="ハート otologic.mp3"] 
;------------------------------

#キガシラ
「正解。[l][r]
君は本当にペンギンについて知っているようだな」[l][cm]
#

@jump storage=51kigashira.main.ks target=*common2