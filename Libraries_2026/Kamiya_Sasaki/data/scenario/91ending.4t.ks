*common
[cm]

;メッセージレイヤ
[position height=400 top=150 left=180]
おつかれさま！[l][r]
たくさんのペンギンと仲良くなれたみたいだね。[l][r]
でも惜しい！[l][r]
もう少しで皆と仲良くなれたね。[l][r]
これからもたくさんペンギンのことを知って[l][r]
もっともーっとペンギンのことを好きになってくれたら嬉しいな☆彡[l][r]
帰るためのドアは向こうだよ。[l][cm]

;メッセージレイヤ小
[position height=190 top=500 left=180]
そこまで出ると看板は動かなくなった。[l][cm]
;看板消
[chara_hide name="kanban"]

背後にはいつからでていたのか[r]

;ドア出現
[chara_show name="door" wait=false]

今まで通ってきたのと同じ白いドアがあった。[l][cm]

私は新たな想いを胸に一歩踏み出した。[l][cm]

;暗転
[mask time=2000]
;ドア消
[chara_hide name="door"]
[mask_off]

半年後[l][cm]
;黒背景
[bg storage="bg.bl.jpg" time="3000"][l]

私は水族館で働いていた。[l][cm]
;水族館背景
[bg storage="aquarium.jpg"]
;BGM
[fadeinbgm storage="Humannize.mp3"] 

あの出来事を経て、私は一つ決めたことがあった。[l][r]
それは転職だ。[l][cm]

もともと前の会社のブラックさにはうんざりしていた。[l][cm]

自分のことしか考えない上司に[l][r]
仕事を押し付けてくる同僚。[l][r]
給料の出ない残業。[l][cm]

もう限界だった。[l][cm]

そこで私は心機一転、転職することにした。[l][r]
そのとき選んだのが水族館だ。[l][cm]

私は子どもの頃からペンギンが好きだった。[l][r]
子どもの頃の夢もペンギンの飼育員さんだった。[l][r]
親に否定され一度はあきらめた夢だった。[l][cm]

しかしあの不思議な世界が私に思い出させてくれた。[l][cm]

今はまだ雑用が多いが、[r]
ときどきペンギンと関わらせてもらっている。[l][cm]

まだどのペンギンも好感度１だけど[l][r]
今度こそは全ペンギンと仲良くなりたいと思う。[l][cm]

;BGM消
[fadeoutbgm storage="Humannize.mp3"] 

;end
;黒背景
[bg storage="bg.bl.jpg" time="3000"][l]
end[r]
「新たな夢」[l][cm]
[wait time="3000"]

;メッセージレイヤを非表示にしておく
@layopt layer=message0 visible=false

@jump storage=credit2.ks target=*common
