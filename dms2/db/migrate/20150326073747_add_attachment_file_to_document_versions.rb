class AddAttachmentFileToDocumentVersions < ActiveRecord::Migration
  def self.up
    change_table :document_versions do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :document_versions, :file
  end
end
