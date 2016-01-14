include TasteProfilesHelper
class UsersController < ApplicationController
	def show
    calculate_profile
    @user = current_user
    @new_taste_profile = UserTasteProfile.create!(weigh_tastes(current_user))
    @nutritional_profile = NutritionalProfile.find_or_create_by(user_id: current_user.id)
    # calculate_profile
    @cuisine_array = ["African","Chinese","Japanese","Korean","Vietnamese","Thai","Indian","British","Irish","French","Italian","Mexican","Spanish","Middle Eastern","Jewish","American","Cajun","Southern","Greek","German","Nordic","Eastern European","Caribbean","Latin American"]
	end

  def calculate_profile
    @user = current_user
    unless @user.favorites.empty?
      @new_taste_profile = UserTasteProfile.find_or_create_by(user_id:current_user.id)
      @new_taste_profile.update_attributes(weigh_tastes(current_user))
      @new_taste_profile.save
    end
    # render partial: 'taste_profiles/taste_profile_show'
  end
end
