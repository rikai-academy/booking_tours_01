class UserMailer < ApplicationMailer
  def booking_email (user, booking)
    @booking = booking
    @user = user
    emails = User.where(admin: 1).pluck(:email)
    mail(to: emails, subject: 'Successfully booked the tour')
  end

  def pay_success(user, booking)
    @user=user
    @booking=booking
    emails = User.where(admin: 1).pluck(:email)
    mail(to: emails, subject: 'Pay success')
  end

  def total_money_by_day emails, total_money
    @total_money = total_money
    mail(to: emails, subject: 'Total money by day')
  end

  def new_tour_email tour
    @tour = tour
    emails = User.where(admin: 0).pluck(:email)
    mail(to: emails, subject: 'New tour')
  end

  def statistic_report
    emails = User.where(admin: 1).pluck(:email)
    mail(to: emails, subject: 'Statistic Report')
  end
end