class CreateExcludedIngredients < ActiveRecord::Migration
  def change
    create_table :excluded_ingredients do |t|
      t.string :name
      t.references :nutritional_profile
      t.timestamps null: false
    end
  end
end
