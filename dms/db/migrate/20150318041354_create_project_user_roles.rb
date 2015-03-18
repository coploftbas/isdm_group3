class CreateProjectUserRoles < ActiveRecord::Migration
  def change
    create_table :project_user_roles do |t|
      t.integer :user_id
      t.integer :role_id
      t.integer :project_id

      t.timestamps
    end
  end
end
