class AddParkingToHouse < ActiveRecord::Migration
  def change
    add_reference :houses, :parking_type, index: true
  end
end
