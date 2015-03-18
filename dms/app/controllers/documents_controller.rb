class DocumentsController < InheritedResources::Base

  private

    def document_params
      params.require(:document).permit(:document_name, :comment, :file_location, :created_by, :updated_by, :project_id)
    end
end

