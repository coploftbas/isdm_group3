json.array!(@projects) do |project|
  json.extract! project, :id, :project_name, :created_by, :delete_flg, :start_date, :end_date
  json.url project_url(project, format: :json)
end
