Rails.application.routes.draw do

  root 'projects#index'

  devise_for :users

  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  resources :prerequisites

  resources :document_versions

  resources :documents

  resources :project_user_roles

  resources :user_types

  resources :roles

  resources :projects

  get 'set_active' => 'projects#set_active', as: :projects_set_active
  get 'set_deactive' => 'projects#set_deactive', as: :projects_set_deactive

  get 'set_active_manager' => 'projects#set_active_manager', as: :projects_set_active_manager
  get 'set_deactive_manager' => 'projects#set_deactive_manager', as: :projects_set_deactive_manager

  get 'projects/:id/assign_role' => 'projects#assign_role', as: :projects_assign_role

  get 'new_document_version/:projectId/:docId' => 'document_versions#new', as: :newDocVer
  get 'view_document_version/:projectId/:docId' => 'document_versions#index', as: :docVer

  get 'upload_document' => 'projects#upload_doc'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
