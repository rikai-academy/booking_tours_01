class AddStatusToRatings < ActiveRecord::Migration[6.1]
  def change
    add_column :ratings, :status, :boolean, default: false, null: false
  end
end
