*common1

[cm]
;ジェンツー開始

;カウント開始
[eval exp="count=0"]
;ジェンツー登録
[chara_new name="gentoo" storage="ジェンツー.png" jname="ジェンツー"]
;ジェンツー表情登録
[chara_face name="gentoo" face="smile" storage="ジェンツー：smile.png"]
[chara_face name="gentoo" face="angry" storage="ジェンツー：angry.png"]
[chara_face name="gentoo" face="sune" storage="ジェンツーsune.png"]

;ジェンツー出現
[chara_show name="gentoo" width=500 height=700]

;ジェンツー名前表示可
[ptext name="chara_name_area" layer=message0 width="200" color=white x=200 y=500 size=30 edge=0x000000]
[chara_config ptext="chara_name_area"]

;ハート０
[image layer="1" x="950" y="5" storage="koukando.zero.png"]
[layopt layer="1" visible=true time="1000"]

ドアを開けると、そこにはペンギンがいた。[l][cm]

#gentoo
「ネエネエ、キミだあれ？」[l][cm]
#

;フンボルト名前用
[eval exp="name=0"]

@jump storage=12gentoo.bunki-main.ks target=*common1


*common2
[cm]
;ジェンツー最終

;暗転
[mask time=2000]
;ジェンツーdefault
[chara_mod name="gentoo" face="default"] 
[mask_off]

;ハート２以上
[if exp="count>=2"]
 ;全体カウント
 [eval exp="allcount=allcount+1"]
 ;効果音T
 [playse storage="otologic koukando-last-true.mp3"] 
 
 ;ジェンツーsmile
 [chara_mod name="gentoo" face="smile"]

 #ジェンツー
 「ボク、もっとキミのこと知りたいナ。[l][r]
 でも、キミを待っている子がいるからまた今度ネ」[l][cm]

;ハート１以下
[else] 
 ;効果音F
 [playse storage="otologic koukando-last-false.mp3"]

 ;ジェンツーsune
 [chara_mod name="gentoo" face="sune"]
 
 #ジェンツー
 「キミって空気読めないよね。」[l][cm]
 「モーイイヤ。バイバイ。」[l][cm]
[endif]

#

;ジェンツー消
[chara_hide name="gentoo"]

そういって、ジェンツーは去っていった。[l][cm]

;ドア出現
[chara_show name="door"]
私は、いつのまにか現れていた白いドアに手をかけた。[l][cm]

@jump storage=first.ks target=*common1
