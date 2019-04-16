class Review < ApplicationRecord
  belongs_to :itinerary
  belongs_to :user

  def self.featured
    reviews_by_itinerary = Review.select("itinerary_id").where(like: true).group("itinerary_id").count
    featured_reviews =  Hash[reviews_by_itinerary.sort_by{|k,v| -k}[0..2]]
    featured_itineraries = []
    featured_reviews.each{|key, val| featured_itineraries.push(Itinerary.find(key))}
    return featured_itineraries
  end


end
