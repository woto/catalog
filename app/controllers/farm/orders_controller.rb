class Farm::OrdersController < Farm::ApplicationController
  def create
    @order = Farm::Order.new(order_params)
    if @order.valid?
      raise 'a'
    else 
      @products = farm_products_in_cart
      render 'farm/carts/show'
    end
  end

  private

  def order_params
    params.require(:farm_order).permit(:name, :phone, :address)
  end
end
