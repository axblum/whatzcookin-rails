include RecipesHelper
class RatingsController < ApplicationController
  def create
    @rating = Rating.find_or_create_by(user_id: current_user.id,
                                       recipe_id: params[:recipe_id].to_i)
    @recipe = Recipe.find(params[:recipe_id].to_i)
    @rating.update_attributes(stars: clean_stars(params[:stars].to_i, @rating.stars))
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
                            recipe_id: params[:recipe_id].to_i)
    @recipe = Recipe.find(params[:recipe_id].to_i)
    if rating.destroy
      if request.xhr?
        render partial: "ratings/user_rating", locals: {user_rating: user_rating(@recipe)}
      else
        render partial: '/ratings/no_stars'
      end
    end
  end

  private

  def clean_stars(stars, old_stars)
    if old_stars
      return (stars - old_stars)
    else
      return stars
    end
  end

end
