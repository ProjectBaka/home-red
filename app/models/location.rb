class Location < ApplicationRecord
  has_many :items, :foreign_key => "location_id"
end
