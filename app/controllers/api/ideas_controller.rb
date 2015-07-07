class IdeasController < ApplicationController
  respond_to :json
  def index
    @ideas = Idea.all
    @idea = Idea.new
    respond_with @ideas
  end

  def create
    @idea = Idea.new(idea_params)
    respond_with @idea
  end

  def upgrade_quality
  end

  def downgrade_quality
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :body, :quality)
  end
end
