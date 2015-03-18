class AddUserTypeIdToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :user_type_id, index: true
  end
end
