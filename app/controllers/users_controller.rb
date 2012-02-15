class UsersController < ApplicationController
  
  skip_before_filter :authorize, only: [:new, :create, :show]
  
  def create
    @user = User.new(params[:user])
    
    respond_to do |format|
      if @user.save
        UserMailer.created(@user).deliver
        flash[:notice]= 'User has been created, we send you a email to confirm your account'
        format.html { redirect_to :action=> 'profile'}  
        format.json { render json: @user, status: :created, location: @user}
      else
        format.html { render action:'new'}
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
  
  def index
    
  end
  
  def show
    
  end
  
  def settings
  
  end
  
  def confirm
    confirm_hash=params([:hash])
    email=params([:email])
    user=User.find_by_email(email)
    if user.nil?
      
    else
      
    end
  end
  
  def profile
    
  end

end
