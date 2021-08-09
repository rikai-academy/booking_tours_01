module BookingsHelper
  def total_price bookings
    (bookings.pluck(:total).sum / 100).to_f
  end
end
