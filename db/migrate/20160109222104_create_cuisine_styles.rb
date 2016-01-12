class CreateCuisineStyles < ActiveRecord::Migration
  def change
    create_table :cuisine_styles do |t|
      t.string :name
      t.references :nutritional_profile
      t.timestamps null: false
    end
  end
end
