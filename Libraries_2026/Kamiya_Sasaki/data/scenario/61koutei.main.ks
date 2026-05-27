*common1
[cm]

;コウテイ開始
;カウント開始
[eval exp="count=0"]
;コウテイ登録
[chara_new name="koutei" storage="コウテイ.png" jname="コウテイ"]
;コウテイ表情登録
[chara_face name="koutei" face="angry" storage="コウテイ：angry.png"]
[chara_face name="koutei" face="smile" storage="コウテイ：smile.png"]
[chara_face name="koutei" face="sad" storage="コウテイ：sad.png"]
;キング登録
[chara_new name="king" storage="キング.png" jname="キング"]
;キング表情登録
[chara_face name="king" face="komaru" storage="キング：komaru.png"]
[chara_face name="king" face="smile" storage="キング：smile.png"]
[chara_face name="king" face="angry" storage="キング：angry.png"]
[chara_face name="king" face="last" storage="キング：last.png"]
[chara_face name="king" face="sad" storage="キング：sad.png"]

;コウテイ名前表示可
[ptext name="chara_name_area" layer=message0 width="200" color=white x=200 y=500 size=30 edge=0x000000]
[chara_config ptext="chara_name_area"]

;ハート０
[image layer="1" x="950" y="5" storage="koukando.zero.png"]
[layopt layer="1" visible=true time="1000"]

;コウテイ出現
[chara_show name="koutei" height=700]

#koutei
「よくぞ、ここまで来たな
[emb exp="f.player_name"]」[l][cm]

#
目の前には王冠をかぶったペンギンがいた。[l][cm]

;キング出現
[chara_show name="king" height=750 top=70]

#king
「ちょっと、あなた。[l][r]
コウテイ陛下の前ですわよ。[l]
ひざまずきなさい！」[l][cm]

#
とりあえずひざまずいた。[l][cm]

#koutei
「まあまあ。[l]
キング姫落ち着いて」[l][cm]

#
#king
「しかし……」[l][cm]

#
キング姫？と呼ばれたペンギンは、[r]
まだ不満そうに口をとがらせていた。[l][cm]

;コウテイsmile
[chara_mod name="koutei" face="smile"]
#koutei
「[emb exp="f.player_name"]も疲れているだろう。[l]楽にしてくれ」[l][cm]

#
@jump storage=62koutei.bunki-main.ks target=*common1


*common2
[cm]

;コウテイdefault
[chara_mod name="koutei" face="default" wait=false]
;キングdefault
[chara_mod name="king" face="default"]
#koutei
「さて、そろそろ本題に入ろうか」[l][cm]

#
コウテイが話し始めた。[l][cm]

#koutei
「君は今までさまざまなペンギンに会ってきただろう？」[l][cm]
「君は彼らのことをどう思った？」[l][cm]

#
@jump storage=62koutei.bunki-main.ks target=*common2


*common3
;コウテイ最終
[cm]
[if exp="count>=2"]
 ;全体カウント
 [eval exp="allcount=allcount+1"]
[endif]

;コウテイdefault
[chara_mod name="koutei" face="default" wait=false]
;キングdefault
[chara_mod name="king" face="default"]

;暗転
[mask time=1500] 
[mask_off]

#king
「ドアは向こうよ。[l]もう行きなさい」[l][cm]

#
;コウテイ・キング消
[chara_hide name="koutei" wait=false]
[chara_hide name="king"]

;ドア出現
[chara_show name="door"]

キング姫の視線の先には白いドアがあった。[l][r]
私は２羽におじぎをし、ドアに向かって歩いていった。[l][cm]

@jump storage=first.ks target=*common6