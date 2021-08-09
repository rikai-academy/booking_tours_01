class CheckoutController < ApplicationController
include CheckoutHelper
  before_action :logged_in_user

  def create
    if checkout_params[:id]
      load_booking
      ValidCheckout.call(@booking)
      line_items = [@booking.to_builder.attributes!]
    else
      @bookings = current_user.bookings.where(status: 0)
      ValidCheckoutAll.call(@bookings)
      line_items = @bookings.collect { |booking| booking.to_builder.attributes! }
    end

    @session = Stripe::Checkout::Session.create({
      customer: current_user.stripe_customer_id,
      payment_method_types: ['card'],
      line_items: line_items,
      allow_promotion_codes: true,
      mode: "payment",
      success_url: success_url + "?session_id={CHECKOUT_SESSION_ID}",
      cancel_url: cancel_url,
    })
    
    respond_to do |format|
      format.js
    end
  end

  def success
    if params[:session_id].present?
      checkout_success(params[:session_id])
    else
      redirect_to cancel_url
    end
  end

  def cancel
  end

  private

    def checkout_params
      params.permit(:id)
    end    
end
