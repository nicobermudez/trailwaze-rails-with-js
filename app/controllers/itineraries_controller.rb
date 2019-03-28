class ItinerariesController < ApplicationController
  layout "user"
  before_action :set_itinerary, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @itinerary = Itinerary.new
    @itinerary.user_id = params[:user_id]
    @user = current_user
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

  private

  def set_itinerary
    @itinerary = Itinerary.find(params[:id])
  end

  def authenticate_user
    set_itinerary
    if @itinerary.user != current_user
      redirect_to user_path(current_user)
    end
  end

  def itinerary_params
    params.require(:user).permit(
      :title
    )
  end
end
