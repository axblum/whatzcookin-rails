class NutritionalProfileRestriction < ActiveRecord::Base
	belongs_to :nutritional_profile
	belongs_to :restriction
	validates_uniqueness_of :nutritional_profile_id, scope: :restriction_id
end
