class RatingsController < ApplicationController
  def create
    p " ^ &" * 100
    p params
    @rating = Rating.find_or_create_by(user_id: current_user.id,
                                       recipe_id: params[:recipe_id])
    @recipe = Recipe.find(params[:recipe_id])
    @rating.update_attributes(stars: params[:stars])
    if @rating.save
      if request.xhr?
        render partial: '/ratings/five_star'
      end
    end
  end
end
