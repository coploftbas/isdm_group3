class RolesController < InheritedResources::Base

  private

    def role_params
      params.require(:role).permit(:role_name)
    end
end

