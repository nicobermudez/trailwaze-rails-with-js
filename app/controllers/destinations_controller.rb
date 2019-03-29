class DestinationsController < ApplicationController
  layout "user"
  # before_action :authenticate_user, only: [:index, :show, :edit, :update, :destroy]

  def index
    @user = current_user
    @destination = Destination.new
    @itinerary = Itinerary.find_by(id: params[:format])

  end

  def new
  end

  def create
    @destination = Destination.new(destination_params)
    @destination.itinerary_id = @itinerary.id

  end

  def show

  end

  def edit
  end

  private


  def destination_params
    params.require(:destination).permit(
      :city,
      :country,
      :accommodation,
      :experiences
    )
  end
end
