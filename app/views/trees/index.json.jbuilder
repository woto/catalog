json.array!(@trees) do |tree|
  json.extract! tree, :id, :es_index, :es_type, :es_body, :parent_id
  json.url tree_url(tree, format: :json)
end
