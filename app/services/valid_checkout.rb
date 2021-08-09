class ValidCheckout < ApplicationService
  attr_reader :booking
  
  def initialize(booking)
    @booking = booking
  end

  def call
    unless @booking.tour.status
      @booking.destroy
      flash[:alert] = t("bookings.checkout.full")
      redirect_to tours_url
    end
  end
end
