class BookingsController < ApplicationController
  before_action :logged_in_user
  before_action :load_booking, only: [:destroy]

  def index
    @bookings = current_user.bookings.where(status: 0)
  end

  def create 
    @booking = Booking.create(tour_id: booking_params[:tour_id],
                              user_id: current_user.id,
                              total: booking_params[:price],
                              status: 0)
    if @booking.save
      redirect_to bookings_path
    else
      flash[:alert] = t("bookings.shared.failed")
      redirect_to tour_path(@tour)
    end
  end

  def destroy    
    @booking.destroy
    flash[:alert] = t("bookings.index.inform")
    redirect_to bookings_path
  end

  private

    def booking_params
      params.permit(:tour_id, :price)
    end
end
