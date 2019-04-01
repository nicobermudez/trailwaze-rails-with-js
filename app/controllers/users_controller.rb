class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :require_log_in, only: [:show, :edit, :update]
  layout "user"

  def new
    @user = User.new
    render :layout => false
  end

  def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        render :new, :layout => false
      end
  end

  def show
    @itineraries = []
    @user.reviews.each {|review| @itineraries.push(Itinerary.find_by(:id => review.itinerary_id))}
  end

  def edit
  end

  def update
      binding.pry
      if @user.update(user_params)
        redirect_to user_path(@user)
      else
        render :edit
      end
  end

  private

  def set_user
    @user = current_user
  end

  def auth
    request.env['omniauth.auth']
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
