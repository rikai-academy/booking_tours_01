class StatisticsController < ApplicationController
  def index
    @revenues = Booking.where(status: "paid")
    @users = User.all
    @bookings= Booking
    @reviews= Review
    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = 'attachment; filename="statistic-report.xlsx"'
      }

    end
  end
end