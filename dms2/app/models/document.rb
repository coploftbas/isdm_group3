class Document < ActiveRecord::Base
  belongs_to :created_by
  belongs_to :updated_by
  belongs_to :project_id
end
