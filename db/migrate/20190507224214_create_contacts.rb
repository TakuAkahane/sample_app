class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :inquirytype, limit: 30, comment: '問い合わせ種類'
      t.string :company, limit: 50, comment: '会社名'
      t.string :first_name, limit: 30, comment: '姓'
      t.string :last_name, limit: 30, comment: '名'
      t.string :email, comment: 'メールアドレス'
      t.string :tel, limit: 11, comment: '電話番号'
      t.text :content, comment: '問い合わせ内容'

      t.timestamps
    end
  end
end
