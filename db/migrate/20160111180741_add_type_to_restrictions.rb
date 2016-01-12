class AddTypeToRestrictions < ActiveRecord::Migration
  def change
  	add_column :restrictions, :type, :string
  end
end
