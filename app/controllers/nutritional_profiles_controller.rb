class NutritionalProfilesController < ApplicationController
# before_action :profile_page, only: [:show, :edit, :update]
  before_action :authenticate_user!

  def index
    render 'show'
  end

  def show
    @nutritional_profile = current_user.nutritional_profile
    @restrictions = Restriction.all
    @cuisine_styles = CuisineStyle.all
    @excluded_ingredients = ExcludedIngredient.all
    render 'show'
  end

  def new
    p "*********************"
    p @restrictions
     @restrictions = Restriction.all
     @cuisine_styles = CuisineStyle.all
     @excluded_ingredients = ExcludedIngredient.all
  end

  def create
    @nutritional_profile = NutritionalProfile.create(user_id: current_user.id)
    redirect_to user_nutritional_profile_path(current_user.id, @nutritional_profile.id)
   end
end
