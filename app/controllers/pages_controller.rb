class PagesController < ApplicationController

  def index  		
	# get city
	if (params[:q] != nil && params[:q][:city_name_cont] != nil)				
		@city = City.where(["name like ?", params[:q][:city_name_cont]]).first				
	end	
		
	# if city is null, set default city
	if (@city == nil) 
		@city = City.find(4400)		# set Moscow
	end
	
	# get prices for city
	@price = Price.where(["region_id = ?", @city.region.id]).first	
	
	# get paramters for searching
    h = Hash.new
	if params[:q] != nil	
		h = params[:q] 	
	else 
		# set default city for searching
		h["city_id_eq"] = @city.id
	end		
	
	#n make searching
	@q = Station.search(h)		
	@stations = @q.result(:distinct => true).page(params[:page]).per(10)	
  end

end
