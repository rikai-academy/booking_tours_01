class Category < ApplicationRecord
  validates :category_name, presence: true, length: { maximum: 50}
end
