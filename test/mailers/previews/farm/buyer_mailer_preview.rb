# Preview all emails at http://localhost:3000/rails/mailers/farm/buyer_mailer
class Farm::BuyerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/farm/buyer_mailer/order_email
  def order_email
    Farm::BuyerMailer.order_email
  end

end
