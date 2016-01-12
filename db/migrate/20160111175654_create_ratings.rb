class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer  :stars
      t.belongs_to :user
      t.belongs_to :recipe
      t.timestamps null: false
    end
  end
end
