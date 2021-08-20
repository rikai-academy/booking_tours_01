class Admin::ToursController < AdminController

  def index
    @tours = Tour.paginate(page: params[:page])
  end
end