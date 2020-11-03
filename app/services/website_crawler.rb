require 'nokogiri'
require 'open-uri'

class WebsiteCrawler

	def initialize(url='')   
	    @client  = Nokogiri   
	    @url     = url
	  end

	def fetch
		doc = @client::HTML(URI.open(@url))
		parse_html doc		
	end

	def parse_html(data)
		tags = data.xpath("//h1").text+"\r\n"+data.xpath("//h3").text
		# tags = data.xpath("//h3").map{|t| t.text}.join('|')		
	end
end
