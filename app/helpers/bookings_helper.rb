module BookingsHelper
  def total_price bookings
    (bookings.pluck(:total).sum).to_f
  end

  def currency booking
    Stripe::Price.retrieve(booking.stripe_price_id)&.currency
  end

  def price booking
    price = (Stripe::Price.retrieve(booking.stripe_price_id)&.unit_amount) * 100
    number_to_currency((params[:locale] == "en") ? Money.new(price) : Money.new(price).exchange_to("VND"))
  end
end
