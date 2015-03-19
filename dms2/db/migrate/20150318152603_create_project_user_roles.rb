class CreateProjectUserRoles < ActiveRecord::Migration
  def change
    create_table :project_user_roles do |t|
      t.references :user_id, index: true
      t.references :role_id, index: true
      t.references :project_id, index: true

      t.timestamps
    end
  end
end
