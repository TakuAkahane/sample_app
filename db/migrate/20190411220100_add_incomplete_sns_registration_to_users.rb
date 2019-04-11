class AddIncompleteSnsRegistrationToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :incomplete_sns_registration, :boolean, comment: 'snsを使った会員登録プロセスフラグ'
  end
end
