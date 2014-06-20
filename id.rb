# -*- coding: utf-8 -*-
require 'net/http'

def generate_id
	((0..9).to_a + ("a".."z").to_a + "_ ".split(//)).sample(4).join.gsub(/ /,"")
end
def access_url(url, searchID)
	@url = url + searchID
	Net::HTTP.get URI.parse(@url)
rescue 
	retry
end
SearchURL = "https://twitter.com/"
SearchSecondURL = "https://twitter.com/users/username_available?username="

while loop
	searchID = generate_id
	valid = access_url(SearchURL, searchID)
	if valid =~ /Sorry, that page doesn/
		valid = access_url(SearchSecondURL, searchID)
		if valid =~ /:true/
			canuse = "true"
			post =  searchID + ":" + canuse + "\n"
			print post
		elsif valid == ""
			p "アクセス制限されてまんで"
		end
	end
	valid = ""
end
