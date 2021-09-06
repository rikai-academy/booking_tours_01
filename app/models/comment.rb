class Comment < ApplicationRecord
  enum status: { appear: true, hide: false }
  has_many :notifications, as: :notifiable
  belongs_to :user
  belongs_to :review
  belongs_to  :parent, class_name: 'Comment', optional: true
  has_many    :replies, class_name: 'Comment', foreign_key: :parent_id, dependent: :destroy
  validates :cmt_content, presence: true
end
