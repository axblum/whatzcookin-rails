class ExcludedIngredient < ActiveRecord::Base
  has_many :users, :through => :nutritional_profile
end
