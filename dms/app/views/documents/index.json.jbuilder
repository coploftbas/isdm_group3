json.array!(@documents) do |document|
  json.extract! document, :id, :document_name, :comment, :file_location, :created_by, :updated_by, :project_id
  json.url document_url(document, format: :json)
end
