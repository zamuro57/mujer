class UsersController < ApplicationController
  
  skip_before_filter :authorize, only: [:new, :create, :show]
  
  def create
    @user = User.new(params[:user])
    
    respond_to do |format|
      if @user.save
        UserMailer.created(@user).deliver
        flash[:notice]= 'User has been created, we send you a email to confirm your account'
        format.html { redirect_to :action=> 'profile'}  
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action:'new'}
      end
    end
  end
  
  # Create de new user form get /users/new
  def new
    @user = User.new
    
    respond_to do |format|
      format.html #render user/new.html.erb
      format.json { render json: @user}
    end
  end
  
  # Show user profile
  def show
    render :text => "#{params[:id]}"
  end
  
  # edit your profile and configuration
  def settings
  
  end
  
  # Show your timeline (user home page)
  def timeline
    
  end
  
  def confirm
    confirm_hash=params([:hash])
    email=params([:email])
    user=User.find_by_email(email)
    if user.nil?
      
    else
      
    end
  end
  
end
