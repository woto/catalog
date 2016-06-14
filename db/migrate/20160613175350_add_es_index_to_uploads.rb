class AddEsIndexToUploads < ActiveRecord::Migration[5.0]
  def change
    add_column :uploads, :es_index, :string
  end
end
