class AddParentIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :parent_id, :integer, length: 11, comment: '親ユーザID'
  end
end
