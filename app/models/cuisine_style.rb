class CuisineStyle < ActiveRecord::Base
  has_many :users, :through => :nutritional_profile
  belongs_to :nutritional_profile
end
