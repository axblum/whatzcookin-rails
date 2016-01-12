class DropExtraRestrictions < ActiveRecord::Migration
  def change
  	drop_table :cuisine_styles
  	drop_table :excluded_ingredients
  end
end
