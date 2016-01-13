class FavoritesController < ApplicationController
  def index
  end

  def create
    @favorite = Favorite.new(recipe_id: params[:recipe_id].to_i,
                             user_id: params[:user_id].to_i)
    p @favorite
    @recipe = Recipe.find(params[:recipe_id].to_i)
    if @favorite.save
      if request.xhr?
        render partial: 'favorites/favorite_button', locals: { recipe: @recipe }
      end
    end
  end

  def destroy
    if request.xhr?
      @favorite= Favorite.find(params[:id])
      @favorite.destroy
      render json: @favorite
    end
  end
end
