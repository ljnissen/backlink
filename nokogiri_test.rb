require 'rubygems'
require 'nokogiri'
require 'open-uri'

html_source = "http://johannissen.se"
doc = Nokogiri::HTML(open(html_source))
puts doc.xpath(".//@href")