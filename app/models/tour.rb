class Tour < ApplicationRecord
  validates :tour_name, presence: true, length: { maximum: 50}
  validates :description, presence: true, length: { maximum: 255}
  validates :status, presence: true
  validates :tour_amount, presence: true, length: { maximum: 3}
  validates :price, presence: true, length: { maximum: 12}

end
