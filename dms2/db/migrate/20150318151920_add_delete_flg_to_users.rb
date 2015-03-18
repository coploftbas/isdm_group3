class AddDeleteFlgToUsers < ActiveRecord::Migration
  def change
    add_column :users, :delete_flg, :integer
  end
end
