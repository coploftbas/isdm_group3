class CreateDocumentVersions < ActiveRecord::Migration
  def change
    create_table :document_versions do |t|
      t.integer :document_id
      t.text :document_name
      t.text :version_document_name
      t.text :file_location
      t.text :comment
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
