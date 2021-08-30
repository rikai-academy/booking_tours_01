class StatisticReport
  include Sidekiq::Worker

  def perform
    UserMailer.statistic_report().deliver_now
  end
end