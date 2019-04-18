class CreateSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :settings do |t|
      t.string :site_title, comment: 'サイトタイトル', limit: 50
      t.boolean :maintenance_mode_flg, comment: 'メンテナンスモードフラグ'
      t.text :maintenance_description, comment: 'メンテナンス中の説明書き'
      t.string :allow_access_ip_under_maintenance, comment: 'メンテナンス中にアクセス出来るIP', limit: 15
      t.boolean :stop_send_mail_batch_flg, comment: 'メールバッチ送信停止フラグ'
      t.string :allow_access_system_admin_ip, comment: 'システムアドミンにアクセス出来るIP', limit: 15
      t.string :mail_from, comment: 'メール送信元アドレス', limit: 30
      t.string :mail_admin_to, comment: 'アドミンメールアドレス', limit: 30
      t.string :secretarist, comment: '事務局名', limit: 50
      t.text :mail_signature_default, comment: 'メール署名デフォルト'
      t.text :mail_signature_admin, comment: 'メール署名管理版'

      t.timestamps
    end
  end
end
