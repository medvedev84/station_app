class Region < ActiveRecord::Base
  attr_accessible :country_id, :name
  belongs_to :country
  has_many :cities
  has_many :neighborings
  has_many :neighbors, :through => :neighborings, :class_name => "Region"
end
