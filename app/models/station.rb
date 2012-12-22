class Station < ActiveRecord::Base
  attr_accessible :address, :city_id, :name
  belongs_to   :city
end
