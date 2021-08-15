module BookingsHelper
  def total_price bookings
    (bookings.pluck(:total).sum).to_f
  end

  def currency booking
    Stripe::Price.retrieve(booking.stripe_price_id)&.currency
  end

  def price booking
    (Stripe::Price.retrieve(booking.stripe_price_id)&.unit_amount).to_f
  end
end
