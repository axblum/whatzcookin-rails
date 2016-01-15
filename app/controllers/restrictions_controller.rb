class RestrictionsController < ApplicationController

  def create
  	excluded_ingredient = ExcludedIngredient.find_or_create_by(name: params[:name])
  	current_user.nutritional_profile.restrictions << excluded_ingredient
		# redirect_to user_nutritional_profile_path(current_user, current_user.nutritional_profile)
    @dietary_restrictions = DietaryRestriction.all
    @nutritional_profile = current_user.nutritional_profile
    @user_excluded_ingredients = @nutritional_profile.restrictions.excluded_ingredients
    @user_dietary_restrictions = @nutritional_profile.restrictions.dietary_restrictions
		
		render partial: 'nutritional_profiles/form'
  end

  def destroy
    current_user.nutritional_profile.restrictions.delete_all
  end

end

