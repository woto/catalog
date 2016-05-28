class CreateTrees < ActiveRecord::Migration[5.0]
  def change
    create_table :trees do |t|
      t.string :es_index
      t.string :es_type
      t.json :es_body
      t.integer :parent_id, foreign_key: true

      t.timestamps
    end
  end
end
