class Farm::OrdersController < Farm::ApplicationController

  def create
    @order = Farm::Order.new(order_params)
    if @order.valid?
      Farm::SellerMailer.order_email(farm_products_in_cart).deliver_now
      # TODO
      #Farm::UserMailer.order_email(farm_products_in_cart).deliver_now
      respond_to do |format|
        format.js {render 'create_success'}
      end
      session.delete 'cart_product_hashes'
    else 
      respond_to do |format|
        format.js {render 'create_fail'}
      end
    end
  end

  private

  def order_params
    params.require(:farm_order).permit(:name, :phone, :address, :email)
  end

end
