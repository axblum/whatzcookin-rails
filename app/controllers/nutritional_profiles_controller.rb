class NutritionalProfilesController < ApplicationController
# before_action :profile_page, only: [:show, :edit, :update]
  before_action :authenticate_user!

  def index
    # @user = User.new (user_params)
    # @user = User.all
    render 'show'
end

def show
  @user = User.find(params[:id])
  @profile = @user.profile
  render 'show'
end

def new
  @nutritional_profile = NutritionalProfile.new
  @restrictions = Restriction.all
end

  def create
    @user = User.new(user_params)
      if @user.save
      @profile = NutritionalProfile.create
      @profile.user_id = @user.user_id
      @profile.save
      redirect_to root_url, :notice => "You have successfully signed up!"
    end
  end

def edit
end

# private

  # def profile_page
  #   @user = User.find_by(params[:id])
  # end

  # def user_params
  #   params.require(:user).permit(:name)
  # end
end
