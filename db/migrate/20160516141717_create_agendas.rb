class CreateAgendas < ActiveRecord::Migration
  def change
    create_table :agendas do |t|
      t.string :start_date
      t.string :end_date
      t.references :pool, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
