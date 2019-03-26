class SessionsController < ApplicationController

  # logout
  def destroy
    session[:user_id].clear
    redirect_to root_url
  end

  # sets new user
  def new
    @user = User.new
    @users = User.all
  end

  # call to db to create new user
  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "Welcome Home!"
    else
      redirect_to root_path
    end
end
