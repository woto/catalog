class Farm::BuyerMailer < ApplicationMailer

  def order_email(products, order, session_hash, farm_total_cost_of_products_in_cart)
    @products = products
    @order = order
    @session_hash = session_hash
    @farm_total_cost_of_products_in_cart = farm_total_cost_of_products_in_cart
    mail(to: 'info@podychevo.ru', subject: 'Заказ podychevo.ru')
  end

end
