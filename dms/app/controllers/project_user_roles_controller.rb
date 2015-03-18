class ProjectUserRolesController < InheritedResources::Base

  private

    def project_user_role_params
      params.require(:project_user_role).permit(:user_id, :role_id, :project_id)
    end
end

