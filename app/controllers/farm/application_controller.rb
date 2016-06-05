class Farm::ApplicationController < ApplicationController
  prepend_view_path 'app/views/farm'
  helper_method :categories_root, :options_root, :farm_products_in_cart, :farm_product_in_cart?, :farm_total_cost_of_products_in_cart

  private
  
  def categories_root
    Tree.roots.where(es_index: 'farm', es_type: 'category_ids').first
  end

  def options_root(option_title)
    Tree.roots.where(es_index: 'farm', es_type: option_title).first
  end

  def farm_products
    Product.where(es_index: 'farm', es_type: 'products')
  end

  def farm_products_in_cart
    if session['cart_product_hashes']
      farm_products.where(id: session['cart_product_hashes'].keys)
    else
      farm_products.none
    end
  end

  def farm_product_in_cart?(id)
    session[:cart_product_hashes] && session[:cart_product_hashes].key?(id.to_s)
  end

  def farm_total_cost_of_products_in_cart
    farm_products_in_cart.sum do |product|
      product.es_body['price'] * session['cart_product_hashes'][product.id.to_s]
    end
  end

end
