class UsersController < ApplicationController
  layout "user"
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
    render :layout => false
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to user_path(@user), notice: "Welcome Home!" }
      else
        format.html { render :new }
      end
    end
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
    @user = User.find(params[:id])
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
