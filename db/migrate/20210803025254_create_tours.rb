class CreateTours < ActiveRecord::Migration[6.1]
  def change
    create_table :tours do |t|
      t.string :tour_name
      t.text :description
      t.boolean :status, default: true
      t.integer :tour_amount
      t.integer :cur_amount, default: 0, null: false
      t.string :time
      t.integer :price

      t.timestamps
    end
  end
end
