class AddTitleToPools < ActiveRecord::Migration
  def change
    add_column :pools, :title, :string
  end
end
