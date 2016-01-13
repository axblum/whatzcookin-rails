include TasteProfilesHelper
class UsersController < ApplicationController
	def show
    @user = current_user
    @new_taste_profile = UserTasteProfile.create!(weigh_tastes(current_user))
    @nutritional_profile = NutritionalProfile.find_or_create_by(user_id: current_user.id)
	end

  def update

  end
end
