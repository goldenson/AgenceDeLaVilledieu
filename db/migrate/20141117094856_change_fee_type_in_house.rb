class ChangeFeeTypeInHouse < ActiveRecord::Migration
  def change
  	change_column :houses, :fee, :decimal
  end
end
