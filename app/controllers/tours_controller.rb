class ToursController < ApplicationController
  def tour
    @tours= Tour.paginate(page: params[:page])
  end
end
