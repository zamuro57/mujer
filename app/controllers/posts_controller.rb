class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
    
    respond_to do |format|
      format.html 
      format.json { render json: @user}
    end
  end

  def create
    @post = Post.new(params[:post])
    respond_to do |format|
      if @post.save
        flash[:notice] = "Successfully saved!"
        format.html {redirect_to edit_post_path(@post) }
        format.js { render 'create'} 
      else
      
      end
    end
  end

  def show
  end

  def edit
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html 
      format.json {render json:@post}
    end
  end

  def update
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update_attributes(params[:post])
        flash[:notice] = "Successfully updated!"
        format.html { redirect_to edit_post_path(@post)}
      else
        flash[:notice] = "Your cant update post"
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
