class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :space_cw, null: false, foreign_key: true
      t.date :date_reserved
      t.date :date_cancelled
      t.date :start_date
      t.date :end_date
      t.time :start_time
      t.time :end_time
      t.references :city, null: false, foreign_key: true
      t.text :comments

      t.timestamps
    end
  end
end
