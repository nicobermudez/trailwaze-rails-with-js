class ItinerariesController < ApplicationController
  layout "user"
  before_action :authenticate_user, only: [:show, :edit, :update, :destroy]
  before_action :set_itinerary, only: [:edit, :update, :destroy, :show]

  def index
    @user = current_user
  end

  def show
  end

  def new
    @user = current_user
    @itinerary = Itinerary.new
    @itinerary.user_id = params[:user_id]
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

  def set_itinerary
    @user = current_user
    @itinerary = Itinerary.find_by(:id => params[:id])
  end

  def authenticate_user
    set_itinerary
    if @itinerary.user != @user
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
