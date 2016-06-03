class Farm::SellerMailer < Farm::ApplicationMailer

  def order_email(products)
    mail(to: 'info@podychevo.ru', subject: 'Заказ podychevo.ru')
  end

end
