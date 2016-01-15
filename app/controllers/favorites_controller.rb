class FavoritesController < ApplicationController
  def index
    @favorites = current_user.favorites
    render partial: 'favorites/index', locals: { favorites: @favorites }
  end

  def create
    @favorite = Favorite.new(recipe_id: params[:recipe_id],
                             user_id: params[:user_id])
    @recipe = Recipe.find(params[:recipe_id])
    if @favorite.save
      if request.xhr?
        render partial: 'favorites/favorite_button', locals: { recipe: @recipe }
      end
    end
  end

  def destroy
    @favorite= Favorite.find(params[:id])
    @recipe = Recipe.find(params[:recipe_id])
    if request.xhr?
      @favorite.destroy 
      render partial: 'favorites/favorite_button', locals: { recipe: @recipe }
    end
  end
end
