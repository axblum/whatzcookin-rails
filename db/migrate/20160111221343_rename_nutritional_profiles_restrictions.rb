class RenameNutritionalProfilesRestrictions < ActiveRecord::Migration
  def change
  	rename_table :nutritional_profiles_preferences, :nutritional_profile_preferences
  end
end
