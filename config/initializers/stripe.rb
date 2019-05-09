if ENV['SECRET_KEY']
  Stripe.api_key = ENV['SECRET_KEY']
else
  Stripe.api_key = Rails.application.credentials.dig(:stripe, :secret)
end
