class CitiesController < ApplicationController

  def show
	@city = City.find(params[:id])		
	@price = Price.where(["region_id = ?", @city.region.id]).first	
	@stations = @city.stations.page(params[:page]).per(10)			
  end
	
end