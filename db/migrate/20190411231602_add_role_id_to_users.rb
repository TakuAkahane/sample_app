class AddRoleIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :role_id, :integer, length: 11, comment: '権限ID'
  end
end
