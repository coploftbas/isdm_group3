class AddUserTypeIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_type_id, :integer
  end
end
