*common

@layopt layer=0 visible=true
[ptext layer=0 text="企画・制作・イラスト" size=40 x=400 y=300 color=snow name="text"]
[ptext layer=0 text="【ペンとギン】" size=40 x=400 y=400 color=snow name="text"]
[ptext layer=0 text="＊敬称略" size=40 x=400 y=550 color=snow name="text"]
[ptext layer=0 text="制作ツール" size=40 x=400 y=700 color=snow name="text"]
[ptext layer=0 text="【ティラノスクリプト】" size=40 x=400 y=800 color=snow name="text"]
[ptext layer=0 text="【ティラノスタジオ】" size=40 x=400 y=900 color=snow name="text"]
[ptext layer=0 text="エディタ" size=40 x=400 y=1100 color=snow name="text"]
[ptext layer=0 text="【Visual Studio Code】" size=40 x=400 y=1200 color=snow name="text"]
[ptext layer=0 text="イラストツール" size=40 x=400 y=1400 color=snow name="text"]
[ptext layer=0 text="【Adobe Illustrator2022】" size=40 x=400 y=1500 color=snow name="text"]
[ptext layer=0 text="効果音" size=40 x=400 y=1700 color=snow name="text"]
[ptext layer=0 text="【OtoLogic】" size=40 x=400 y=1800 color=snow name="text"]
[ptext layer=0 text="【魔王魂】" size=40 x=400 y=1900 color=snow name="text"]
[ptext layer=0 text="【無料効果音で遊ぼう！】" size=40 x=400 y=2000 color=snow name="text"]
[ptext layer=0 text="Thank you for playing!" size=60 x=300 y=2200 color=snow name="text"]

[wait time=1]

[keyframe name="animation1"]
;[frame p=0% y="300"]
[frame p=0% y="500"]
[frame p=100% y="-2500"]
[endkeyframe]

[kanim name="text" keyframe="animation1" time="30000" ]
[wa]
@layopt layer=message0 visible=true

@jump storage=first.ks target=*start