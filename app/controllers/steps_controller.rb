class StepsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @post = Post.find(params[:post_id])
    @step = @post.steps.create(params[:step]).valid?
    respond_to do |format|
      if @step
        flash[:notice]="Success a new step has been created."
        format.html 
        format.js { render 'create'}
      else  
        format.js {render :js=> "alert('Error saving Step, maybe you left some field on blank')"}
      end
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @post = Post.find(params[:post_id])
    @step = @post.steps.find(params[:id])
    @step.destroy
    respond_to do |format|
        flash[:notice]="Success a new step has been created."
        format.html 
        format.js { render 'create'}
    end
  end

end
