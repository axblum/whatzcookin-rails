class Restriction < ActiveRecord::Base
	has_many :nutritional_profile_restrictions
  has_many :nutritional_profile, through: :nutritional_profiles_restrictions

	scope :dietary_restrictions, -> { where(type: "DietaryRestriction")}
	scope :excluded_ingredients, -> { where(type: "ExcludedIngredient")}
end
