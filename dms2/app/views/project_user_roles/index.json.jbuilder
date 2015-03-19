json.array!(@project_user_roles) do |project_user_role|
  json.extract! project_user_role, :id, :user_id_id, :role_id_id, :project_id_id
  json.url project_user_role_url(project_user_role, format: :json)
end
