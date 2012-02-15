class PostsController < ApplicationController
  
  def index
    @user = User.find(session[:user_id])
    @posts = @user.posts
    
    respond_to do |format|
      if @post
        format.html #render index.html.erb
      else
        format.html 
      end
    end
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.html 
      format.json { render json: @user}
    end
  end

  def create
    params[:post][:user_id]=session[:user_id]
    @post = Post.new(params[:post])
    respond_to do |format|
      if @post.save
        flash[:notice] = "Successfully saved!"
        format.html { redirect_to edit_post_path(@post) }
        format.js   { redirect_to edit_post_path(@post) } 
      else
        format.html { render 'new' }
      end
    end
  end

  def show
  end

  def edit
    #params[:post][:user_id]=session[:user_id] || @current_user.id
    @user= User.find(session[:user_id])
    @post = @user.posts.find(params[:id])
    respond_to do |format|
      if @post
        format.html 
        format.json {render json:@post }
      else
        format.html {redirect_to post_url, :notice => "You dont have permission to edit this post." } 
      end
    end
  end

  def update
    params[:post][:user_id]=session[:user_id]
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update_attributes(params[:post])
        flash[:notice] = "Successfully updated!."
        format.html { redirect_to edit_post_path(@post) }
        format.js { render '/layouts/notifier_update' }
      else
        flash[:notice] = "Your cant update post."
        format.html { render action: 'edit'}
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
   
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

end
