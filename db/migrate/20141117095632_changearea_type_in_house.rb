class ChangeareaTypeInHouse < ActiveRecord::Migration
  def change
  	change_column :houses, :area, :decimal
  end
end
