# -*- coding: utf-8 -*-
# Author : @JO3QMA ぶっちゃん！
# もっと効率的にプログラム動かす方法あれば教えて下さい。マジで
require 'net/http'
require 'uri'
# ===============================================================情報メモ
# IDの長さは最大15文字
# IDに使用可能な文字は"0123456789abcdefghijklmnopqrstuvwxyz_"
# 幾つか仕様不可能な文字列がある。 notuse.txtに使用不可IDは書いてある。
# https://twitter.com/users/username_available?username= で空いてるかどうか検索可能。　たけのこ氏からの提供情報。thx
# ↑使われている場合validが ture 使われていない場合 falseを返す。
# {"desc":null,"msg":"","reason":"your_name","valid":true}と返ってくるのはログインしてるID　念の為に例外判定入れとこう
Domain = "twitter.com"
SarchTopURL = "https://twitter.com/users/username_available?username="
port = 80
canuse = ""
while loop
	sarchID = ((0..9).to_a + ("a".."z").to_a + "_ ".split(//)).sample(4).join.gsub(/ /,"")
	valid = Net::HTTP.get URI.parse('https://twitter.com/users/username_available?username=' + sarchID)

	if valid =~ /:true/
		canuse = "true"
	elsif valid =~ /:false/
		canuse = "false"
	elsif valid == ""
		print "※エラー　アクセス制限されてんでｗｗｗｗｗｗｗｗｗ"
	else
		break
	end
	print sarchID + ":" + canuse + "\n"
#	puts valid
	sleep 10
end
