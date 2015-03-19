class DocumentVersionsController < InheritedResources::Base

  private

    def document_version_params
      params.require(:document_version).permit(:document_name, :version_document_name, :file_location, :comment, :created_by_id, :updated_by_id, :document_id_id)
    end
end

