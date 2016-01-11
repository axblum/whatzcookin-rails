class NutritionalProfilesController < ApplicationController
# before_action :profile_page, only: [:show, :edit, :update]
before_action :authenticate_user!

  def index
  end

  def show
    @nutritional_profile = current_user.nutritional_profile
    @restrictions = Restriction.all
    @cuisine_styles = CuisineStyle.all
    @excluded_ingredients = ExcludedIngredient.all
  end

  def new
   @restrictions = Restriction.all
   @cuisine_styles = CuisineStyle.all
   @excluded_ingredients = ExcludedIngredient.all
  end

  def create
    p "**************"
    @nutritional_profile = NutritionalProfile.create(user_id: current_user.id)
    redirect_to user_nutritional_profile_path(current_user.id, @nutritional_profile.id)
  end

  def update
    p "**********************"
    @nutritional_profile = NutritionalProfile.create(user_id: current_user.id)

    restrictions = params["restriction"]
    restrictions.each do |restriction|
      current_user.nutritional_profile.restrictions << Restriction.find(restriction)
    end
    current_user.nutritional_profile.save
    redirect_to user_nutritional_profile_path(current_user.id, @nutritional_profile.id)
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
end
