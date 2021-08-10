class Tour < ApplicationRecord
  include CheckAvailable
  has_many :bookings
  has_many :users, through: :bookings

  validates :tour_name, presence: true, length: { maximum: 50}
  validates :description, presence: true, length: { maximum: 255}
  validates :status, presence: true
  validates :tour_amount, presence: true, length: { maximum: 3}
  validates :price, presence: true, length: { maximum: 12}
  scope :name_like, ->(name){where "tour_name LIKE ?", "%#{name}%"}
  # search tour
  def self.search(term)
    if term
      Tour.name_like term
    else
      all
    end
  end
end
