class StaticPagesController < ApplicationController
  before_action :load_review_category, only: [:reviews_about]
  
  def home
    @newtours = Tour.last(3)
    @populartours = Tour.first(6)
  end
  
  def thanks
  end
  
  def reviews_about
  end

  def statistic
    @res = StatisticsData.call({})
    @revenues = Booking.paid
    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = 'attachment; filename="statistics.xlsx"'
      }
    end
  end

  private

    def load_review_category
      @category  = Category.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        flash[:danger] = t("review.review.fail")
        redirect_to reviews_path   
    end
end
