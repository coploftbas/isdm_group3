ActiveAdmin.register DocumentVersion do


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
    column :document_name
    #column :version_document_name
    #column :file_location
    #column :created_by_id
    column :updated_by_id
    column :document_id_id
    column :project_id
    column :version
    actions
  end

  form do |f|
    f.inputs "Document Version Details" do
      f.input :document_name
      f.input :updated_by_id
      f.input :document_id_id
      f.input :project_id
      f.input :version
    end
    f.actions
  end


  permit_params :id, :document_name, :version_document_name, :file_location, :comment, :created_by_id, :created_at, :updated_by_id, :updated_at, :document_id_id, :project_id, :version

end
