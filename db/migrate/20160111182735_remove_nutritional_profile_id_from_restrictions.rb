class RemoveNutritionalProfileIdFromRestrictions < ActiveRecord::Migration
  def change
  	remove_column :restrictions, :nutritional_profile_id
  end
end
