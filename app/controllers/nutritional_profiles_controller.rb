include TasteProfilesHelper
class NutritionalProfilesController < ApplicationController
# before_action :profile_page, only: [:show, :edit, :update]
before_action :authenticate_user!

  def index
  end

  def show
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
    @nutritional_profile = current_user.nutritional_profile
    @dietary_restrictions = DietaryRestriction.all
    @user_dietary_restrictions = @nutritional_profile.restrictions.dietary_restrictions
    @user_excluded_ingredients = @nutritional_profile.restrictions.excluded_ingredients
    
    dietary_restriction = DietaryRestriction.find(params[:dietary_restriction])
    current_dietary_restriction = @nutritional_profile.restrictions.find_by(type: "DietaryRestriction")
    if current_dietary_restriction
      @nutritional_profile.restrictions.delete(current_dietary_restriction)
    end
    @nutritional_profile.restrictions << dietary_restriction

    render partial: 'nutritional_profiles/form'
  end

  def edit
  end

  def destroy
    @nutritional_profile = current_user.nutritional_profile
    @dietary_restrictions = DietaryRestriction.all
    @user_dietary_restrictions = @nutritional_profile.restrictions.dietary_restrictions
    @user_excluded_ingredients = @nutritional_profile.restrictions.excluded_ingredients
    ingredient = ExcludedIngredient.find(params[:ingredient_id])
    current_user.nutritional_profile.restrictions.delete(ingredient)
    # redirect_to user_nutritional_profile_path(current_user, current_user.nutritional_profile)
    render partial: 'nutritional_profiles/form'
  end
end
