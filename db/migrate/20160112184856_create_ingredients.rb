class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name, :taste
      t.timestamps null: false
    end
  end
end
