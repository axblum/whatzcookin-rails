class RenameNutritionalProfilesTable < ActiveRecord::Migration
  def change
  	rename_table :nutritional_profiles_restrictions, :nutritional_profile_restrictions
  end
end
