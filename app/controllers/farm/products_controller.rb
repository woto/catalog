class Farm::ProductsController < Farm::ApplicationController

  before_action :history_routines

  def show

    @product = Product.find(params[:id])

    fill_breadcrumbs()

    #if @product.es_body['animal_ids']
    #  @animals = animals_root.children.find(@product.es_body['animal_ids'])
    #end

    body = {
      aggregations: {
        category_ids: {
          terms: {
            field: "category_ids",
            size: 100
          }
        }
      }
    }

    result = $client.search({index: 'farm', body: body})
    @category_ids_buckets = result['aggregations']['category_ids']['buckets']
  end

  private

  def history_routines
    session['history_product_ids'] ||= []
    session['history_product_ids'] |= [params[:id]]
    session['history_product_ids'] = session['history_product_ids'].last(30)
    @history_products = farm_products.where(id: session['history_product_ids'])
  end

  def fill_breadcrumbs
    category_ids = @product.es_body['category_ids']
    @breadcrumbs = []
    leaves = Tree.leaves.with_ancestor(categories_root).where(id: @product.es_body['category_ids'])
    leaves.each do |leaf|
      @breadcrumbs << leaf.self_and_ancestors.reverse_order
    end

    if session[:category_id]
      @breadcrumbs.each_with_index do |breadcrumb, index|
        if breadcrumb.map{|b| b.id}.include? session[:category_id]
          primary = @breadcrumbs.delete_at(index)
          @breadcrumbs.unshift primary
          break
        end
      end
    end
  end
end
