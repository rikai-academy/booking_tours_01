class AddParentIdToCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :parent_id, :integer, default: 0
  end
end
