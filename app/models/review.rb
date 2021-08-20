class Review < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :like_reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :review_name, presence: true, length: { maximum: 50}
  validates :review_content, presence: true
  scope :user_like, ->(user){where(user_id: user)}
  # filter review
  def liked?(user)
    !!self.like_reviews.find{|like| like.user_id==user.id}
  end
  def self.filter(user_id)
    if user_id
      user_like user_id
    else
      all
    end
  end
end