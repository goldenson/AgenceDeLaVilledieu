class AddWaterToHouse < ActiveRecord::Migration
  def change
    add_column :houses, :water, :string
  end
end
