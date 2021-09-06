class CreateTagHelpers < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_helpers do |t|
      t.integer :tag_id

      t.timestamps
    end
  end
end
