json.array!(@nodes) do |node|
  json.extract! node, :id, :mac, :name, :location
  json.url node_url(node, format: :json)
end
