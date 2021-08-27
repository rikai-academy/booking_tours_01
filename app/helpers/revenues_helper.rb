module RevenuesHelper
  def years
    Booking.pluck(:updated_at).map{ |y| y.year }.uniq
  end
end