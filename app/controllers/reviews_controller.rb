class ReviewsController < ApplicationController
  before_action :set_itinerary

  def create
    total_itinerary_reviews
    if !already_liked?
      @itinerary.reviews.create(user_id: current_user.id, rating: 5)
      redirect_to itineraries_browse_path
    end
  end

  private

  def total_itinerary_reviews
    set_itinerary
    @total_itinerary_reviews = @itinerary.reviews.count
  end

  def already_liked?
    Review.where(user_id: current_user.id, itinerary_id: params[:itinerary_id]).exists?
  end

  def set_user
    @user = current_user
  end

  def set_itinerary
    set_user
    @itinerary = Itinerary.all.find(params[:itinerary_id])
  end
end
