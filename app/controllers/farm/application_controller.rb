class Farm::ApplicationController < ApplicationController
  prepend_view_path 'app/views/farm'
  helper_method :categories_root, :options_root

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

  
end
