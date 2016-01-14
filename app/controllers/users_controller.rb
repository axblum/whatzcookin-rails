include TasteProfilesHelper
class UsersController < ApplicationController
	def show
    calculate_profile
    p taste_array(current_user)
    p 'DIFFERENT STROKES FOR DIFFERENT FOLKS'
    p compare_profiles(CuisineTasteProfile.find(1), current_user.user_taste_profile)
    p "ALL OUR DIFFERENCES SHALL BE RESOLVED"
    p all_cuisine_styles(current_user)
    p "MOAR MOAR MOAR MOAR MOAR MOAR MOAR MOAR"
    p most_similar(all_cuisine_styles(current_user))
    @user = current_user
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
