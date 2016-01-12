class ChangeJoinTableName < ActiveRecord::Migration
  def change
  	rename_table :nutritional_profile_preferences, :nutritional_profiles_preferences
  end
end
