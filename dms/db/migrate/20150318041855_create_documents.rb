class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :document_name
      t.text :comment
      t.text :file_location
      t.integer :created_by
      t.integer :updated_by
      t.integer :project_id

      t.timestamps
    end
  end
end
