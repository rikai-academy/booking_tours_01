class SendEmailBookingJob < ApplicationJob
  queue_as :default

  def perform(args)
    UserMailer.booking_email(args[:current_user], args[:booking]).deliver_now
  end
end
