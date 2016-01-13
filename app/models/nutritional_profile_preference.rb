class NutritionalProfilePreference < ActiveRecord::Base
	belongs_to :nutritional_profile
	belongs_to :preference
	validates_uniqueness_of :nutritional_profile_id, scope: :preference_id
end
