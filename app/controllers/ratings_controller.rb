include RecipesHelper
class RatingsController < ApplicationController
  def create
    @rating = Rating.find_or_create_by(user_id: current_user.id,
                                       recipe_id: params[:recipe_id])
    @recipe = Recipe.find(params[:recipe_id])
    @rating.update_attributes(stars: clean_stars(params[:stars].to_i, @rating.stars))
    # @rating.update_attributes(stars: clean_stars(params[:stars].to_i))
    if @rating.save
      if request.xhr?
        p "Barf $ " * 100
        p @rating.stars
        p 'User'
        render partial: '/ratings/four_star'
        # p display_rating(@rating.stars, 'User')
      else
        render partial: '/ratings/five_star'
      end
    end
  end

  def destroy
    p '% @ ' * 100
    rating = Rating.find_by(user_id: current_user.id,
                            recipe_id: params[:recipe_id])
    if rating.destroy
      if request.xhr?
        render partial: '/ratings/new'
      else
        render partial: '/ratings/no_stars'
      end
    end
  end

  private

  def clean_stars(stars, old_stars)
    if old_stars
      return stars - old_stars
    else
      return stars
    end
  end

end
