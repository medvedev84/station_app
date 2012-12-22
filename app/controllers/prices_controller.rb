require 'nokogiri'
require 'open-uri'

class PricesController < ApplicationController

  def parse  
	thread = Thread.new{run_parse_process()}		
	@result = "Parsing has been started."
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
					  name = region.split(' ')[0]
					  name = name + "%"
					  region = Region.where(["name like ?", name]).first
					  break if (region == nil) 
					  @price.region_id = region.id  
					when 2
					  @price.price_dt = td.inner_html
					when 3
					  @price.price_80 = td.inner_html
					when 4
					  @price.price_92 = td.inner_html
					when 5
					  @price.price_95 = td.inner_html					  
				end	
			end
			if (@price.region_id > 0) 
				@price.save()
			end					
		end			
	end	
	
end