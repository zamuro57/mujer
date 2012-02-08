class UserController < ApplicationController
   
  def create
    @user = User.new(params[:user])
    
    respond_to do |format|
      if @user.save
        format.html { redirect_to :action=> 'profile', notice: 'User has been created, you have to confirm your email' }  
        format.html { render json: @user, status: :created, location: @user}
      else
        format.html { render action:'create'}
        
      end
    end
  end
  
  def new
    @user = User.new
    
    respond_to do |format|
      format.html #render user/new.html.erb
      format.json { render json: @user}
    end
  end
  
  def profile
  end
  
  def settings
  end

end
