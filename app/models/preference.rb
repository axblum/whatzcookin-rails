class Preference < ActiveRecord::Base
	has_many :nutritional_profile_preferences
  has_many :nutritional_profile, through: :nutritional_profiles_preferences

	scope :cuisine_styles, -> { where(type: "CuisineStyle")}
end
