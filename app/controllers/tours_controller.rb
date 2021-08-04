class ToursController < ApplicationController
  def tour
    if params[:term]
      @tours = Tour.where('tour_name LIKE ?', "%#{params[:term]}%").paginate(page: params[:page])
    else
      @tours= Tour.paginate(page: params[:page])
    end
  end
  def tour_params
    params.require(:tour).permit(:term)
  end
end