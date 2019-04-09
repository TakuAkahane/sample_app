class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :provider, :string, comment: 'omniauth判定用'
    add_column :users, :uuid, :string, comment: 'user id'
    add_column :users, :name, :string, comment: 'ユーザ名'
  end
end
