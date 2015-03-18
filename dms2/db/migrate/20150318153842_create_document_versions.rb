class CreateDocumentVersions < ActiveRecord::Migration
  def change
    create_table :document_versions do |t|
      t.string :document_name
      t.string :version_document_name
      t.text :file_location
      t.text :comment
      t.references :created_by, index: true
      t.references :updated_by, index: true
      t.references :document_id, index: true

      t.timestamps
    end
  end
end
