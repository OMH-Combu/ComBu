*select1
[cm]

;キングangry
[chara_mod name="king" face="angry"]
#king
「あ、あなた、ふざけてますの！？」[l][cm]

#
キング姫が叫んだ。[l][cm]

;コウテイangry
[chara_mod name="koutei" face="angry" y=50]
#koutei
「[emb exp="f.player_name"]は面白いな」[l][cm]

#
コウテイが全く面白くなさそうに言った。[l][cm]

@jump target=*common1


*select2
[cm]
#king
「あなた、聞いてますの？」[l][cm]

#
私は動かない。[l][cm]

;キングkomaru
[chara_mod name="king" face="komaru" wait=false]
;コウテイdefault
[chara_mod name="koutei" face="default"]

#king
「え、ちょっと？[l]生きてます？」[l][cm]

#
キング姫が困ったように言っているのが聞こえる。[l][cm]

;コウテイsad
[chara_mod name="koutei" face="sad"]
#koutei
「[emb exp="f.player_name"]。[r]
あまり姫を困らせないでやってくれ」[l][cm]

#
コウテイも困ったように言う。[l][cm]

@jump target=*common1


*common1
[cm]

少し申し訳なくなり、私はいつの間にか用意されていたイスに座った。[l][cm]

@jump storage=61koutei.main.ks target=*common2


*select3
[cm]

;コウテイangry
[chara_mod name="koutei" face="angry" y=50]
#koutei
「生意気か。[l]まあ、そう言ってやるな」[l][cm]
#
#king
「皆、素直すぎるのよ」[l][cm]

@jump storage=62koutei.bunki-main.ks target=*common3


*select4
[cm]

#koutei
「そうか」[l][cm]

@jump storage=62koutei.bunki-main.ks target=*common3


*select5
[cm]

;コウテイsad
[chara_mod name="koutei" face="sad" wait=false]
;キングsad
[chara_mod name="king" face="sad"]

#koutei
「そうか。[l][r]
正直に答えてくれて感謝する」[l][cm]

#
コウテイは少し悲しそうに言った。[l][cm]
#

@jump storage=61koutei.main.ks target=*common3