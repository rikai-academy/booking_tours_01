class Booking < ApplicationRecord
  enum status: { pending: 0, failed: 1, paid: 2}

  validates :total, presence: true, numericality: {greater_than: 0, less_than: 10000000}
  validates :date_begin, presence: true
  validates :children, presence: true, numericality: {greater_than: 0, less_than: 100}
  validates :adults, presence: true, numericality: {greater_than: 0, less_than: 100}
  scope :by_year,  -> (year){ where "extract(year FROM updated_at) = ?", "%#{year}%" }
  scope :by_month, -> (month){ where "extract(month FROM updated_at) = ?", "%#{month}%" }
  
  belongs_to :user
  belongs_to :tour

  monetize :total, as: :price_cents

  def to_builder
    Jbuilder.new do |product|
      product.price stripe_price_id
      product.quantity 1
    end
  end

  after_create do
    product = Stripe::Product.create(name: self.tour.tour_name)
    price = Stripe::Price.create(product: product, unit_amount: self.total, currency: self.currency)
    update(stripe_product_id: product.id, stripe_price_id: price.id)
  end
end
