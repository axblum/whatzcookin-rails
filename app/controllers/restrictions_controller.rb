class RestrictionsController < ApplicationController

  def create
  	excluded_ingredient = ExcludedIngredient.find_or_create_by(name: params[:name])
  	current_user.nutritional_profile.restrictions << excluded_ingredient
		redirect_to user_nutritional_profile_path(current_user, current_user.nutritional_profile)
  end

end

