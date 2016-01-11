class Restriction < ActiveRecord::Base
  has_and_belongs_to_many :nutritional_profiles
	scope :dietary_restrictions, -> { where(type: "DietaryRestriction")}
	scope :excluded_ingredients, -> { where(type: "ExcludedIngredient")}
end
