class ToursController < ApplicationController
  def index
    @tours = Tour.search(params[:term]).paginate(page: params[:page])
  end
  def tour_params
    params.require(:tour).permit(:term)
  end
end
