include RecipesHelper
class RatingsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @rating = Rating.find_by(user_id: current_user.id, recipe_id: @recipe.id)
    if @rating
      @rating.update_attributes(stars: params[:stars])
    else
      @rating = Rating.new(user_id: current_user.id, recipe_id: @recipe.id, stars: params[:stars])
    end
    
    if @rating.save
      if request.xhr?
        render partial: "ratings/user_rating", locals: {user_rating: user_rating(@recipe)}
      else
        render partial: '/ratings/five_star'
      end
    end
  end

  def destroy
    rating = Rating.find_by(user_id: current_user.id,
                            recipe_id: params[:recipe_id])
    @recipe = Recipe.find(params[:recipe_id])
    if rating.destroy
      if request.xhr?
        render partial: "ratings/user_rating", locals: {user_rating: user_rating(@recipe)}
      else
        render partial: '/ratings/no_stars'
      end
    end
  end

end
