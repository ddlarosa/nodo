json.array!(@node_results) do |node_result|
  json.extract! node_result, :id, :node_id, :mac, :singal_db, :firsttime, :lasttime
  json.url node_result_url(node_result, format: :json)
end
