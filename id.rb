# -*- coding: utf-8 -*-
# Author : @JO3QMA ぶっちゃん！
# もっと効率的にプログラム動かす方法あれば教えて下さい。マジで
require 'net/http'
require 'uri'

Domain = "twitter.com"
SarchTopURL = "https://twitter.com/users/username_available?username="
canuse = ""

while loop
	sarchID = ((0..9).to_a + ("a".."z").to_a + "_ ".split(//)).sample(4).join.gsub(/ /,"")
	valid = Net::HTTP.get URI.parse('https://twitter.com/' + sarchID)
	if valid =~ /Sorry, that page doesn/
		valid = Net::HTTP.get URI.parse('https://twitter.com/users/username_available?username=' + sarchID)

		if valid =~ /:true/
			canuse = "true"
			post = sarchID + ":" + canuse + "\n"
			print post
		elsif valid =~ /:false/

		elsif valid == ""
			print "※エラー　アクセス制限されてんでｗｗｗｗｗｗｗｗｗ\n"		
		end
	elsif valid =~ /redirect/
		canuse = "凍結"
		post = sarchID + ":" + canuse + "\n"
	elsif valid =~ /<style /
		canuse = "使われてる"
		post = sarchID + ":" + canuse + "\n"
	else
		canuse = "false"
		post = sarchID + ":" + canuse + "\n"
	end

	valid = ""
end
