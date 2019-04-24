class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :itinerary_id, :like

  belongs_to :user, serializer: ReviewUserSerializer
end
