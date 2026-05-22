*common1

;分岐１
[link storage=24humboldt.bunki-false.ks target=*select1]【１】（バケツをとって）「何してるの？」[endlink][r]
[link storage=23humboldt.bunki-true.ks target=*select1]【２】（バケツをノックして）「こんにちは。お話ししない？」[endlink][r]
[s][cm]


*common2
[if exp="name==1"]
 ;名前入力済み
 #
 「私は
 [emb exp="f.player_name"]。[l][r]
 君はフンボルトペンギンだよね」[l][cm]
 
 ;フンボルトdefault
 [chara_mod name="humboldt" face="default"]

[else]
 ;名前入力まだ
 #
 「私は
 [l]
 ;フンボルト消
 [chara_hide name="humboldt"]
  
 ;ハート消
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
 
 ;フンボルトdefault
 [chara_show name="humboldt" face="default" width=600 height=900 top=1]

  ;ハード表示しなおす
  [if exp="count==1"]
   ;ハート１
   [image layer="1" x="950" y="5" storage="koukando.ni.ichi.png"]
   [layopt layer="1" visible=true time="1000"]
  [else]
   ;ハート０
 　[image layer="1" x="950" y="5" storage="koukando.ni.zero.png"]
   [layopt layer="1" visible=true time="1000"] 
  [endif]

 #
 「私は
 [emb exp="f.player_name"]。[l][r]
 君はフンボルトペンギンだよね」[l][cm]
[endif]


#humboldt
「ハ、ハイ」[l][cm]
#
「………………」[l][cm]
#humboldt
「………………」[l][cm]
#
会話が続かない…。[l][cm]
何か会話のきっかけになるものないかな[l][cm]
そういえば、フンボルトの故郷はチリだった気がする[l][cm]

;分岐２
[locate x=150 y=50]
[button graphic="chiri.png" height="400" storage=23humboldt.bunki-true.ks target=*chiri]

[locate x=800 y=50]
[button graphic="betonamu.png" height="400" storage=24humboldt.bunki-false.ks target=*betonamu]

チリはどっちだっけ？
[s]





