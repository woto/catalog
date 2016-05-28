class CreateIndices < ActiveRecord::Migration[5.0]
  def change
    create_table :indices do |t|
      t.json :es_body

      t.timestamps
    end
  end
end
