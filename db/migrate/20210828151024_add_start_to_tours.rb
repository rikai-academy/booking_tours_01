class AddStartToTours < ActiveRecord::Migration[6.1]
  def change
    add_column :tours, :start, :integer, default: 0
  end
end
