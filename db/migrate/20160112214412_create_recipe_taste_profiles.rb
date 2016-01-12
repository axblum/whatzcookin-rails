class CreateRecipeTasteProfiles < ActiveRecord::Migration
  def change
    create_table :recipe_taste_profiles do |t|

      t.timestamps null: false
    end
  end
end
