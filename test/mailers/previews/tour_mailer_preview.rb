# Preview all emails at http://localhost:3000/rails/mailers/tour_mailer
class TourMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/tour_mailer/new_tour
  def new_tour
    TourMailer.with(tour: Tour.first).new_tour
  end

end
