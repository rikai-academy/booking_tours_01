class AddStripeIdToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :stripe_price_id, :string
    add_column :bookings, :stripe_product_id, :string
  end
end