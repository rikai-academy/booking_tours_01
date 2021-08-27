# app/workers/hard_worker.rb
class HardWorker
  include Sidekiq::Worker

  USER_ADMIN = 1;

  def perform
    total_money = Booking.where(updated_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day, status: :paid)
    .sum(:total)
    emails = User.where(admin: USER_ADMIN).pluck(:email)

    UserMailer.total_money_by_day(emails, total_money).deliver_now
  end
end