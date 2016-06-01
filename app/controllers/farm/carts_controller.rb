class Farm::CartsController < Farm::ApplicationController
  def create
    product_id = params[:product_id]
    (session['cart_product_hashes'] ||= {}).tap do |cph|
      if cph.key? product_id
        cph[product_id] += 1
      else
        cph[product_id] = 1
      end
    end
  end

  def show
    @products = farm_products_in_cart
  end
end
