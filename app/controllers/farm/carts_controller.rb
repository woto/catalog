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

  def update

    product_id = params[:product_id]
    count = params[:count].to_i

    if count <= 0
      session['cart_product_hashes'].delete(product_id)
    else
      session['cart_product_hashes'][product_id] = count
      @sum =  params[:count].to_i * Product.find(product_id).es_body['price']
      @products = farm_products_in_cart
    end

    respond_to do |format|
      format.json
    end

  end

  def show
    @products = farm_products_in_cart
    @order = Farm::Order.new
  end

end
