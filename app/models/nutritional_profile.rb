class NutritionalProfile < ActiveRecord::Base
  has_and_belongs_to_many :restrictions
  has_and_belongs_to_many :preferences
  belongs_to :users
end
