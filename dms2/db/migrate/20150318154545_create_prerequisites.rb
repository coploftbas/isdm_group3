class CreatePrerequisites < ActiveRecord::Migration
  def change
    create_table :prerequisites do |t|
      t.references :document_id, index: true
      t.references :prerequisite_id, index: true

      t.timestamps
    end
  end
end
