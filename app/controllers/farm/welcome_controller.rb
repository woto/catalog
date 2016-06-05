class Farm::WelcomeController < Farm::ApplicationController

  def index
    @categories = categories_root.children

    body = {
      aggregations: {
        "animal_ids": {
          terms: {
            field: "properties.animal_ids"
          }
        }
      }
    }

    result = $client.search({index: 'farm', body: body, size: 0})
    buckets = result['aggregations']['animal_ids']['buckets']

    @animals = Tree.find(buckets.map{|bucket| bucket['key']}).
      map{|animal| [
        animal,
        buckets.find{|bucket| bucket['key'] == animal.id}['doc_count']]}

  end

end
