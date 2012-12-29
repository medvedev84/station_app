require 'nokogiri'
require 'open-uri'

class PricesController < ApplicationController

  def parse  
	#thread = Thread.new{run_parse_process()}		
	run_parse_process
	@result = "Parsing has been started."
  end

  def index 
	
  end
	
end