*select1
[cm]

;分岐３、フンボルト用名前のカウント
[eval exp="name=1"]

;カウント
[eval exp="count=count+1"]

;ジェンツー消える
[chara_hide name="gentoo"]

;ハート０消
[layopt layer="1" visible=false]

;「お名前を入力してください」を表示
[layopt layer="message0" visible="false"]
[ptext layer=0 text="お名前を入力してください" x=0 y=90 size=50 color="black" width=1280 align=center time=0]
[ptext layer=0 text="※８文字まで" x=0 y=180 size=35 color="black" width=1280 align=center time=0]

; [edit] 入力欄を出します。
[edit name="f.player_name" left="490" top="350" width="260" height="40" size="30" maxchars="8" initial="海"]
;OKボタン
[button graphic="ok2botan.maru.png" target="*Part1_Commit" x="395" y="430"]
[s]



*Part1_Commit

[commit]

[cm]
[freeimage layer=0]
[freeimage layer="1"]
[layopt layer="message0" visible="true"]

;ジェンツー出現
[chara_show name="gentoo"]
;ジェンツーsmile
[chara_mod name="gentoo" face="smile"]

;-------------ハート-------------
;ハート１
[image layer="1" x="950" y="5" storage="koukando.ichi.png"]
[layopt layer="1" visible=true time="1000"]
;効果音
[playse storage="otologic heart.mp3"] 
;------------------------------

; [emb] 変数 f.player_name の中身を確認してみます。
#gentoo
「[emb exp="f.player_name"]
 
っていうんだ。[l]良い名前ダネ」[l][cm]

;ジェンツーdefault
[chara_mod name="gentoo" face="default"]

「[emb exp="f.player_name"]
は何が好きなの？」[l][cm]

#

@jump storage=12gentoo.bunki-main.ks target=*common2



*select2
[cm]
;カウント
[eval exp="count=count+1"]

;ジェンツーsmile
[chara_mod name="gentoo" face="smile"]

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

#gentoo
「ホント！？ウレシイナ」[l][cm]

@jump storage=12gentoo.bunki-main.ks target=*common3



*select3
[cm]
;カウント
[eval exp="count=count+1"]

;ジェンツーsmile
[chara_mod name="gentoo" face="smile"]

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

#gentoo

[if exp="name==1"]
;分岐１で名前を入力した場合
 「正解！[l]
 [emb exp="f.player_name"]
 スゴイネ」[l][cm]
[else]
;分岐１で名前を入力しなかった場合
 「正解！[l]
 キミスゴイネ」[l][cm]
[endif]
#

@jump storage=11gentoo.main.ks target=*common2
