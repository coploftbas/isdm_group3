class ProjectUserRole < ActiveRecord::Base
  belongs_to :user_id
  belongs_to :role_id
  belongs_to :project_id
end
