class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.integer :api_id
      t.timestamps null: false
    end
  end
end
