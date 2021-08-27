class CalculateRating
  include Sidekiq::Worker

  def perform
    tours=Tour.all
    tours.each do |tour|
      count = tour.ratings.count
      avg = count > 0 ? (tour.ratings.sum(:stars) / count.to_f) : 0
      tour.update(start: avg)
    end
  end
end