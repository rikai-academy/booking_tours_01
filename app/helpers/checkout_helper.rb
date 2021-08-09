module CheckoutHelper
  
  def checkout_success session_id
    @session_with_expand = Stripe::Checkout::Session.retrieve({ id: session_id, expand: ["line_items"]})
    tours = Array.new 
    @session_with_expand.line_items.data.each do |line_item|
      product = Booking.find_by(stripe_product_id: line_item.price.product)
      tours.append(product.tour.tour_name)
    end
    @result = {
      total: @session_with_expand.amount_total/100.to_f,
      currency: @session_with_expand.currency,
      tours: tours
    }
  rescue ActiveRecord::RecordNotFound
    flash[:danger] = t("bookings.shared.not_found")
    redirect_to root_url
  end
end
