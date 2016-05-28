class Farm::AnimalsController < Farm::ApplicationController

  PER_PAGE = 15

  def show
    @animal = animals_root.children.where("es_body ->> 'title' = ?", params[:id]).first

    body = {
      aggregations: {
        category_ids: {
          terms: {
            field: "category_ids"
          }
        },
        animal_ids: {
          terms: {
            field: "animal_ids"
          }
        }
      },
      query: {
        bool: {
          filter: {
            term: {
              animal_ids: @animal.id
            }
          }
        }
      }
    }

    page = params.fetch(:page, '1').to_i - 1
    result = $client.search({index: 'farm', body: body, size: PER_PAGE, from: page * PER_PAGE})

    @category_ids_buckets = result['aggregations']['category_ids']['buckets']
    @animal_ids_buckets = result['aggregations']['animal_ids']['buckets']

    @products = Kaminari.paginate_array(result['hits']['hits'], total_count: result['hits']['total']).page(params[:page]).per(PER_PAGE)
    render 'search/index'
  end
end
