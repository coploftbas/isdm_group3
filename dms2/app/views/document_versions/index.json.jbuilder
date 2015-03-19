json.array!(@document_versions) do |document_version|
  json.extract! document_version, :id, :document_name, :version_document_name, :file_location, :comment, :created_by_id, :updated_by_id, :document_id_id
  json.url document_version_url(document_version, format: :json)
end
