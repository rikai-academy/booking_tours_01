# Preview all emails at http://localhost:3000/rails/mailers/booking_mailer
class BookingMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/booking_mailer/booking_tour
  def booking_tour
    BookingMailer.with(booking: Booking.first).booking_tour
  end

  # Preview this email at http://localhost:3000/rails/mailers/booking_mailer/pay_success
  def pay_success
    BookingMailer.with(booking: Booking.first).pay_success
  end

end
