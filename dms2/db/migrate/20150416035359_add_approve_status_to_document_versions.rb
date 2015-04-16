class AddApproveStatusToDocumentVersions < ActiveRecord::Migration
  def change
    add_column :document_versions, :approveStatus, :string
  end
end
