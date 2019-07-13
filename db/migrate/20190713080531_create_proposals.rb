class CreateProposals < ActiveRecord::Migration[5.2]
  def change
    create_table :proposals do |t|
      t.integer :proposing_user_parent_id, comment: '提案側ユーザID', :null => false
      t.integer :receiving_user_parent_id, comment: '受領側ユーザID', :null => false
      t.integer :recommend_id, comment: 'レコメンドID', :null => false
      t.integer :property_id, comment: '物件ID', :null => false
      t.string :proposal_status, comment: '提案ステータス', :null => false

      t.timestamps
    end
  end
end
