json.array!(@project_user_roles) do |project_user_role|
  json.extract! project_user_role, :id, :user_id, :role_id, :project_id
  json.url project_user_role_url(project_user_role, format: :json)
end
