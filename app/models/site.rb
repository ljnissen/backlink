require 'net/http'
require 'uri'

class Site < ActiveRecord::Base
	has_many :stats
	#tracker = PageRankr::Ranks::Google.new("google.com")

	

end
