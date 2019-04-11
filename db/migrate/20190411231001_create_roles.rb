class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.string :name, limit: 30, comment: '権限名（システム）'
      t.string :title, limit: 30, comment: '権限名（日本語）'
      t.text :description, comment: '権限の概要'
      t.text :the_role, comment: '権限設定'
      t.integer :parent_id, comment: '権限の親ID'
      t.string :account_type, comment: 'アカウント種類'
      t.boolean :default_corporate, limit: 30, comment: 'デフォルト設定（会社）'
      t.boolean :default_individual, comment: 'デフォルト設定（個人）'

      t.timestamps
    end
  end
end
