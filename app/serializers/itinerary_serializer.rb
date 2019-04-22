class ItinerarySerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :budget, :departing_city, :departing_country
  has_many :reviews, serializer: ItineraryReviewSerializer
end
