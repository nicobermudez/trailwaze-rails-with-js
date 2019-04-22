class ItinerarySerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :budget, :departing_city, :departing_country

  # belongs_to :user
  has_many :reviews, serializer: ItineraryReviewSerializer
end
