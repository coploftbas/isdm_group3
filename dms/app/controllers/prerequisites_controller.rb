class PrerequisitesController < InheritedResources::Base

  private

    def prerequisite_params
      params.require(:prerequisite).permit(:document_id, :prerequisite_id)
    end
end

