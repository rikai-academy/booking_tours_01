class CalculateRatingsJob < ApplicationJob
  queue_as :default

  def perform
    ratings = Rating.all.waiting
    if ratings.any?
      ratings.each do |rating|
        rating.update_attribute(:status, "passed")
      end
    end
  end
end
