class Tour < ApplicationRecord
  include CheckAvailable
  has_many :bookings
  has_many :users, through: :bookings
  has_many :ratings, dependent: :destroy
  has_many_attached :images

  validates :images, attached: true,
                    content_type: [:png, :jpg, :jpeg],
                    size:         { less_than: 15.megabytes},
                    limit:        { min: 1, max: 3}
  validates :tour_name, presence: true, length: { maximum: 255}
  validates :description, presence: true, length: { maximum: 1000}
  validates :tour_amount, presence: true, length: { maximum: 3}
  validates :price, presence: true, length: { maximum: 12}
  scope :name_like, ->(name){where "tour_name LIKE ?", "%#{name}%"}
  searchkick
  # search tour
  def self.search1(term)
    if term
      Tour.name_like term
    else
      all
    end
  end
end
