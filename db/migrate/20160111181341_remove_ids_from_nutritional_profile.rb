class RemoveIdsFromNutritionalProfile < ActiveRecord::Migration
  def change
  	remove_column :nutritional_profiles, :excluded_ingredient_id
  	remove_column :nutritional_profiles, :restriction_id
  	remove_column :nutritional_profiles, :cuisine_style_id
  end
end
