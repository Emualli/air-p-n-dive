class CreateAddAddressToPools < ActiveRecord::Migration
  def change
    create_table :add_address_to_pools do |t|
      t.string :Address

      t.timestamps null: false
    end
  end
end
