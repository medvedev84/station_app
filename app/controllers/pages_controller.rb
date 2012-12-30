class PagesController < ApplicationController

  def index
    h = Hash.new
  	@q = Station.search(h)	
  end

  def search  		
	# get city
	if (params[:q] != nil && params[:q][:city_name_cont] != nil)				
		@city = City.where(["name like ?", params[:q][:city_name_cont]]).first				
	end	
		
	# if city is null, set default city
	if (@city == nil) 
		@city = City.find(4400)		# set Moscow
	end
	
	redirect_to city_path(@city)	
  end
  
end
