*select1
[cm]
;カウント
[eval exp="count=count+1"]

;--------------ハート-------------
;ハート消
[layopt layer="1" visible=false]
;ハート１
[image layer="1" x="950" y="5" storage="koukando.ichi.png"]
[layopt layer="1" visible=true time="1000"]
;効果音
[playse storage="ハート otologic.mp3"] 
;------------------------------

避けることに成功！！[l][cm]

（ボスッ）[l][cm]
イワトビはどこからか現れたダンボールに突っ込んだ。[l][cm]

;イワトビsmile
[chara_show name="iwatobi" face="smile" top=10] 

#iwatobi
「お、やるな。[l]でもこれはどうかな」[l][cm]

@jump storage=42iwatobi.bunki-main.ks target=*common2


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

どこからか出てきた凍ったマグロで受け止めた。[l][cm]

;イワトビdefault
[chara_mod name="iwatobi" face="default" width=600 top=10]

#iwatobi
「くそっ、[l]お前、どこからそのマグロ出してきたんだ」[l][cm]

@jump storage=42iwatobi.bunki-main.ks target=*common3


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

;イワトビ消
[chara_hide name="iwatobi"]

イワトビが
[emb exp="f.player_name"]
の上を通過して[r]
クチバシが壁に刺さった。[l][cm]

#iwatobi
「□&○%$■☆♭#♪!?」[l][cm]
#

@jump storage=41iwatobi.main.ks target=*common2
