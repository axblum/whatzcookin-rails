class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name, :taste
      t.belongs_to :recipe
      t.timestamps null: false
    end
  end
end
