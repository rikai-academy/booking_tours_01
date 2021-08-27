class SendEmailNewTourJob < ApplicationJob
  queue_as :default

  def perform tour
    UserMailer.new_tour_email(tour).deliver_now
  end
end