class DocumentVersionsController < InheritedResources::Base

  private

    def document_version_params
      params.require(:document_version).permit(:document_id, :document_name, :version_document_name, :file_location, :comment, :created_by, :updated_by)
    end
end

