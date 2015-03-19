class RemoveCreatedByFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :created_by, :integer
  end
end
