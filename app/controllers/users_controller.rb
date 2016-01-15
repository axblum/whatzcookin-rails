include TasteProfilesHelper
class UsersController < ApplicationController
  before_action :authenticate_user!
	
  def show
    @user = current_user
    @nutritional_profile = NutritionalProfile.find_or_create_by(user_id: current_user.id)
    @dietary_restrictions = DietaryRestriction.all
    @user_excluded_ingredients = @nutritional_profile.restrictions.excluded_ingredients
    @favorites = current_user.favorites

    if @user.favorites.any?
      calculate_profile
      similar_taste_profile
    end
  end

  def calculate_profile
    @user = current_user
    unless @user.favorites.empty?
      @new_taste_profile = UserTasteProfile.find_or_create_by(user_id:current_user.id)
      @new_taste_profile.update_attributes(weigh_tastes(current_user))
      @new_taste_profile.save
    end
  end

  def similar_taste_profile
    @similar_profile = most_similar(all_cuisine_styles(current_user))
    @cuisine = similar_cuisine_style(@similar_profile)
  end
end
