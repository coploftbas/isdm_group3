json.array!(@prerequisites) do |prerequisite|
  json.extract! prerequisite, :id, :document_id, :prerequisite_id
  json.url prerequisite_url(prerequisite, format: :json)
end
