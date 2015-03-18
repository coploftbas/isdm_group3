class CreatePrerequisites < ActiveRecord::Migration
  def change
    create_table :prerequisites do |t|
      t.integer :document_id
      t.integer :prerequisite_id

      t.timestamps
    end
  end
end
