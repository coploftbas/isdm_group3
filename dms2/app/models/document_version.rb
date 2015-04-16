class DocumentVersion < ActiveRecord::Base
  belongs_to :user
  #belongs_to :updated_by
  belongs_to :document

  #before_save :renameFile

  has_attached_file :file,
                    :path => ":rails_root/public/documents/:id/:filename",
                    :url  => "/documents/:id/:filename"
  do_not_validate_attachment_file_type :file

  def setDocumentName(name)
    @thisName = name.to_s
    extension = File.extname(file_file_name).downcase
    self.file.instance_write :file_name, "#{@thisName.to_s}#{extension}"
  end

=begin
  def renameFile
    
  end
=end

end
