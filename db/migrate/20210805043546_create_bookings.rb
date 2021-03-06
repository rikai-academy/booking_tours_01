class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :tour, null: false, foreign_key: true
      t.integer :total
      t.integer :status
      t.string :currency, default: "usd"
      t.integer :adults
      t.integer :children
      t.date :date_begin
      
      t.timestamps
    end
  end
end
