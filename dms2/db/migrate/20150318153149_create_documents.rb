class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.text :comment
      t.text :file_location
      t.references :created_by, index: true
      t.references :updated_by, index: true
      t.references :project_id, index: true

      t.timestamps
    end
  end
end
