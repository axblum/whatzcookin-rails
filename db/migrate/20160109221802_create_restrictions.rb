class CreateRestrictions < ActiveRecord::Migration
  def change
    create_table :restrictions do |t|
      t.string :name
      t.references :nutritional_profile
      t.timestamps null: false
    end
  end
end
