ActiveAdmin.register ProjectUserRole do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  index do
    column :id
    column :project_id_id
    column :user_id_id
    column :role_id_id
    actions
  end

  form do |f|
    f.inputs "ProjectUserRoles Details" do
      f.input :project_id_id
      f.input :user_id_id
      f.input :role_id_id
    end
    f.actions
  end

  permit_params :user_id_id, :project_id_id, :role_id_id

end
