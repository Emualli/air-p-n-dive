class ChangeLongitudeAndLatitudeType < ActiveRecord::Migration
  def change
    change_column :pools, :longitude, 'integer USING CAST(longitude AS float)'
    change_column :pools, :latitude, 'integer USING CAST(latitude AS float)'
  end
end
