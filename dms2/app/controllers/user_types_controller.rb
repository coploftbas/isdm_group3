class UserTypesController < InheritedResources::Base

  private

    def user_type_params
      params.require(:user_type).permit(:designation)
    end
end

