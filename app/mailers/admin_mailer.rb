class AdminMailer < ApplicationMailer

  def booking_tour
    @booking = params[:booking]

    mail(
      to: email_address_with_name(User.first.email, User.first.name), 
      cc: User.all.where(admin: true).pluck(:email), 
      subject: t("mailer.admin.book")
    )
  end

  def pay_success
    @booking = params[:booking]

    mail(
      to: email_address_with_name(User.first.email, User.first.name), 
      cc: User.all.where(admin: true).pluck(:email), 
      subject: t("mailer.admin.pay")
    )
  end

  def revenues_per_day
    @revenues = params[:revenues]

    mail(
      to: email_address_with_name(User.first.email, User.first.name), 
      cc: User.all.where(admin: true).pluck(:email), 
      subject: t("mailer.admin.daily")
    )
  end

  def statistics_at_the_end_of_month
    mail(
      to: email_address_with_name(User.first.email, User.first.name), 
      cc: User.all.where(admin: true).pluck(:email), 
      subject: t("mailer.admin.monthly")
    )
  end
end
