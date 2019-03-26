class Itinerary < ApplicationRecord
  belongs_to :user
  has_many :destinations
  has_many :experiences, through: :destinations
  has_many :accommodations, through: :destinations
  has_many :transportations
end
