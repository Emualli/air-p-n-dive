class ChangeCoordinatesTypeInPools < ActiveRecord::Migration
  def change
    change_column :pools, :longitude, 'float USING CAST(longitude AS float)'
    change_column :pools, :latitude, 'float USING CAST(latitude AS float)'
  end
end
