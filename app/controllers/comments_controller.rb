class CommentsController < ApplicationController
  def index
    @recipe = Recipe.get_recipe(params[:recipe_id])
    @comments = Comment.where(recipe_id: params[:recipe_id])
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
