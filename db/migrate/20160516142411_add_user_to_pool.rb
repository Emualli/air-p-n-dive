class AddUserToPool < ActiveRecord::Migration
  def change
    add_reference :pools, :user, index: true, foreign_key: true
  end
end
