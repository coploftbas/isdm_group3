json.array!(@document_versions) do |document_version|
  json.extract! document_version, :id, :document_id, :document_name, :version_document_name, :file_location, :comment, :created_by, :updated_by
  json.url document_version_url(document_version, format: :json)
end
