*common1

[cm]
;イワトビ開始

;カウント開始
[eval exp="count=0"]
;イワトビ登録
[chara_new name="iwatobi" storage="イワトビ.png" jname="イワトビ"]
;イワトビ表情登録
[chara_face name="iwatobi" face="smile" storage="イワトビ：smile.png"]
[chara_face name="iwatobi" face="angry" storage="イワトビ：angry.png"]
[chara_face name="iwatobi" face="right" storage="イワトビ-：right-straight.png" ]
[chara_face name="iwatobi" face="default" storage="イワトビ.png"]

;イワトビ名前表示可
[ptext name="chara_name_area" layer=message0 width="200" color=white x=200 y=500 size=30 edge=0x000000]
[chara_config ptext="chara_name_area"]

;ハート０
[image layer="1" x="950" y="5" storage="koukando.zero.png"]
[layopt layer="1" visible=true time="1000"]

部屋に入ると、突然何かが飛びかかってきた。[l][cm]

「わ、あぶない！！」[l][cm]

間一髪のところで避けた。[l][cm]

#？？？
「お前、やるな。[l][r]
俺の右ストレートを避けるなんて。[l][r]
何者だ？」[l][cm]
#

「え？」[l][cm]

#？？？
「あぁ、俺から名乗るのが筋ってもんだよな」[l][cm]
#

;イワトビ出現
[chara_show name="iwatobi" width=600 top=10]

#iwatobi
「俺の名前はイワトビ。よろしくな」[l][cm]
#

「私の名前は
[emb exp="f.player_name"]。[l][r]
急に何かと思ったよ」[l][cm]

#iwatobi
「ハハッ、悪かったな。[l][r]
でも、お前スゲーじゃねえか。[l][r]
俺とタイマン張ってくれよ」[l][cm]

「じゃあ、まずは俺から！」[l][cm]
#

;イワトビ消
[chara_hide name="iwatobi"]

イワトビが飛び蹴りをしてきた。[l][cm]

@jump storage=42iwatobi.bunki-main.ks target=*common1


*common2
[cm]
;イワトビ最終

;暗転
[mask time=1500] 
;アデリーdefault 
[chara_mod name="iwatobi" face="default"] 
[mask_off]

;ハート２以上
[if exp="count>=2"]
 ;全体カウント
 [eval exp="allcount=allcount+1"] 
 ;キガシラオープニングカウント
 [eval exp="kigashira-count=1"] 
 ;効果音T
 [playse storage="好感度最終true otologic.mp3"] 

 ;イワトビsmile
 [chara_show name="iwatobi" face="smile" width=600 top=10]
 ;※↑chara_modで不具合

 #iwatobi
 「お前、意外とやるんだな。[l]楽しかったぜ」[l][cm]
 #

 ;イワトビ消
 [chara_hide name="iwatobi"]

 ;ドア出現
 [chara_show name="door" ]

 私は、いつのまにか現れていた白いドアに手をかけた。[l][cm]

;ハート１
[elsif exp="count==1"]
 ;効果音F
 [playse storage="好感度最終false otologic.mp3"]

 ;イワトビangry
 [chara_show name="iwatobi" face="angry" width=600 top=10]
 ;※↑chara_modで不具合

 #iwatobi
 「お前、手抜いてんだろ。[l][r]
 つまんねーことすんなよ。[l][r]
 もういいわ」[l][cm]

 #
 ;イワトビ消
 [chara_hide name="iwatobi"]

 そう言ってイワトビは私を投げ飛ばした。[l][r] 

 ;ドア出現
 [chara_show name="door" wait=false]

 何かにぶつかった感触がして[l][r]

 ;ドア消
 [chara_hide name="door"]

 私は気を失った。[l][cm]

;ハート０
[else]
 ;効果音F
 [playse storage="好感度最終false otologic.mp3"]

 ;イワトビ消
 [chara_hide name="iwatobi"]
 
 イワトビにやられてボロボロになってしまった。[l][cm]
 [emb exp="f.player_name"]は意識を失ってしまった。[l][cm]
 
 ;end
 ;ハート消
 [layopt layer="1" visible=false]

 ;黒背景
 [bg storage="bg.bl.jpg" time="3000"][l]
 
 end[r]
 「強くなろうね」[l][cm]

 [wait time="3000"]
 
 @jump storage=first.ks target=*start
[endif]

@jump storage=first.ks target=*common4
