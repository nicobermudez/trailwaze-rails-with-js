class Review < ApplicationRecord
  belongs_to :itinerary
  belongs_to :user

  def average_review
    binding.pry
  end
end
