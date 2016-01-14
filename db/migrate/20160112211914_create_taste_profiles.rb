class CreateTasteProfiles < ActiveRecord::Migration
  def change
    create_table :taste_profiles do |t|
      t.float    :bitter
      t.float    :earthy
      t.float    :grassy
      t.float    :licorice
      t.float    :nutty
      t.float    :peppery
      t.float    :sour
      t.float    :spicy
      t.float    :sweet
      t.float    :woody
      t.references :user, :recipe, :cuisine_style, index: true
      t.timestamps null: false
    end
  end
end
