ActiveAdmin.register User do


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
     column :email
     column :firstname
     column :lastname
     column :user_type_id_id
     column :delete_flg
     actions
  end

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :password
      f.input :firstname
      f.input :lastname
      f.input :user_type_id_id
      f.input :delete_flg
    end
    f.actions
  end

  permit_params  :email, :password, :firstname, :lastname, :delete_flg , :user_type_id_id

end
