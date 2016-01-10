class CreateNutritionalProfiles < ActiveRecord::Migration
  def change
    create_table :nutritional_profiles do |t|
      t.belongs_to :restriction
      t.belongs_to :excluded_ingredient
      t.belongs_to :cuisine_style
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
