*common1

[cm]
;アデリー開始

;カウント開始
[eval exp="count=0"]
;アデリー登録
[chara_new name="adeliae" storage="アデリー.png" jname="アデリー"]
;アデリー表情登録
[chara_face name="adeliae" face="smile" storage="アデリー：smile.png"]
[chara_face name="adeliae" face="angry" storage="アデリー：angry.png"]
[chara_face name="adeliae" face="tokuige" storage="アデリー：tokuige.png"]
[chara_face name="adeliae" face="default" storage="アデリー.png"]

;アデリー名前表示可
[ptext name="chara_name_area" layer=message0 width="200" color=white x=200 y=500 size=30 edge=0x000000]
[chara_config ptext="chara_name_area"]

;ハート０
[image layer="1" x="950" y="5" storage="koukando.zero.png"]
[layopt layer="1" visible=true time="1000"]

次の部屋に行くとそこには何もいなかった。[l][cm]
これからどうしようかと考えていると、[l][cm]
#？？？
「おい」[l][cm]
#
後ろから声をかけられた。[l][cm]
振り返ってみると、[l][cm]

;アデリー出現
[chara_show name="adeliae" width=600 height=900 top=1]

「…………」[l][cm]
リーゼントのペンギンがいた。[l][cm]

#adeliae
「おい、[l]無視するなよ」[l][cm]
「お前誰だよ」[l][cm]
#
「私は[emb exp="f.player_name"]」[l][cm]
「君は………[l][r]
どこかで見たことある気がする」[l][cm]
「あ、あれだ！」[l][cm]

@jump storage=32adeliae.bunki-main.ks target=*common1


*common2
[cm]
;アデリー最終

;暗転
[mask time=2000]
;アデリーdefault 
[chara_mod name="adeliae" face="default"] 
[mask_off]

;ハート２以上
[if exp="count>=2"]
 ;全体カウント
 [eval exp="allcount=allcount+1"] 
 ;効果音T
 [playse storage="otologic koukando-last-true.mp3"] 

 ;アデリーsmile
 [chara_mod name="adeliae" face="smile"]
 
 #アデリー
 「お前、案外イケてるヤツだな。[l][r]
 仲良くしようぜ」[l][cm]
 「お前なら、きっと次のヤツとも仲良くなれるぜ」[l][cm]
 「じゃあな」[l][cm]
 #
 
 ;アデリー消
 [chara_hide name="adeliae"]
 ;ドア出現
 [chara_show name="door" wait=false]

 その言葉を背に、[l][r]

;ハート１以下
[else]
 ;効果音F
 [playse storage="otologic koukando-last-false.mp3"]

 ;アデリーangry
 [chara_mod name="adeliae" face="angry"]

 #アデリー
 「お前、嫌なヤツだな。[l][r]
 人の気にさわることばっか言いやがって」[l][cm]
 「もっと空気読めよ、バーカ」[l][cm]
 #
 完全に嫌われてしまった。[l][cm]

 ;アデリー消
 [chara_hide name="adeliae"]
 ;ドア出現
 [chara_show name="door" wait=false]

 しかたがないので、[l][r]
[endif]

私は、いつのまにか現れていた白いドアに手をかけた。[l][cm]

@jump storage=first.ks target=*common3
