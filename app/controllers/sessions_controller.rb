class SessionsController < ApplicationController
  layout "application"

  # logout
  def destroy
    session.clear
    redirect_to root_url
  end

  # sets new user
  def new
    @user = User.new
    @users = User.all
  end

  # call to db to create new user
  def create
    if auth
      #Log in via omniauth
      @user = User.find_or_create_by_omniauth(auth)
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      # Manual Log in
      @user = User.find_by(username: params[:user][:username])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        @user = User.new
        render 'new', :layout => 'application'
      end
    end
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
