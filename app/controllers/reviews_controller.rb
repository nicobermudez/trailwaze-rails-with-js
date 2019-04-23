class ReviewsController < ApplicationController
  layout "user"
  before_action :set_itinerary

  def index
    binding.pry
    @reviews ||= @itinerary.reviews.select {|review| review.like}
  end

  def create
    # if already_liked?
    #   @itinerary.reviews.find_by(user_id: current_user.id).destroy
    #   redirect_to itineraries_browse_path
    # else
    #   @itinerary.reviews.create(user_id: current_user.id, like: true)
    #   redirect_to itineraries_browse_path
    # end
    binding.pry
    @itinerary.reviews.create(user_id: current_user.id, like: true)
    render json: @itinerary.review, status: 201
  end

  def destroy
  end

  private

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
