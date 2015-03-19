json.array!(@documents) do |document|
  json.extract! document, :id, :name, :comment, :file_location, :created_by_id, :updated_by_id, :project_id_id
  json.url document_url(document, format: :json)
end
