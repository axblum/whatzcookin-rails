include TasteProfilesHelper
class NutritionalProfilesController < ApplicationController
# before_action :profile_page, only: [:show, :edit, :update]
before_action :authenticate_user!

  def index
  end

  def show
    @new_taste_profile = UserTasteProfile.create!(weigh_tastes(current_user))
    @nutritional_profile = current_user.nutritional_profile
    @dietary_restrictions = DietaryRestriction.all
    @user_dietary_restrictions = @nutritional_profile.restrictions.dietary_restrictions
    @user_excluded_ingredients = @nutritional_profile.restrictions.excluded_ingredients
    @user_cuisine_styles = @nutritional_profile.preferences(type: "CuisineStyle")
  end

  def new
   @restrictions = Restriction.all
   @cuisine_styles = CuisineStyle.all
   @excluded_ingredients = ExcludedIngredient.all
  end

  def create
    @nutritional_profile = NutritionalProfile.create(user_id: current_user.id)
    redirect_to user_nutritional_profile_path(current_user.id, @nutritional_profile.id)
  end

  def update
    nutritional_profile = current_user.nutritional_profile
    user_restrictions = []
    nutritional_profile.restrictions.delete_all

    if params["dietary_restrictions"]
      params["dietary_restrictions"].each do |id|
        user_restrictions << DietaryRestriction.find(id)
      end
      user_restrictions.each do |restriction|
        nutritional_profile.restrictions << restriction
      end
    end

    redirect_to user_nutritional_profile_path(current_user, current_user.nutritional_profile)
  end

  def edit
    #   p "*********************************"
    #   @nutritional_profile = NutritionalProfile.find(user_id: )
    #   restrictions = params["restriction"]
    #   restrictions.each do |restriction|
    #   current_user.nutritional_profile.restrictions << Restriction.find(restriction)
    # end
    # current_user.nutritional_profile.save
  end

  def destroy
    ingredient = ExcludedIngredient.find(params[:ingredient_id])
    current_user.nutritional_profile.restrictions.delete(ingredient)
    redirect_to user_nutritional_profile_path(current_user, current_user.nutritional_profile)
  end
end
