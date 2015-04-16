class AddRemarkToDocumentVersion < ActiveRecord::Migration
  def change
    add_column :document_versions, :remark, :string
  end
end
