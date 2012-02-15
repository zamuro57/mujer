class SessionsController < ApplicationController
  skip_before_filter :authorize
  
  def new
    user=User.find_by_username(params[:username]) || User.find_by_email(params[:username])
    respond_to do |format|
      if user and user.authenticate(params[:password])
        session[:user_id] = user.id
        format.html { redirect_to timeline_url }
      else
        format.html { redirect_to login_url, alert: "Invalid user/password combination" }
      end
    end
  end

  def create
    
  end
  
  def auth
    auth_hash = request.env['omniauth.auth']
    @authorization = User.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) || User.find_by_email(auth_hash['info']['email'])
    respond_to do |format|
      if @authorization
        session[:user_id] = @authorization.id
        format.html { redirect_to :controller => 'users', :action => 'timeline' }  
      else  
        if @user=User.create_with_omniauth(auth_hash)
          UserMailer.created(@user).deliver
          session[:user_id] = @user.id
          flash[:notice]= 'User has been created, we send you a email to confirm your account'
          format.html { redirect_to :controller => 'users', :action => 'timeline' }   
        else
          render :text => 'error'
        end
      end
    end
  end
  def failure
    auth_hash = request.env['omniauth.auth']
    session[:user_id] = nil
    flash[:notice]="Error on #{auth_hash["provider"]} authentication"
    redirect_to root_url
  end
  def destroy
    session[:user_id] = nil
    flash[:notice]= 'You are log out.'
    respond_to do |format|
      format.html { redirect_to :action=> 'index',:controller => 'welcome'}
    end
         
  end

end
