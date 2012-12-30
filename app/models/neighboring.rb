class Neighboring < ActiveRecord::Base
  # fields: region_id neighbor_id 
  belongs_to :region, :class_name => "Region"
  belongs_to :neighbor, :class_name => "Region"
end