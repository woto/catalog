class Index < ApplicationRecord

  after_create :create_in_es
  after_destroy :destroy_in_es

  private

  def create_in_es
    $client.indices.create index: es_index, body: es_body
  end

  def destroy_in_es
    $client.indices.delete index: es_index
  end

end
