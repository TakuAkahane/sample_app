class AddTelToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :tel, :integer, comment: '電話番号'
    add_column :users, :display_name, :string, comment: '表示名', limit: 30
    add_column :users, :password, :string, comment: 'パスワード', limit: 50
  end
end
