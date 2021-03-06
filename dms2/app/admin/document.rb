ActiveAdmin.register Document do


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
    column :name
    #column :project_id
    #column :comment
    column :file_location
    #column :created_by_id
    column :created_at
    #column :updated_by_id
    column :updated_at
    column :templateVersion
    actions
  end

  form do |f|
    f.inputs "Document Version Details" do
      f.input :name
      f.input :file_location
      f.input :templateVersion
      f.input :comment
    end
    f.actions
  end


  permit_params :name, :comment, :file_location, :created_by_id, :created_at, :updated_by_id, :updated_at, :project_id, :templateVersion

end
