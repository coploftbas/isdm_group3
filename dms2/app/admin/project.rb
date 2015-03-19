ActiveAdmin.register Project do


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
    column :project_name
    column :created_by_id
    column :created_at
    column :start_date
    column :end_date
    column :delete_flg
    actions
  end

  form do |f|
    f.inputs "Project Details" do
      f.input :project_name
      f.input :created_by_id
      f.input :created_at
      f.input :start_date
      f.input :end_date
      f.input :delete_flg
    end
    f.actions
  end

  permit_params :project_name, :created_by_id, :delete_flg, :created_at, :start_date, :end_date


end