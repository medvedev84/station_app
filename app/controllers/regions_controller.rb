class RegionsController < ApplicationController

  def index 
	@regions = Region.all
  end
  
  def show
	@region = Region.find(params[:id])	
	@cities = @region.cities		
  end
  
=begin  
  def get_stations    	
	@region = Region.find(params[:region_id])	
	@result = run_parse_process(@region)	
	@result = @result + "=Parsing has been started."	
  end

  def get_stations_all  	
	@regions = Region.all
	@regions.each_with_index do |region, i| 
		run_parse_process(region)
	end
	@result = "Parsing has been started."	
  end
  
    private
  
	def run_parse_process(region)	
		site_url = "http://www.benzin-price.ru/zapravka.php?search=1&region_id=" + region.code.to_s
		doc = Nokogiri::HTML(open(site_url))
		list = doc.css('ul')[4]
		list.css('li').each_with_index do |li, i|					
			@station = Station.new	
			@station.region_id = region.id
			address = li.inner_html.split(' - ')[0]	
			city_str = address.split(' ')[1]
			if (city_str != nil && city_str.index(',') != nil)
				city_str = city_str[0..city_str.index(',')-1] 						
			end	
			city = City.where(:region_id => region.id, :name => city_str).first
			if (city != nil) 
				@station.city_id = city.id
			end			
			@station.address = li.inner_html.split(' - ')[0]					
			@station.name = li.css('a').inner_html
			@station.save			
		end		
		return site_url
	end
=end	
end