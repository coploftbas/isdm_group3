class AddVersionToDocumentVersions < ActiveRecord::Migration
  def change
    add_column :document_versions, :version, :integer
  end
end
