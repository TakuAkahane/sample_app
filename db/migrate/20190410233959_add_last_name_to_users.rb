class AddLastNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :last_name, :string, comment: '姓', limit: 30
    add_column :users, :first_name, :string, comment: '名', limit: 30
  end
end
