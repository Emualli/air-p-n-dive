class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :pool, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :status
      t.string :start_date
      t.string :end_date
      t.integer :price
      t.integer :booking_rating
      t.text :booking_comment
      t.integer :customer_rating
      t.text :customer_comment

      t.timestamps null: false
    end
  end
end
