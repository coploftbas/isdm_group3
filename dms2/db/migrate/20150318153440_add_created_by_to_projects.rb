class AddCreatedByToProjects < ActiveRecord::Migration
  def change
    add_reference :projects, :created_by, index: true
  end
end
