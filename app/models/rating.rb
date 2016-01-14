class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipe
  validates :stars, numericality: {less_than_or_equal_to: 5}
end
