;チュートリアル用スクリプトファイル

*start
[wait time=200]

吾輩わがはいは猫である。名前はまだ無い。[l][r]
どこで生れたかとんと見当けんとうがつかぬ。[l][cm]
何でも薄暗いじめじめした所でニャーニャー泣いていた事だけは記憶している。[l]
吾輩はここで始めて人間というものを見た。[l][r]

ここまで横書きで表示されています。[l][r]
縦書きに変更します[l][cm]

[position vertical=true]
ここは縦書きで表示されていますね？[l][r]
横書きに戻します[l][cm]
[position vertical=false]
[cm]
横書きで表示されていますね？ 

メッセージウィンドウの高さを変更します[l][cm]
[position height=160 top=430]
[cm]
メッセージウィンドウが下に表示されましたね？

[position layer=message0 width=800 height=300 top=380 left=70 ]
[position layer=message0 page=fore frame="frame.png" margint="65" marginl="50" marginr="70" marginb="60"]
[cm]
メッセージウィンドウが下に表示されましたね？[r][l]
ここにメッセージが表示されています。[r][l]
ここにメッセージが表示されています。[r][l]

*start
 
 ;背景画像の切り替え実行
 [bg storage=room.jpg time=3000]
 
 背景が切り替わりましたね？ 

 *start

;背景画像の切り替え実行
[bg storage=room.jpg time=3000]

背景が切り替わりましたね？

;１人目のキャラクター登場
[chara_new name="yuko" storage="yuko1.png" jname="ゆうこ"]
[chara_show name="yuko"]
ゆうこが登場しました！[l][r]

;２人目のキャラクター登場
[chara_new name="haruko" storage="haruko1.png" jname="はるこ"]
[chara_show name="haruko"]
はるこが登場しました！[l][r]

*start

;１人目のキャラクター登場
[chara_new name="yuko" storage="yuko1.png" jname="ゆうこ"]
[chara_show name="yuko"]

ゆうこが登場しました！[l][r]

;２人目のキャラクター登場
[chara_new name="haruko" storage="haruko1.png" jname="はるこ"]
[chara_show name="haruko"]

はるこが登場しました！[l][r]


;ゆうこの表情を登録
[chara_face name="yuko" face="angry" storage="yuko2.png"]

表情を変更します[p]
;ゆうこの表情の変更
[chara_mod name="yuko" face="angry"]

表情を元に戻します[p]
;ゆうこの表情を元に戻す
[chara_mod name="yuko" face="default"]

[chara_hide name="haruko" ]

選択肢を表示します[l][r][r]

[link target=*select1]【１】選択肢　その１[endlink][r]
[link target=*select2]【２】選択肢　その２[endlink][r]
[s]

*select1

[cm]

「選択肢１」がクリックされました[l]
@jump target=*common

*select2

[cm]

「選択肢２」がクリックされました[l]

@jump target=*common

*common
[cm]
共通ルートです
