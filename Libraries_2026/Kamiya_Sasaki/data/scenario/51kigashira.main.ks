*common1

[cm]

;キガシラ開始

;カウント開始
[eval exp="count=0"]
;キガシラ登録
[chara_new name="kigashira" storage="きがしら.png" jname="キガシラ"]
;キガシラ表情登録
[chara_face name="kigashira" face="angry" storage="きがしら：angry.png"]
[chara_face name="kigashira" face="read" storage="きがしら：read.png"]
[chara_face name="kigashira" face="smile" storage="きがしら：smile.png"]

;キガシラ名前表示可
[ptext name="chara_name_area" layer=message0 width="200" color=white x=200 y=500 size=30 edge=0x000000]
[chara_config ptext="chara_name_area"]

;ハート０
[image layer="1" x="950" y="5" storage="koukando.zero.png"]
[layopt layer="1" visible=true time="1000"]

;イワトビ最終true
[if exp="kigashira-count=1"]
 遠くでペンギンが本を読んでいるのを見える。[l][cm]
;イワトビ最終false
[else]
 気が付くと遠くでペンギンが本を読んでいるのが見える。[l][cm]
[endif]

;キガシラread
[chara_show name="kigashira" face="read" top=20]

ペンギンに近づく。[l][cm]
「何読んでるの？」[l][cm]

;キガシラdefault
[chara_mod name="kigashira" face="default" top=20]
#???
「……君は、[l]さっき喧嘩をしていた人だね。[l][r]
そんな人に話すことは何もないよ」[l][cm]

#
「ちがうよ。[l][r]
さっきは喧嘩を売られただけで[r]
私はそんなつもりなかったんだけどな」[l][cm]

#???
「……そうか。[l]勘違いしてすまなかった。[l][r]
でも君のことはまだ信用しかねる」[l][cm]

#
どうしよう……。[l][cm]

;キガシラread
[chara_mod name="kigashira" face="read" top=20]

ペンギンの顔をうかがうと、[r]
本の題名が目に入った。[l][cm]

「あ、その本知ってる！[l][r]
『ペンギンのすゝめ』！！」[l][cm]

;キガシラdefault
[chara_mod name="kigashira" face="default" top=20]

#???
「え、本当に知ってるのか……？」[l][cm]
「じゃあ、僕が何ペンギンかも[r]
もちろんわかるんだね」[l][cm]
#
@jump storage=52kigashira.bunki-main.ks target=*common1


*common2
;キガシラ最終
[cm]
;暗転
[mask time=1500] 
[mask_off]

[if exp="count>=2"]
 ;効果音
 [playse storage="好感度最終true otologic.mp3"] 
 ;全体カウント
 [eval exp="allcount=allcount+1"]
 ;キガシラsmile
 [chara_mod name="kigashira" face="smile"]
 #キガシラ
 「疑って悪かった。[l][r]
 どうやら君は嘘をついていないようだ。[l][r]
 仲よくしよう」[l][cm]
[else]
 ;効果音
 [playse storage="好感度最終false otologic.mp3"]
 ;キガシラangry
 [chara_mod name="kigashira" face="angry"]
 #キガシラ
 「嘘をつくような人間は信じられないな。[l][r]
  もう僕に関わらないでくれ」[l][cm]
 #
 キガシラの信用を得ることはできなかった。[l][cm]
 ;キガシラread
 [chara_mod name="kigashira" face="read"]
 キガシラは読書に戻ってしまった。[l][cm]
[endif]

#
;キガシラ消
[chara_hide name="kigashira"]

;ドア出現
[chara_show name="door" ]
私は、いつのまにか現れていた白いドアに手をかけた。[l][cm]

@jump storage=first.ks target=*common5
