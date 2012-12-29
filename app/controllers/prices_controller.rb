require 'nokogiri'
require 'open-uri'
require 'iconv'

class PricesController < ApplicationController

  def parse  
	#thread = Thread.new{run_parse_process()}		
	run_parse_process
  end

  private
  
	def run_parse_process	
		Price.delete_all	
		site_url = "http://car-museum.ru/informers/"
		doc = Nokogiri::HTML(open(site_url))		
		table = doc.css('.opisanie').first
		table.css('tr').each_with_index do |tr, i|			
			@price = Price.new	
			@price.region_id = 0
			tr.css('td').each_with_index do |td, j|				
				case j
					when 1
					  region = td.css('b').inner_html				  
					  name = Iconv.conv('UTF-8//IGNORE', 'WINDOWS-1251', region.split(' ')[0])
					  name = name + "%"
					  region = Region.where(["name like ?", name]).first
					  break if (region == nil) 
					  @price.region_id = region.id  
					when 2
					  @price.price_dt = td.inner_html.encode("utf-8").gsub(Nokogiri::HTML("&nbsp;").text, " - ")
					when 3
					  @price.price_80 = td.inner_html.encode("utf-8").gsub(Nokogiri::HTML("&nbsp;").text, " - ")
					when 4
					  @price.price_92 = td.inner_html.encode("utf-8").gsub(Nokogiri::HTML("&nbsp;").text, " - ")
					when 5
					  @price.price_95 = td.inner_html.encode("utf-8").gsub(Nokogiri::HTML("&nbsp;").text, " - ")			  
				end	
			end
			if (@price.region_id > 0) 
				@price.save()
			end					
		end	
	end	
	
end