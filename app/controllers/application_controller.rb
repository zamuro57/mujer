class ApplicationController < ActionController::Base
  protect_from_forgery
  layout :select_layout
  
  before_filter :authorize
  def authorize
    @current_user=User.find_by_id(session[:user_id])
    unless @current_user
      redirect_to login_url, notice: "Please Log In"
    end
  end
  
  #def default_url_options
  #  if session[:user_id]
  #    {:username => @current_user.username }
  #  end
  #end
  private
  def select_layout
    @current_user.nil? ? "notusers" : "application"
  end
    
  private
  def is_login
    return session[:user_id]
  end
  
end
