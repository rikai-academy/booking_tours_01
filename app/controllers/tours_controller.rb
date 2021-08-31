class ToursController < ApplicationController
  before_action :load_tour, only: [:show, :update, :destroy, :edit]
  before_action :admin_user, only: [:destroy, :create, :edit, :update]
  
  def index
    tours_index_helper
  end

  def new
    @tour=Tour.new
  end

  def create
    @tour = Tour.new(tour_params) 
    if @tour.save
      TourMailer.with(tour: @tour).new_tour.deliver_later
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
  end

  def edit
  end

  def update
    if @tour.update(tour_params)
      flash[:success] = t("tour.index.updated")
      redirect_to admin_tours_path
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
    redirect_to admin_tours_path
  rescue ActiveRecord::InvalidForeignKey
    flash[:danger] = t("tour.index.fail")
    redirect_to admin_tours_path
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
      params.require(:tour).permit(:tour_name, :description, :status, :tour_amount, :time, :price, images: [])
    end
end
