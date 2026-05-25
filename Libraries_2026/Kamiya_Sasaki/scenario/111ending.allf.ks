*common
[cm]

;yamiochi登録
[chara_new name="restart.door" storage="restart.door.png" jname="リスタートドア"]
[chara_new name="youchien" storage="yamiochi.youtien.png" jname="幼稚園生"]
[chara_new name="shougaku" storage="yamiochi.syougaku.png" jname="小学生"]
[chara_new name="dannshigakusei" storage="yamiochi.gakusei.png" jname="男子高校生"]
[chara_new name="joshigakusei" storage="yamiochi.gakusei.onna.png" jname="女子高校生"]
[chara_new name="haha" storage="yamiochi.haha.png" jname="母"]
[chara_new name="joushi" storage="yamiochi.joushi.png" jname="上司"]

;メッセージレイヤ大
[position height=400 top=150 left=180]
はあ。[l][r]
君はずっと何しているの？[l][r]
空気も読めず、相手の気持ちも考えず、[r]
逆に何ができるのか教えてほしいくらいだよ。[l][r]
次はできるといいね。[l][r]
ばいばい。[l][cm]

;メッセージレイヤ小
[position height=190 top=500 left=180]
そこまで出ると看板は動かなくなった。[l][r]
;看板消
[chara_hide name="kanban"]
背後にはいつから出ていたのか[r]
;ドア出現
[chara_show name="door"]
今まで通ってきたのと同じ白いドアがあった。[l][cm]

私は……[l][cm]

;分岐
[link storage=112ending.allf-1.ks target=*select1]【１】この世界から出ない。[endlink][r]
[link storage=113ending.allf-2.ks target=*select1]【２】この世界から出る。[endlink][r]
[s][cm]


@jump storage=first.ks target=*start








