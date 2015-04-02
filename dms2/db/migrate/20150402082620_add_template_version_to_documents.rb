class AddTemplateVersionToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :templateVersion, :text
  end
end
