include TasteProfilesHelper
class UsersController < ApplicationController
	def show
    @user = current_user
    @new_taste_profile = UserTasteProfile.create!(weigh_tastes(current_user))
	end
end
