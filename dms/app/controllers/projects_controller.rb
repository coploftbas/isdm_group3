class ProjectsController < InheritedResources::Base

  private

    def project_params
      params.require(:project).permit(:project_name, :created_by, :delete_flg, :start_date, :end_date)
    end
end

