class DocumentVersion < ActiveRecord::Base
  belongs_to :created_by
  belongs_to :updated_by
  belongs_to :document_id
end
