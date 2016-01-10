class NutritionalProfile < ActiveRecord::Base
  has_many :restrictions
  has_many :cuisine_styles
  has_many :excluded_ingredients
  belongs_to :users
end
