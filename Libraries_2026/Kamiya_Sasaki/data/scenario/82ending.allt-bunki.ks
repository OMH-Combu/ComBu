*common
[cm]

;分岐
[link target=*select1]【１】「みんなと一緒にいたい」[endlink][r]
[link target=*select2]【２】「帰らないと……」[endlink][r]
[s][cm]


*select1
[cm]

[layopt layer="1" visible=false]

;コウテイ消
[chara_hide name="koutei"]

私はひとまず残ることにした。[l][cm]

;背景集合
[bg storage="syuugou.jpg" time="3000"]

大好きなペンギンといられるなら、それ以上に嬉しいことはない。[r][l]
家のことも仕事のことも一旦置いておいて、[r]
これからのことは後で考えよう。[l][cm]


;end
;黒背景
[bg storage="bg.bl.jpg" time="3000"][l]
end[r]
「ペンギンといっしょ」[l][cm]
[wait time="3000"]

;メッセージレイヤを非表示にしておく
@layopt layer=message0 visible=false

;白背景
[bg storage="bg.white.jpg" time="3000"]

;看板出現
[chara_show name="kanban" top=30]

;メッセージレイヤを表示にしておく
@layopt layer=message0 visible=true 
[position height=400 top=150 left=180]
ドアは一定時間経つと消失します。[l][cm]

;１秒待つ
[wait time="1000"]

;看板消
[chara_hide name="kanban"]
;メッセージレイヤー削除
@layopt layer=message0 visible=false

;ドア出現
[chara_show name="door"]
[wait time="2000"]
;ドア消
[chara_hide name="door"]

;背景黒
[bg storage="bg.bl.jpg" time="3000"]

;メッセージレイヤを非表示にしておく
@layopt layer=message0 visible=false

@jump storage=credit2.ks target=*common


*select2
[cm]
ここがどこだかわからないが、ずっとここにいるわけにはいかない。[l][r]
仕事だってあるし、洗濯物も溜まっている。[l][cm]

#koutei
「そうか。[l][r]
[emb exp="f.player_name"]がそう決めたなら何も言うまい」[l][cm]

#
「ごめんなさい」[l][cm]

;コウテイ消
[chara_hide name="koutei"]

私はみんなの気持ちを振り切るように、[r]
ドアノブをまわした。[l][cm]

;end
;黒背景
[bg storage="bg.bl.jpg" time="3000"][l]
[wait time="8000"]
[layopt layer="1" visible=false]
;効果音
[playse storage="otologic alarmclock.mp3"]

end[r]
「いつもの朝」[l][cm]
[wait time="3000"]

;メッセージレイヤを非表示にしておく
@layopt layer=message0 visible=false

@jump storage=credit2.ks target=*common
