class DestinationsController < ApplicationController
  layout "user"
  # before_action :authenticate_user, only: [:index, :show, :edit, :update, :destroy]

  def index
    @user = current_user
    @destination = Destination.new
    @destination.itinerary_id = params[:itinerary_id]
  end

  def new
  end

  def show

  end

  def edit
  end

  private


  def destination_params
    params.require(:itinerary).permit(
      :city,
      :country,
      :accommodation,
      :experiences
    )
  end
end
