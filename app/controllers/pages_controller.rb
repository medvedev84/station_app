class PagesController < ApplicationController

  def index  
    h = Hash.new
	if params[:q] != nil	
		h = params[:q] 				
	end		
	
	@q = Station.search(h)		
	@stations = @q.result(:distinct => true)
	
	@city = City.find(4400)	
	if (params[:q] != nil && params[:q][:city_name_cont] != nil)
		@city = City.where(["name like ?", params[:q][:city_name_cont]]).first
	end	
	
	@price = Price.where(["region_id = ?", @city.region.id]).first
  end

end
