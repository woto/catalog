class AddEsResponseToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :es_response, :json
  end
end
