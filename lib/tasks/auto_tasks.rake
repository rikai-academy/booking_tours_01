namespace :auto_tasks do

  desc "daily revenues report"
  task dailymail: :environment do
    AdminMailer.with(revenues: Booking.paid.where(updated_at: Date.today.all_day).sum(:total))
              .revenues_per_day.deliver_later
  end

  desc "calculate ratings per six hours"
  task loadratings: :environment do
    CalculateRatingsJob.perform_now
  end

  desc "send statistics to admin at the end of the month"
  task monthlymail: :environment do
    AdminMailer.statistics_at_the_end_of_month.deliver_later
  end

end