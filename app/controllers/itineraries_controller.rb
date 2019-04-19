class ItinerariesController < ApplicationController
  layout "user"
  before_action :authenticate_user, except: :show

  def index
  end

  def show
    set_user
    @itinerary = Itinerary.find_by(id: params[:id])
  end

  def new
    @itinerary = Itinerary.new
    @itinerary.user_id = params[:user_id]
  end

  def browse
    if @itinerary = Itinerary.find_by(id: params[:itinerary_id])
      @reviews ||= @itinerary.reviews.select {|review| review.like}
    end
  end

  def create
    @itinerary = Itinerary.new(itinerary_params)
    @itinerary.user_id = current_user.id
    if @itinerary.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @itinerary.update(itinerary_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @itinerary.destroy
    redirect_to user_path(@user)
  end

  private

  def set_user
    @user = current_user
  end

  def set_itinerary
    set_user
    @itinerary = @user.itineraries.find_by(:id => params[:id])
  end

  def authenticate_user
    set_itinerary
    if @itinerary && @itinerary.user != @user
      redirect_to user_path(@user)
    end
  end

  def itinerary_params
    params.require(:itinerary).permit(
      :title,
      :description,
      :budget,
      :departing_city,
      :departing_country
    )
  end
end
