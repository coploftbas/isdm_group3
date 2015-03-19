class DocumentsController < InheritedResources::Base

  private

    def document_params
      params.require(:document).permit(:name, :comment, :file_location, :created_by_id, :updated_by_id, :project_id_id)
    end
end

