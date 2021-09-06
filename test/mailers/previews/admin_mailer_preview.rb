# Preview all emails at http://localhost:3000/rails/mailers/admin_mailer
class AdminMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/admin_mailer/booking_tour
  def booking_tour
    AdminMailer.with(booking: Booking.first).booking_tour
  end

  # Preview this email at http://localhost:3000/rails/mailers/admin_mailer/pay_success
  def pay_success
    AdminMailer.with(booking: Booking.first).pay_success
  end

  # Preview this email at http://localhost:3000/rails/mailers/admin_mailer/revenues_per_day
  def revenues_per_day
    AdminMailer.with(booking: Booking.first.total).revenues_per_day
  end

  # Preview this email at http://localhost:3000/rails/mailers/admin_mailer/statistics_at_the_end_of_month
  def statistics_at_the_end_of_month
    AdminMailer.statistics_at_the_end_of_month
  end

end
