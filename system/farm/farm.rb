#!/usr/bin/env ruby
require File.expand_path('../../../config/environment',  __FILE__)
require 'csv'

TREE_INDEX = 'farm'
TREE_TYPE = 'category_ids'

PROD_INDEX = 'farm'
PROD_TYPE = 'products'

ANIM_INDEX = 'farm'
ANIM_TYPE = 'animal_ids'

root = Tree.roots.where(es_index: TREE_INDEX, es_type: TREE_TYPE).first
if root == nil
  root = Tree.create!(es_index: TREE_INDEX, es_type: TREE_TYPE)
end

category = nil
CSV.foreach('farm.csv') do |row|
  next if $. <= 22
  # У категории в прайсе все поля nil за исключением 1-ого
  # Создаем или находим и запоминаем категорию
  if row[0] == nil && row[1] != nil && row[2] == nil && row[3] == nil
    category = root.children.where("es_body ->> 'title' = ?", row[1]).where(es_index: TREE_INDEX, es_type: TREE_TYPE).first
    if category == nil
      hash = {
        es_index: TREE_INDEX,
        es_type: TREE_TYPE,
        es_body: {
          title: row[1]
        },
        parent: root
      }
      category = Tree.create!(hash)
    end
  else
    # Если нет товара с таким названием
    product = Product.where("es_body ->> 'title' = ?", row[1]).where(es_index: PROD_INDEX, es_type: PROD_TYPE).first

    animal_ids = []

    if row[5] == '1'
      animal_ids << Tree.where("es_body ->> 'title' = ?", 'Куры').where(es_index: ANIM_INDEX, es_type: ANIM_TYPE).first.id
    end

    if row[6] == '1'
      animal_ids << Tree.where("es_body ->> 'title' = ?", 'Гуси, утки').where(es_index: ANIM_INDEX, es_type: ANIM_TYPE).first.id
    end

    if row[7] == '1'
      animal_ids << Tree.where("es_body ->> 'title' = ?", 'Перепела').where(es_index: ANIM_INDEX, es_type: ANIM_TYPE).first.id
    end

    if row[8] == '1'
      animal_ids << Tree.where("es_body ->> 'title' = ?", 'Индейки').where(es_index: ANIM_INDEX, es_type: ANIM_TYPE).first.id
    end

    if row[9] == '1'
      animal_ids << Tree.where("es_body ->> 'title' = ?", 'Свиньи').where(es_index: ANIM_INDEX, es_type: ANIM_TYPE).first.id
    end

    if row[10] == '1'
      animal_ids << Tree.where("es_body ->> 'title' = ?", 'Крупный рогатый скот, козы, овцы').where(es_index: ANIM_INDEX, es_type: ANIM_TYPE).first.id
    end

    if row[11] == '1'
      animal_ids << Tree.where("es_body ->> 'title' = ?", 'Кролики, нутрии').where(es_index: ANIM_INDEX, es_type: ANIM_TYPE).first.id
    end
    
    if product == nil
      hash = {
        es_index: PROD_INDEX,
        es_type: PROD_TYPE,
        es_body: {
          category_ids: [root.id, category.id],
          title: row[1],
          price: row[2].gsub(',','').to_i, # 2,250.00 руб -> 2250
          unit: row[3],
        }
      }

      if animal_ids
      hash[:es_body].merge!(animal_ids: animal_ids)
      end

      product = Product.create!(hash)
    end

  end
end
