class BillingController < ApplicationController  
  before_action :logged_in_user

  def create  
    portal_session = Stripe::BillingPortal::Session.create({
      customer: current_user.stripe_customer_id,
      return_url: root_url
    })
    redirect_to portal_session.url
  end
end
