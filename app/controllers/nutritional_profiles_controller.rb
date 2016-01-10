class NutritionalProfilesController < ApplicationController
# before_action :profile_page, only: [:show, :edit, :update]
  before_action :authenticate_user!

  def index
    # @user = User.new (user_params)
    # @user = User.all
    p "*" * 50
    render 'show'
  end

  def show
   # @user = User.find(params[:id])
   p "-" * 50
    @nutritional_profile = current_user.nutritional_profile
    render 'show'
  end

  def new
     @restrictions = Restriction.all
  end

  def create
    p "+" * 50
    @nutritional_profile = NutritionalProfile.create(user_id: current_user.id)
    redirect_to user_nutritional_profile_path(current_user.id, @nutritional_profile.id)
  end


  def edit
  end
   # @excluded_ingredient = ExcludedIngredient.all
end


# private

  # def profile_page
  #   @user = User.find_by(params[:id])
  # end

  # def user_params
  #   params.require(:user).permit(:name)
  # end
