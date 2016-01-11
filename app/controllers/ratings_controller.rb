include RecipesHelper
class RatingsController < ApplicationController
  def create
    @rating = Rating.find_or_create_by(user_id: current_user.id,
                                       recipe_id: params[:recipe_id])
    @recipe = Recipe.find(params[:recipe_id])
    p " * & "* 100
    p  params[:stars]
    @rating.update_attributes(stars: clean_stars(params[:stars].to_i))
    # @rating.update_attributes(stars: clean_stars(params[:stars].to_i))
    if @rating.save
      if request.xhr?
        p "Barf $ " * 100
        p @rating.stars
        p 'User'
        p display_rating(@rating.stars, 'User')
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

  def clean_stars(stars)
    if stars > 5
      return stars%5
    else
      return stars
    end
  end

end
