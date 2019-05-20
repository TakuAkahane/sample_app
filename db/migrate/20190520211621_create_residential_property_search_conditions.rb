class CreateResidentialPropertySearchConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :residential_property_search_conditions do |t|
      t.integer :user_id, length: 11, comment: 'ユーザID'
      t.text :params, comment: 'パラメータ'

      t.timestamps
    end
  end
end
