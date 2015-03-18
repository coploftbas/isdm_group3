class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_name
      t.integer :created_by
      t.integer :delete_flg
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
