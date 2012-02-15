class WelcomeController < ApplicationController
  skip_before_filter :authorize
  
  def index
    if is_login()
      redirect_to timeline_url
    else
      @user=User.new
    end
  end

end
