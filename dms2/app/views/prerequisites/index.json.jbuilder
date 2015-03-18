json.array!(@prerequisites) do |prerequisite|
  json.extract! prerequisite, :id, :document_id_id, :prerequisite_id_id
  json.url prerequisite_url(prerequisite, format: :json)
end
