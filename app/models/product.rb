class Product < ApplicationRecord
  #store :properties, accessors: [ :color, :voltage ]#, coder: JSON
  after_save :store_in_es

  def store_in_es
    self.update_column :es_response, $client.index(index: es_index, type: es_type, id: id, body: es_body)
  end

  def self.reindex!
    Product.all.each do |p|
      p.store_in_es
    end
    true
  end

end
