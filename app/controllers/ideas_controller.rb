class IdeasController < ApplicationController
  respond_to :json
  def index
    @ideas = Idea.all
    @idea = Idea.new
  end

  def show
    @idea = Idea.find(params[:id])
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      redirect_to ideas_path
    else
      flash.now[:notice] = "nuh uh"
      render :index
    end
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])
    if @idea.update(idea_params)
      redirect_to @idea
    else
      render :edit
      flash.now[:notice] = "nuh uh"
    end
  end

  def destroy
  end
  private
  def idea_params
    params.require(:idea).permit(:title, :body, :quality)
  end
end
