class BookingsController < ApplicationController
  before_action :logged_in_user
  before_action :load_booking, only: [:destroy]

  def index
    @bookings = current_user.bookings.where(status: 0).includes(:tour)
  end

  def create 
    @booking = Booking.create(booking_params)
    if @booking.save
      AdminMailer.with(booking: @booking).booking_tour.deliver_later
      redirect_to bookings_path
    else
      flash[:danger] = t("bookings.shared.failed")
      redirect_to tour_path(booking_params[:tour_id])
    end
  end

  def destroy    
    @booking.destroy
    flash[:success] = t("bookings.index.inform")
    redirect_to bookings_path
  end

  private

    def booking_params
      params.permit(:tour_id, :total, :adults, :children, :date_begin, :user_id, :status)
    end
end
