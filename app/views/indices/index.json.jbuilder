json.array!(@indices) do |index|
  json.extract! index, :id, :es_body
  json.url index_url(index, format: :json)
end
