class CreatePropertyRecommends < ActiveRecord::Migration[5.2]
  def change
    create_table :property_recommends do |t|
      t.integer :user_parent_id, length: 11, comment: '親ユーザID'

      t.timestamps
    end
  end
end
