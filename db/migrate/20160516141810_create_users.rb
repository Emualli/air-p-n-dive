class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :birth_date
      t.string :address
      t.text :bio
      t.string :phone
      t.string :email

      t.timestamps null: false
    end
  end
end
