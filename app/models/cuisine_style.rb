class CuisineStyle < ActiveRecord::Base
has_many :users, :through => :nutritional_profile
end
