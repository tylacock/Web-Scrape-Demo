require 'rubygems'
require 'nokogiri'
require	'open-uri'

url = "http://www.grainger.com/search?searchQuery=59200CD"
base_url = "http://www.grainger.com/product/"
doc = Nokogiri::HTML(open(url))

doc.css(".product").each do |item|
	product_mfg_number =  item.at_css(".productMFR").text
	price = item.at_css(".productPrice").text.gsub(/\s+/, "")
	prod_url = item.at_css(".productLink")[:href]
	puts "#{product_mfg_number} - #{price} (http://www.grainger.com/product#{prod_url})"
end

