class AddEsBodyToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :es_body, :json
  end
end
