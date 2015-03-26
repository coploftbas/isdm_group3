class AddProjectToDocumentVersions < ActiveRecord::Migration
  def change
    add_reference :document_versions, :project, index: true
  end
end
