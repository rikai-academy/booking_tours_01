class CreateTours < ActiveRecord::Migration[6.1]
  def change
    create_table :tours do |t|
      t.string :tour_name
      t.text :description
      t.boolean :status
      t.integer :tour_amount
      t.integer :cur_amount, default: 0, null: false
      t.date :date_begin
      t.date :date_end
      t.float :price

      t.timestamps
    end
  end
end
