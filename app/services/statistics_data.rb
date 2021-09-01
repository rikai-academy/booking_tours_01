class StatisticsData < ApplicationService
  attr_reader :res

  def initialize(res)
    @res = res
  end

  def call
    now = Date.today
    prev = 1.month.ago
    cur_ratings = Rating.statistic_at(now).size
    previous_ratings = Rating.statistic_at(prev).size
    cur_reviews = Review.statistic_at(now).size
    previous_reviews = Review.statistic_at(prev).size
    cur_likes = LikeReview.statistic_at(now).size
    previous_likes = LikeReview.statistic_at(prev).size
    cur_comments = Comment.statistic_at(now).size
    previous_comments = Comment.statistic_at(prev).size
    new_users = User.statistic_at(now).size
    new_tours = Tour.statistic_at(now).size
    old_users = User.all.size - new_users
    old_tours = Tour.all.size - new_tours

    @res = {
      ratings_in_this_month: cur_ratings,
      ratings_in_previous_month: previous_ratings,
      reviews_in_this_month: cur_reviews,
      reviews_in_previous_month: previous_reviews,
      likes_in_this_month: cur_likes,
      likes_in_previous_month: previous_likes,
      comments_in_this_month: cur_comments,
      comments_in_previous_month: previous_comments,
      new_users_in_this_month: new_users,
      new_tours_in_this_month: new_tours,
      all_old_users: old_users,
      all_old_tours: old_tours,
    }
  end
end
