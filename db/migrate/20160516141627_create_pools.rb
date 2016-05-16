class CreatePools < ActiveRecord::Migration
  def change
    create_table :pools do |t|
      t.integer :width
      t.integer :length
      t.integer :depth
      t.string :shape
      t.string :location
      t.string :water_type
      t.string :longitude
      t.string :latitude
      t.string :equipments
      t.text :description
      t.integer :price
      t.string :status

      t.timestamps null: false
    end
  end
end
