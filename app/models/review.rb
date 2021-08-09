class Review < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates :review_name, presence: true, length: { maximum: 50}
  validates :review_content, presence: true
  scope :user_like, ->(user){where(user_id: user)}
  # filter review
  def self.filter(user_id)
    if user_id
      user_like user_id
    else
      all
    end
  end
end