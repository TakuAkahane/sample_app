class AddDbAuthRegistrationCompletedToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :db_auth_registration_completed, :boolean, comment: 'DB認証利用ユーザ登録フラグ'
  end
end
