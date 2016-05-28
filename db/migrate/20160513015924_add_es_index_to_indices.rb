class AddEsIndexToIndices < ActiveRecord::Migration[5.0]
  def change
    add_column :indices, :es_index, :string
  end
end
