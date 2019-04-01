class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
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
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_path(@user), notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
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
