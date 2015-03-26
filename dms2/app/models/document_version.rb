class DocumentVersion < ActiveRecord::Base
  belongs_to :user
  #belongs_to :updated_by
  belongs_to :document
  has_attached_file :file,
                    :path => ":rails_root/public/documents/:id/:filename",
                    :url  => "/documents/:id/:filename"
  do_not_validate_attachment_file_type :file
end
