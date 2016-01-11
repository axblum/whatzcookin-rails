class NutritionalProfile < ActiveRecord::Base
	has_many :nutritional_profile_restrictions
  has_many :restrictions, through: :nutritional_profile_restrictions

  has_many :nutritional_profile_preferences
  has_many :preferences, through: :nutritional_profile_preferences

  belongs_to :users
end
