class ToursController < ApplicationController
  before_action :load_tour, only: [:show, :update, :destroy, :edit]
  
  def index
    @tours = Tour.search(params[:term]).paginate(page: params[:page])
  end

  def new
    @tour=Tour.new
  end

  def create
    @tour = Tour.new(tour_params) 
    if @tour.save
      flash[:success] = t("tour.index.new")
      redirect_to @tour
    else 
      render :new
    end
  end

  def show
    if logged_in?
      @rating = Rating.find_by(user_id: current_user.id, tour_id: params[:id])
    end
    count = @tour.ratings.count
    @avg = count > 0 ? (@tour.ratings.sum(:stars) / count.to_f) : 0
  end

  def edit
  end

  def update
    if @tour.update(tour_params)
      flash[:success] = t("tour.index.updated")
      redirect_to @tour
    else
      render :edit
    end
  end

  def destroy
    if @tour.destroy
      flash[:success] = t("tour.index.deleted")
    else
      flash[:danger] = t("tour.index.fail")
    end
    redirect_to tours_url
  end

  private
    # Find a tour
    def load_tour
      @tour = Tour.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        flash[:danger] = t("tour.index.fail")
        redirect_to root_url
    end

    def tour_params
      params.require(:tour).permit(:tour_name, :description, :status, :tour_amount, :date_begin, :date_end, :price, images: [])
    end
end
