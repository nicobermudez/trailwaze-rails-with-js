class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :itinerary_id, :user_id, :like
end
