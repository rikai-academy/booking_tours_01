class AddStatusToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :status, :boolean, default: true, null: false
  end
end
