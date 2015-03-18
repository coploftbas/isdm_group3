class PrerequisitesController < InheritedResources::Base

  private

    def prerequisite_params
      params.require(:prerequisite).permit(:document_id_id, :prerequisite_id_id)
    end
end

