class AddTimeToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :start_time, :string
    add_column :bookings, :end_time, :string
    remove_column :bookings, :end_date, :string
    rename_column :bookings, :start_date, :date
  end
end
