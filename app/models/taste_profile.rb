class TasteProfile < ActiveRecord::Base
  validates_presence_of :bitter, :earthy, :grassy, :licorice, :nutty, :peppery,:sour,:spicy,:sweet,:woody
end
