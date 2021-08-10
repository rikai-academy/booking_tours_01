class Booking < ApplicationRecord
  enum status: { pending: 0, failed: 1, paid: 2}
  validates :total, numericality: {greater_than: 0, less_than: 10000000}
  
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
