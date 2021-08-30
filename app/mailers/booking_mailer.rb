class BookingMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.booking_tour.subject
  #
  def booking_tour
    @booking = params[:booking]

    mail(
      to: email_address_with_name(User.first.email, User.first.name), 
      cc: User.all.where(admin: true).pluck(:email), 
      subject: t("mailer.booking.book")
    )
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.pay_success.subject
  #
  def pay_success
    @booking = params[:booking]

    mail(
      to: email_address_with_name(User.first.email, User.first.name), 
      cc: User.all.where(admin: true).pluck(:email), 
      subject: t("mailer.booking.pay")
    )
  end
end
