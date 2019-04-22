class ItinerarySerializer < ActiveModel::Serializer
  attributes :id

  has_many :reviews
  belongs_to :user
end
