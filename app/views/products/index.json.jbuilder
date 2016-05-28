json.array!(@products) do |product|
  json.extract! product, :id, :properties
  json.url product_url(product, format: :json)
end
