class ChangeDatatypeTelOfUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :tel, :string, limit: 45, comment: '電話番号'
  end
end
