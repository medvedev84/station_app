class CitiesController < ApplicationController

  def show
	@city = City.find(params[:id])	
	@stations = @city.stations		
  end
	
end