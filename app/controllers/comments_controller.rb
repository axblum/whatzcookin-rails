class CommentsController < ApplicationController
  def index
    @recipe = Recipe.find(params[:recipe_id])
    @comments = @recipe.comments
  end

  def edit
  end

  def update
  end

  def new
  end

  def create
  end

  def show
  end

  def destroy
  end
end
