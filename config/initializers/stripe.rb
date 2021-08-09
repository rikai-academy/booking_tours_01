Rails.configuration.stripe = { 
  :publishable_key => ENV["PUBLIC_KEY"],
  :secret_key => ENV["PRIVATE_KEY"]
}

Stripe.api_key = ENV["PRIVATE_KEY"]