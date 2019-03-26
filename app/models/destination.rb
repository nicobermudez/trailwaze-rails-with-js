class Destination < ApplicationRecord
  belongs_to :itinerary
  has_many :accomodations
  has_many :experiences 
end
