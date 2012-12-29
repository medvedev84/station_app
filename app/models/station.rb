class Station < ActiveRecord::Base
  attr_accessible :address, :city_id, :region_id, :name
  belongs_to   :city
  belongs_to   :region
end
