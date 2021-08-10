class Category < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :category_name, presence: true, length: { maximum: 50}
end
