class DropCreateAddAddressToPools < ActiveRecord::Migration
  def change
    drop_table :add_address_to_pools
    add_column :pools, :address, :string
  end
end
