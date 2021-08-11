class Rating < ApplicationRecord
  belongs_to :tour
  belongs_to :user
  validates :stars, presence: true, length: { maximum: 1}
end