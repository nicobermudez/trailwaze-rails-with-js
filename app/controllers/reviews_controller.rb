class ReviewsController < ApplicationController
  layout "user"
  before_action :set_itinerary

  def index
    @reviews ||= @itinerary.reviews.select {|review| review.like}
  end

  def create
    @review = Review.find_or_create_by(user_id: current_user.id, itinerary_id: params[:itinerary_id])
    if !already_liked?(@review)
      @review.update(like: true)
      render json: @itinerary.reviews, status: 201
    else
      @review.update(like: false)
      render json: @itinerary.reviews, status: 201
    end
  end

  def destroy
  end

  private

  def already_liked?(review)
    review.like == true
  end

  def set_user
    @user = current_user
  end

  def set_itinerary
    set_user
    @itinerary = Itinerary.all.find(params[:itinerary_id])
  end

end
