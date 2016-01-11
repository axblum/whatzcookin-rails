class Restriction < ActiveRecord::Base
  has_and_belongs_to_many :nutritional_profiles
end
