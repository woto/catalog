class Farm::SearchController < Farm::ApplicationController

  before_action :store_location

  PER_PAGE = 18

  def index

    if params[:category_id]
      @category = Tree.find(params[:category_id])
    else
      @category = categories_root
    end

    store_category_id()

    @option_titles = @category.es_body['options']

    if @option_titles
      @option_values = {}
      @option_titles.each do |option_title|
        if params[option_title]
          @option_values[option_title] = Tree.find(params[option_title])
        end
      end
    end

    if params[:min_price]
      @min_price = params[:min_price].to_i
    end

    if params[:max_price]
      @max_price = params[:max_price].to_i
    end

    body = {
      aggregations: {
        max_price: {
          filter: {},
          aggregations: {
            max_price: {
              max: { 
                field: "price" 
              }
            }
          }
        },
        min_price: {
          filter: {},
          aggregations: {
            min_price: {
              min: { 
                field: "price" 
              }
            }
          }
        },
        category_ids: {
          filter: {},
          aggregations: {
            category_ids: {
              terms: {
                field: "category_ids",
                size: 100
              }
            }
          }
        }
      }
    }

    @option_titles.each do |option_title|
      body[:aggregations][option_title] = {
        filter: {},
        aggregations: {
          option_title => {
            terms: {
              field: option_title,
              size: 100
            }
          }
        }
      }
    end if @option_titles

    @option_titles.each do |option_title|

      if @option_values[option_title]

        add_filters_for_aggregations(body, :category_ids,
          terms: { option_title => @option_values[option_title].map(&:id) })

        add_filters_for_aggregations(body, :min_price,
          terms: { option_title => @option_values[option_title].map(&:id) })

        add_filters_for_aggregations(body, :max_price,
          terms: { option_title => @option_values[option_title].map(&:id) })

        other_option_titles = @option_titles - [option_title]

        other_option_titles.each do |other_option_title|
          add_filters_for_aggregations(body, other_option_title,
            terms: { option_title => @option_values[option_title].map(&:id) })
        end if other_option_titles

        add_post_filters(body,
          terms: { option_title => @option_values[option_title].map(&:id) })

      end


    end if @option_titles

    if @category

      add_filters_for_aggregations(body, :min_price,
        term: { category_ids: @category.id })

      add_filters_for_aggregations(body, :max_price,
        term: { category_ids: @category.id })

      @option_titles.each do |option_title|
        add_filters_for_aggregations(body, option_title,
          term: { category_ids: @category.id })
      end if @option_titles

      add_post_filters(body,
        term: { category_ids: @category.id })
    end

    if @min_price

      add_filters_for_aggregations(body, :category_ids,
        range: { price: { gte: @min_price }})

      @option_titles.each do |option_title|
        add_filters_for_aggregations(body, option_title,
          range: { price: { gte: @min_price }})
      end if @option_titles

      add_post_filters(body,
        range: { price: { gte: @min_price }})
    end

    if @max_price

      add_filters_for_aggregations(body, :category_ids,
        range: { price: { lte: @max_price }})

      @option_titles.each do |option_title|
        add_filters_for_aggregations(body, option_title,
          range: { price: { lte: @max_price }})
      end if @option_titles

      add_post_filters(body,
        range: { price: { lte: @max_price }})

    end

    if params[:q].present?
      body.deep_merge!({
        query: {
          bool: {
            must: {
              match: {title: params[:q]}
            }
          }
        }
      })
    end

    page = params.fetch(:page, '1').to_i - 1
    result = $client.search({index: 'farm', body: body, size: PER_PAGE, from: page * PER_PAGE})

    @category_ids_buckets = result['aggregations']['category_ids']['category_ids']['buckets']
    @option_buckets = {}
    @option_titles.each do |option_title|
      @option_buckets[option_title] = result['aggregations'][option_title][option_title]['buckets']
    end if @option_titles
    @min_price_range = result['aggregations']['min_price']
    @max_price_range = result['aggregations']['max_price']

    @products = Kaminari.paginate_array(result['hits']['hits'], total_count: result['hits']['total']).page(params[:page]).per(PER_PAGE)

    respond_to do |format|
      format.html
      format.js
    end

  end

  private

  def add_filters_for_aggregations(body, aggregation_name, condition)
    body[:aggregations][aggregation_name][:filter] ||= {}
    body[:aggregations][aggregation_name][:filter][:bool] ||= {}
    body[:aggregations][aggregation_name][:filter][:bool][:must] ||= []
    body[:aggregations][aggregation_name][:filter][:bool][:must] << condition
  end

  def add_post_filters(body, condition)
    body[:filter] ||= {}
    body[:filter][:bool] ||= {}
    body[:filter][:bool][:must] ||= []
    body[:filter][:bool][:must] << condition
  end

  def store_location
    session[:previous_url] = request.fullpath
  end

  def store_category_id
    session[:category_id] = @category.id if @category
  end

end
