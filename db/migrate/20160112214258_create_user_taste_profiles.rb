class CreateUserTasteProfiles < ActiveRecord::Migration
  def change
    create_table :user_taste_profiles do |t|

      t.timestamps null: false
    end
  end
end
