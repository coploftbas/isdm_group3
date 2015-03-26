class AddProjectToDocuments < ActiveRecord::Migration
  def change
    add_reference :documents, :project, index: true
  end
end
