class ReviewsController < ApplicationController
  before_action :set_itinerary

  def create
    if !already_liked?
      @itinerary.reviews.create(user_id: current_user.id)
      redirect_to itineraries_browse_path
    end
  end

  private

  def set_itinerary
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
