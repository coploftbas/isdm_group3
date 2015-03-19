ActiveAdmin.register Prerequisite do


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
    column :document_id_id
    column :prerequisite_id_id
    actions
  end

  form do |f|
    f.inputs "Prerequisite Details" do
      f.input :document_id_id
      f.input :prerequisite_id_id
    end
    f.actions
  end


  permit_params :id, :document_id_id, :prerequisite_id_id

end
