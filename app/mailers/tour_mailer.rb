class TourMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.tour_mailer.new_tour.subject
  #
  def new_tour
    @tour = params[:tour]

    mail(
      to: email_address_with_name(User.first.email, User.first.name), 
      bcc: User.all.pluck(:email), 
      subject: t("mailer.tour.title")
    )
  end
end
