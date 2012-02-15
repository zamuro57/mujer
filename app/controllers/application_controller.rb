class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :authorize
  def authorize
    @current_user=User.find_by_id(session[:user_id])
    unless @current_user
      redirect_to login_url, notice: "Please Log In"
    end
  end
  
  private
  def is_login
    return session[:user_id]
  end
  
end
