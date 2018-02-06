class Stat < ActiveRecord::Base

	belongs_to :site
	
	#text = %{"My homepage is at
	#<a href="http://www.example.com/">http://www.example.com/</a>, and be sure
	#to check out my weblog at http://www.example.com/blog/.}

	#URI.extract(text)
	# => ["http://www.example.com/", "http://www.example.com/",
	#        "http://www.example.com/blog/.", "mailto:bob@example.com"]

	# Get HTTP(S) links only.

	#URI.extract(text, ['http', 'https'])

	# => ["http://www.example.com/", "http://www.example.com/"
	#        "http://www.example.com/blog/."]
end
