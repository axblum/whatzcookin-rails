class FavoritesController < ApplicationController
  def index
  end

  def create
    p "WHAT THE FUCK IS HAPPENING????"
    p params
    @favorite = Favorite.new(recipe_id: params[:recipe_id].to_i,
                             user_id: params[:user_id].to_i)
    p @favorite
    @recipe = Recipe.find(params[:recipe_id].to_i)
    if @favorite.save
      if request.xhr?
        render partial: 'favorites/favorite_button', locals: {recipe: @recipe}
      else
        render partial: 'favorites/favorite_button', locals: {recipe: @recipe}
      end
    end
  end

  def destroy

  end
end
