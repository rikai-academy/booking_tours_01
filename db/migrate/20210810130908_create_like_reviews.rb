class CreateLikeReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :like_reviews do |t|
      t.references :review, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :like_reviews, [:review_id, :user_id], unique: true
  end
end
