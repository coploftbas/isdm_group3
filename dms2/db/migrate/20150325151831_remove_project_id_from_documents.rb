class RemoveProjectIdFromDocuments < ActiveRecord::Migration
  def change
    remove_reference :documents, :project_id, index: true
  end
end
