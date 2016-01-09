class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string   :text
      t.belongs_to :user, :recipe
      t.timestamps null: false
    end
  end
end
