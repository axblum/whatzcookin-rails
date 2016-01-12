class CreateNutritionalProfilesRestrictions < ActiveRecord::Migration
  def change
    create_table :nutritional_profiles_restrictions do |t|
    	t.belongs_to :nutritional_profile
    	t.belongs_to :restriction
    end
  end
end
