class RatingsController < ApplicationController
  before_action :logged_in_user, only: :create
  before_action :load_tour, only: :create
  skip_before_action :verify_authenticity_token

  def create
    @rating = Rating.find_by(user_id: current_user.id, tour_id: rating_params[:tourId])
    errors = []
    if @rating
      @rating.update_attribute(:stars, rating_params[:stars])
      errors = [t("tour.index.fail")] unless @rating.save
    else
      @rating = Rating.create!(user_id: current_user.id, 
                              tour_id: rating_params[:tourId], 
                              stars: rating_params[:stars])
    end
    
    if errors.length > 0
      render json: {success: false, errors: errors}
    else
      render json: {success: true, stars: @rating.stars}
    end
  end
  private
    # Find a tour
    def load_tour
      @tour = Tour.find(params[:tourId])
      rescue ActiveRecord::RecordNotFound
        flash[:danger] = t("tour.index.fail")
        redirect_to root_url
    end

    def rating_params
      params.permit(:tourId, :stars)
    end
end
