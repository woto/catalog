class AddElascticsearchFieldsToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :es_index, :string
    add_column :products, :es_type, :string
    add_column :products, :es_body, :json
  end
end
