class BookingSuccess < ApplicationService
  attr_reader :booking
  
  def initialize(booking)
    @booking = booking
  end

  def call
    AdminMailer.with(booking: @booking).pay_success.deliver_later
    @booking.update_attribute(:status, 2)
    tour = Tour.find(@booking.tour_id)
    tour.increment!(:cur_amount)
    if tour.is_full
      tour.update_attribute(:status, false)
    end
  rescue ActiveRecord::RecordNotFound
    flash[:danger] = t("tour.shared.not_found")
    redirect_to root_url
  end
end
