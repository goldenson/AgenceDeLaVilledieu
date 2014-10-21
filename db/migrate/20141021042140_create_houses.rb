class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.references :type, index: true
      t.string :name
      t.string :address
      t.decimal :area
      t.decimal :mainarea
      t.integer :piece
      t.integer :room
      t.integer :bathroom
      t.integer :toilette
      t.decimal :price
      t.decimal :energy
      t.decimal :impact
      t.decimal :tax
      t.string :heating
      t.integer :construction
      t.integer :outdoorarea
      t.integer :floor
      t.text :description

      t.timestamps
    end
  end
end
