class ValidCheckoutAll < ApplicationService
  attr_reader :bookings
  
  def initialize(bookings)
    @bookings = bookings
  end

  def call
    @bookings.each do |booking|
      unless booking.tour.status
        flash[:alert] = t("bookings.checkout.notice")
        redirect_to bookings_url
      end
    end
  end
end
