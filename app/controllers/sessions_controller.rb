class SessionsController < ApplicationController
  def new
    
  end

  def create
    
  end
  def auth
    auth_hash = request.env['omniauth.auth']
    @authorization = User.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) || User.find_by_email(auth_hash['info']['email'])
    if @authorization
      render :text => "Welcome back #{@authorization.name}! You have already signed up."  
    else  
      if @user=User.create_with_omniauth(auth_hash)
        UserMailer.created(user).deliver
        render :text => "Welcome back #{user.name}! You have already signed up."  
      else
        render :text => 'error'
      end
    end
  end
  def failure
    
  end
  def destroy
    
  end

end
