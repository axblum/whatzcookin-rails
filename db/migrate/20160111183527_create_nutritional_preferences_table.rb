class CreateNutritionalPreferencesTable < ActiveRecord::Migration
  def change
    create_table :nutritional_profile_preferences do |t|
    	t.belongs_to :nutritional_profile
    	t.belongs_to :preference
    end
  end
end
