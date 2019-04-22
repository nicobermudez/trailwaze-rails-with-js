class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :require_log_in, only: [:show, :edit, :update]
  layout "user"

  def new
    @user = User.new
    render :layout => 'application'
  end

  def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        render :new, :layout => 'application'
      end
  end

  def show
    @reviewed_itineraries = []
    @user.reviews.all.each {|review| @reviewed_itineraries.push(Itinerary.find_by(:id => review.itinerary_id))}
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(
      :username,
      :password,
      :email,
      :first_name,
      :last_name,
      :home_city,
      :home_country
    )
  end
end
