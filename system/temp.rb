#!/usr/bin/env ruby
require File.expand_path('../../config/environment',  __FILE__)

Product.all.each do |product|
  hash = {}
  hash['home_animal_ids'] = product.es_body['home_animal_ids']
  hash['animal_ids'] = product.es_body['animal_ids']
  hash['weight_ids'] = product.es_body['weight_ids']
  product.es_body.except!(*hash.keys)
  hash.delete_if{|k, v| v.blank?}
  product.es_body['properties'] = hash
  product.save!
end
