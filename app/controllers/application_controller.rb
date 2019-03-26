class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user
  before_action :require_log_in, except: [:new, :create, :home]

  # security check - method to check if user is logged in
  def logged_in?
    !!current_user
  end

  private

    # redirect to home if not logged in
    def require_log_in
      redirect_to root_path unless logged_in?
    end

    # sets current user
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user
end
