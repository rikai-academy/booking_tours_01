class AddStatusToNotifications < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :status, :boolean, default: false, null: false
  end
end