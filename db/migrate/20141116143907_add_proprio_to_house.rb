class AddProprioToHouse < ActiveRecord::Migration
  def change
    add_column :houses, :proprio, :string
  end
end
