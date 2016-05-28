#!/usr/bin/env ruby
require File.expand_path('../../config/environment',  __FILE__)
require 'csv'
CSV.foreach('market_categories.csv') do |row|
  path = row[0].split('/')
  Category.find_or_create_by_path(path)
end
