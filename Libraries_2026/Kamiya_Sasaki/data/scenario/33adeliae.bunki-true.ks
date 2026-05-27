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
[playse storage="ハート otologic.mp3"] 
;------------------------------

;アデリーsmile
[chara_mod name="adeliae" face="smile"] 

#adeliae
「よく知ってるな」[l][cm]

「お前悪いヤツじゃなさそうだな」[l][cm]

@jump storage=32adeliae.bunki-main.ks target=*common2



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
[playse storage="ハート otologic.mp3"] 
;------------------------------

;アデリーsmile
[chara_mod name="adeliae" face="smile"] 

#adeliae
「お前わかるヤツだな」[l][cm]

「この良さがわかるヤツは久しぶりだぜ」[l][cm]

@jump storage=32adeliae.bunki-main.ks target=*common3


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
[playse storage="ハート otologic.mp3"] 
;------------------------------

;アデリーsmile
[chara_mod name="adeliae" face="smile"] 

#adeliae
「お前の目もなかなか悪くねえな」[l][cm]
「今度俺おすすめのアイケア教えてやるよ」[l][cm]
#

@jump storage=31adeliae.main.ks target=*common2