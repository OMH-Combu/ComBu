*common1

[cm]
;フンボルト開始

;カウント開始
[eval exp="count=0"]
;フンボルト登録
[chara_new name="humboldt" storage="フンボルト：ばけつ.png" jname="フンボルト"]
;フンボルト表情登録
[chara_face name="humboldt" face="smile" storage="フンボルト：smile.png"]
[chara_face name="humboldt" face="angry" storage="フンボルト：angry.png"]
[chara_face name="humboldt" face="default" storage="フンボルト.png"]
[chara_face name="humboldt" face="baketsu" storage="フンボルト：ばけつ.png"]

;フンボルト出現
[chara_show name="humboldt" width=600 height=900 top=1]

;フンボルト名前表示可
[ptext name="chara_name_area" layer=message0 width="200" color=white x=200 y=500 size=30 edge=0x000000]
[chara_config ptext="chara_name_area"]

;ハート０
[image layer="1" x="950" y="5" storage="koukando.ni.zero.png"]
[layopt layer="1" visible=true time="1000"]

…………。[l][cm]
「バケツ……？」[l][cm]
とりあえず話しかけてみよう。[l][cm]

@jump storage=22humboldt.bunki-main.ks target=*common1


*common2
[cm]
;フンボルト最終

;暗転
[mask time=2000] 
;フンボルトdefault
[chara_mod name="humboldt" face="default"]
[mask_off]

;ハート２以上
[if exp="count==2"]
 ;全体カウント
 [eval exp="allcount=allcount+1"] 
 ;効果音T
 [playse storage="otologic koukando-last-true.mp3"] 

 ;フンボルトsmile
 [chara_mod name="humboldt" face="smile"]
 
 #フンボルト
 「[emb exp="f.player_name"] 
 はやさしいね。[l][r]
 [emb exp="f.player_name"]
 とならずっとお話できそう」 [l][cm]
 #

 私もずっと喋っていたいけれど……。[l][cm]

;ハート１以下
[else]
 ;効果音F
 [playse storage="otologic koukando-last-false.mp3"]

 ;フンボルトangry
 [chara_mod name="humboldt" face="angry"]

 #フンボルト
 「さ、さっきからなんなんですか。[l][r]
 ボクは誰とも話したくないんです。[l][r]
 空気よんでください」[l][cm]
 #

 ;フンボルトbaketsu
 [chara_mod name="humboldt" face="baketsu"]

 フンボルトはバケツをかぶって喋らなくなってしまった。[l][cm]
[endif]

;フンボルト消
[chara_hide name="humboldt"]

;ドア出現
[chara_show name="door"]

しかたがないので、[r]
私は、いつのまにか現れていた白いドアに手をかけた。[l][cm]

@jump storage=first.ks target=*common2
